USE [CricketRec]
GO

/****** Object:  StoredProcedure [dbo].[LoadRecBallByBallFromOSA]    Script Date: 03/12/2016 17:45:14 ******/
DROP PROCEDURE [dbo].[LoadRecBallByBallFromOSA]
GO

/****** Object:  StoredProcedure [dbo].[LoadRecBallByBallFromOSA]    Script Date: 03/12/2016 17:45:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO










--exec LoadRecBallByBallFromOSA
--exec LoadFactBallByBall


CREATE proc [dbo].[LoadRecBallByBallFromOSA] as

--Get list of URLs for all matches not yet captured (and four most recent captured matches, which might still have been in play).
begin try drop table #url end try begin catch end catch

declare @LatestMatch int

select top 1 @LatestMatch = TestNum from (
select distinct top 1000
TestName
, TestNum = cast(replace(replace(TestName, 'Test # ',''),' - Live','') as int)
from CricketOSA.dbo.BallByBallUrlList l
join RecBallByBall r on l.url = r.url
order by cast(replace(replace(TestName, 'Test # ',''),' - Live','') as int) desc
) x
order by TestNum

select url, MatchNum
into #url
from CricketOSA.dbo.BallByBallUrlList l
where cast(replace(replace(TestName, 'Test # ',''),' - Live','') as int) >= @LatestMatch;


--Delete duplicates in OSA
with x as (select rn = row_number() over(partition by Url, rownum order by rownum) from CricketOSA.dbo.BallByBall)
delete from x where rn > 1


--Trash and reload table ready for data cleansing
truncate table CricketRec.dbo.BallByBallUpdated;

insert into CricketRec.dbo.BallByBallUpdated
select u.MatchNum, u.Innings, b.RowNum, b.Url, b.BallNum, b.bowler, b.batsman, b.result, b.commentary, b.nextcomms
from CricketOSA.dbo.BallByBall b
join CricketOSA.dbo.BallByBallUrlList u on b.url = u.url
join #url url on url.url = u.url

--Correct errors in source data
insert into BallByBallUpdated
select * from BallByBallToInsert
where url in (select url from #url)

update b
set b.Batsman = u.UpdateValue
from BallByBallUpdated b
join OSAUpdate u
	on b.MatchNum = u.MatchNum
	and b.innings = u.InningsNum
	and b.BallNum = u.BallNum
where u.UpdateColumn = 'Batsman'

update b
set b.Result = u.UpdateValue
from BallByBallUpdated b
join OSAUpdate u
	on b.MatchNum = u.MatchNum
	and b.innings = u.InningsNum
	and b.BallNum = u.BallNum
where u.UpdateColumn = 'Result'


--BallNum updates - to combine if regular
update CricketRec.dbo.BallByBallUpdated
set BallNum = '67.1'
where MatchNum = 742615 and Innings = 1 and RowNum = 2102
--end of ball num updates

update CricketRec.dbo.BallByBallUpdated
set Result = rtrim(replace(replace(replace(Result,char(9),''),char(10),''),char(13),''))

delete r from CricketRec.dbo.BallByBallUpdated r
join CricketRec.dbo.BallByBallToDelete d on r.RowNum = d.RowNum and r.Url = d.Url


--Trash and reload RecBallByBall_stage table
truncate table CricketRec.dbo.RecBallByBall_stage;

insert into CricketRec.dbo.RecBallByBall_stage
select
b.RowNum,
b.Url,
u.MatchNum,
u.Innings,
u.[Page],
cast(left(b.BallNum,charindex('.',b.BallNum) - 1) as int) + 1 as OverNum,
cast(right(b.BallNum,len(BallNum) - charindex('.',b.BallNum)) as int) as BallNumInOver,
b.BallNum,
b.Bowler,
null as BowlerScorecardName,
b.Batsman,
null as BatsmanScorecardName,
b.Result,
b.Commentary,
dbr.TeamRuns,
dbr.TeamWickets,
dbr.BatsmanRuns,
dbr.BowlerConceded,
dbr.BowlerWicket,
dbr.TeamWickets as BatsmanWicket,
dbr.Extras,
dbr.Byes,
dbr.LegByes,
dbr.Wides,
dbr.NoBalls,
dbr.PenaltyRuns,
dbr.BallCount,
null as WicketsLost,
null as NoBatsmenDuringWicket,
null as PartnershipNum,
null as BattingPartner,
'Striker' as BatterDismissed,
'OSA' as InsertedFrom,
null as UpdatedFrom,
null as UpdatedReason,
'N' as IssueDetected,
null as TotalRunsInOver,
null as TotalRunsInInnngs,
null as BatsmanRunsInInnings,
null as BowlerRunsInInnings,
null as ScorecardTotal,
null as ScorecardBatsmanTotal,
null as ScorecardBowlerTotal,
null as EndOfOverRunsInOver,
null as OverByOverRunsInOver,
null as InningsTotalMismatch,
null as BattingTotalMismatch,
null as BowlingTotalMismatch,
null as OverRunsMismatch,
null as BowlerWicketsToDate,
null as BowlerRunsConcededToDate,
null as BowlerDeliveriesToDate,
null as BowlerAsAtStrikeRate,
null as BowlerAsAtEconomy,
null as BatterAsAtRunRate ,
null as BatterAsAtDismissalRate
from CricketRec.dbo.BallByBallUpdated b
join CricketOSA.dbo.BallByBallUrlList u
on b.Url = u.Url
left join CricketOSA.dbo.DimBallResult dbr
on b.Result = dbr.Result;


--Update incorrect results (could be done sooner)
update r
set
r.Result = d.Result,
r.teamRuns = d.teamRuns,
r.TeamWickets = d.TeamWickets,
r.BatsmanRuns = d.BatsmanRuns,
r.BowlerConceded = d.BowlerConceded,
r.BowlerWicket = d.BowlerWicket,
r.Extras = d.Extras,
r.Byes = d.Byes,
r.LegByes = d.LegByes,
r.Wides = d.Wides,
r.NoBalls = d.NoBalls,
r.PenaltyRuns = d.PenaltyRuns,
r.BallCount = d.BallCount,
r.UpdatedFrom = 'BallByBallToUpdateResult Table',
r.UpdatedReason = u.UpdateReason
from CricketRec.dbo.BallByBallToUpdateResult u
join CricketRec.dbo.RecBallByBall_stage r
	on u.Url = r.Url and u.RowNum = r.RowNum
join CricketOSA.dbo.DimBallResult d
 on u.NewResult = d.Result;

--Delete duplicates
With x as (
	select MatchNum, Innings, BallNum, Result, Commentary, rn = row_number() over(partition by MatchNum, Innings, BallNum order by RowNum)
	from RecBallByBall_Stage
	where BallCount = 1
	and not (MatchNum = 64016 and Innings = 2 and BallNum = '20.2')
	)
delete
from x
where rn > 1


--Update batsman scorecard names
update r
set r.BatsmanScorecardName =
case 
when s2.MatchNum is not null then s2.PlayerName
when s.MatchNum is not null then s.PlayerName
when r.MatchNum = 239920 and r.Batsman = 'Singh' then 'VRV Singh'
when r.Batsman = 'Anwar Hossain' then 'Anwar Hossain Monir'
when r.Batsman = 'Singh' then 'RP Singh'
else null
end
from RecBallByBall_stage r
left join ScorecardBattingRow s
on s.MatchNum = r.MatchNum
and s.InningsNum = r.Innings
and s.CommentaryName = r.Batsman
left join ScorecardBattingRow s2
on s2.MatchNum = r.MatchNum
and s2.InningsNum = r.Innings
and s2.PlayerName = r.Batsman
where r.InsertedFrom = 'OSA';


--Update Bowler scorecard names
update b
set
b.BowlerScorecardName =
case 
when s2.MatchNum is not null then s2.Bowler
when s.MatchNum is not null then s.Bowler
when b.MatchNum = 239921 and b.Bowler = 'Singh' then 'VRV Singh'
when b.Bowler = 'Anwar Hossain' then 'Anwar Hossain Monir'
when b.Bowler = 'Singh' then 'RP Singh'
else null
end
from CricketRec.dbo.RecBallByBall_stage b
left join ScorecardBowlingRow s
on b.MatchNum = s.MatchNum
and b.Innings = s.InningsNum
and b.Bowler = s.CommentaryName
left join ScorecardBowlingRow s2
on b.MatchNum = s2.MatchNum
and b.Innings = s2.InningsNum
and b.Bowler = s2.Bowler
where b.InsertedFrom = 'OSA';


-- update for Retired (Out) dismissals
update RecBallByBall_stage
set TeamWickets = 1, BatsmanWicket = 1
where MatchNum = 63947 and Innings = 2 and OverNum in (82,96) and BallNumInOver = 6;

--update for handled ball dismissals
update RecBallByBall_Stage
set BowlerWicket = 0
where MatchNum = 63963 and Innings = 1 and OverNum = 68 and BallNumInOver = 1;

--Calculate number of wickets lost before delivery
with wl as (
select
WicketsLost,
TeamWickets,
sum(TeamWickets) over(partition by MatchNum, Innings order by OverNum, BallNumInOver, BallCount) as CalcWicketsLost
from CricketRec.dbo.RecBallByBall_stage bb
)
update wl
set WicketsLost = CalcWicketsLost - TeamWickets;


--Match Fall of Wicket ball num with ball num in Ball by Ball table
with errors as (
select f.MatchNum, f.InningsNum, OversBowled = ltrim(rtrim(f.OversBowled)), FallOfWicket, IsOut, f.MatchUrl, f.FullOversBowled
, f.SequenceNumber
, rn = row_number() over(order by f.MatchNum, f.InningsNum, FallOfWicket)
from FallOfWicket f
left join RecBallByBall_Stage b
	on b.MatchNum = f.MatchNum
	and b.Innings = f.InningsNum
	and b.BallNum = ltrim(rtrim(f.OversBowled))
	and (b.TeamWickets = 1 or f.IsOut = 'N')
where f.MatchNum in (select MatchNum from RecBallByBall_Stage)
and b.MatchNum is null
)

select 
e.MatchNum, e.InningsNum, e.SequenceNumber, e.FallOfWicket, e.OversBowled, e.IsOut, e.MatchUrl
, MinBallNum = min(r.BallNum), MaxBallNum = max(r.BallNum), TeamWickets = sum(TeamWickets)
, BallByBallOversBowledToUpdate =
	case
	when sum(TeamWickets) = 1 then max(r.BallNum)
	when sum(TeamWickets) = 2 then
		case
		when ABS(max(cast(rtrim(ltrim(OversBowled)) as numeric(5,2))) - max(cast(r.BallNum as numeric(5,2))))
		< ABS(max(cast(rtrim(ltrim(OversBowled)) as numeric(5,2))) - min(cast(r.BallNum as numeric(5,2))))
		then max(r.BallNum)
		else min(r.BallNum)
		end
	when e.MatchNum = 226371 then cast(cast(rtrim(ltrim(OversBowled)) as numeric(5,1)) + 1 as varchar(10))
	when e.MatchNum = 232615 then cast(cast(rtrim(ltrim(OversBowled)) as numeric(5,1)) + 2 as varchar(10))
	when e.MatchNum = 238180 then '99.2'
	when e.MatchNum = 64053 then '3.1'
	end
into #BallByBallOversBowled
from errors e
left join RecBallByBall_Stage r
	on r.MatchNum = e.MatchNum
	and r.Innings = e.InningsNum
	and e.FullOversBowled = r.OverNum - 1
	and TeamWickets = 1
group by
e.MatchNum, e.InningsNum, e.SequenceNumber, e.FallOfWicket, e.OversBowled, e.IsOut, e.MatchUrl

update f
set BallByBallOversBowled = coalesce(b.BallByBallOversBowledToUpdate,rtrim(ltrim(f.OversBowled)))
from FallOfWicket f
left join #BallByBallOversBowled b
	on f.MatchNum = b.MatchNum
	and f.InningsNum = b.InningsNum
	and f.SequenceNumber = b.SequenceNumber

update FallOfWicket
set BallByBallOversBowled =
	case
	when MatchNum = 249217 and FallOfWicket = '10-169 (Patel, 63.6 ov)' then '63.7'
	when MatchNum = 232615 and FallOfWicket = '4-456 (Inzamam-ul-Haq, 111.3 ov)' then '113.4'
	else BallByBallOversBowled
	end

--Identify Batting Partner and dismissed batter from FallOfWicket
select
b.*
, FowSequence = sum(NewPartnership) over(partition by b.MatchNum, b.Innings order by b.OverNum, b.BallNumInOver, b.RowNum)
into #BbFowSeq
from (
	select
	b.MatchNum, b.Innings, b.BallNum, b.RowNum, b.Commentary, b.OverNum, b.BallNumInOver, b.BatsmanScorecardName
	, PartnershipEnd =
		case when f.MatchNum is not null then 1 else 0 end
	, NewPartnership =
		isnull(
		lag(case when f.MatchNum is not null then 1 else 0 end,1)
		over(partition by b.MatchNum, b.Innings order by b.OverNum, b.BallNumInOver, b.RowNum)
		,1)
	from RecBallByBall_Stage b
	left join FallOfWicket f
		on b.MatchNum = f.MatchNum
		and b.Innings = f.InningsNum
		and b.BallNum = f.BallByBallOversBowled
		and (b.TeamWickets = 1 or f.IsOut = 'N')
		) b

select
b.MatchNum
, b.Innings
, b.BallNum
, b.RowNum
, BattingPartnerToUpdate =
	case
	when f.MatchNum is null and NotOutBat1 = BatsmanScorecardName then NotOutBat2
	when f.MatchNum is null and NotOutBat2 = BatsmanScorecardName then NotOutBat1
	when BatsmanScorecardName = sd.PlayerName then sr.PlayerName
	else sd.PlayerName
	end
, BatterDismissedToUpdate = case when BatsmanScorecardName = sd.PlayerName then 'Striker' else 'Non striker' end
into #BbPartner
from #BbFowSeq b
left join FallOfWicket f
	on b.MatchNum = f.MatchNum
	and b.Innings = f.InningsNum
	and b.FowSequence = f.SequenceNumber
left join ScorecardBattingRow sd
	on f.MatchNum = sd.MatchNum
	and f.InningsNum = sd.InningsNum
	and f.DepartingBatsmanUrl = sd.PlayerUrl
left join ScorecardBattingRow sr
	on f.MatchNum = sr.MatchNum
	and f.InningsNum = sr.InningsNum
	and f.RemainingBatsmanUrl = sr.PlayerUrl
left join (
	select MatchNum, InningsNum, NotOutBat1 = min(PlayerName), NotOutBat2 = max(PlayerName)
	from ScorecardBattingRow
	where DismissalName = 'Not Out'
	group by MatchNum, InningsNum
	having count(*) > 1
	) notout
		on notout.MatchNum = b.MatchNum
		and notout.InningsNum = b.Innings

update b
set BattingPartner = u.BattingPartnerToUpdate
, BatterDismissed = u.BatterDismissedToUpdate
from RecBallByBall_Stage b
left join #BbPartner u
	on u.MatchNum = b.MatchNum
	and u.Innings = b.Innings
	and u.BallNum = b.BallNum
	and u.RowNum = b.RowNum

update RecBallByBall_stage
set BowlerWicket = 0, BatsmanWicket = 0
where BatterDismissed = 'Non Striker'

--Do not give bowler credit for wicket in the case of a run out
update n
set BowlerWicket = 0
from 
RecBallByBall_Stage n
join ScorecardBattingRow s
on s.MatchNum = n.MatchNum
and s.InningsNum = n.Innings
and n.BatsmanScorecardName = s.PlayerName
and DismissalName = 'Run Out'
and n.TeamWickets = 1

--Add rows for instances where the non striker was run out
insert into RecBallByBall_stage (
	Url, MatchNum, Innings, [Page], OverNum, BallNumInOver, BallNum, Bowler, BowlerScorecardName,
	BatsmanScorecardName, Result, Commentary, TeamRuns, TeamWickets, BatsmanRuns, BowlerConceded, BowlerWicket,
	BatsmanWicket, Extras, Byes, LegByes, Wides, NoBalls, PenaltyRuns, BallCount, InsertedFrom
	)
select Url, MatchNum, Innings, [Page], OverNum, BallNumInOver, BallNum, Bowler, BowlerScorecardName,
BattingPartner, Result, Commentary, 0, 0, 0, 0, 0,
1, 0, 0, 0, 0, 0, 0, 0, 'Non striker run out'
from RecBallByBall_stage
where BatterDismissed = 'Non Striker' and TeamWickets = 1;


--Get bowling stats per player prior to current match
with PrevMatch as (
select cast(replace(replace(TestName, 'Test # ',''),' - Live','') as int) as TestNum, s.MatchNum, InningsNum, Bowler, Deliveries, Wickets, Runs, m.DimMatchStartDateKey,
CumulativeDeliveries =
	sum(Deliveries)
	over(
		partition by Bowler 
		order by cast(replace(replace(TestName, 'Test # ',''),' - Live','') as int), InningsNum
		) - Deliveries
, CumulativeWickets =
	sum(Wickets)
	over(
		partition by Bowler 
		order by cast(replace(replace(TestName, 'Test # ',''),' - Live','') as int), InningsNum
		) - Wickets
, CumulativeRuns =
	sum(Runs)
	over(
		partition by Bowler 
		order by cast(replace(replace(TestName, 'Test # ',''),' - Live','') as int), InningsNum
		) - Runs
from ScorecardBowlingRow s
join match m on m.MatchNum = s.MatchNum
)

--Get cumulative bowling stats per player in current match
, MatchToDate as (
select MatchNum, Innings, BallNum, BatsmanScorecardName, BowlerScorecardName, Result, Commentary, BatsmanRuns, BatsmanWicket
, BowlerWicketsToDate
, BowlerRunsConcededToDate
, BowlerDeliveriesToDate
, BowlerAsAtStrikeRate
, BowlerAsAtEconomy
, sum(BowlerConceded) over(partition by MatchNum, Innings, BowlerScorecardName order by cast(BallNum as numeric(10,4))) as ConcededInMatchToDate
, sum(BowlerWicket) over(partition by MatchNum, Innings, BowlerScorecardName order by cast(BallNum as numeric(10,4))) as WicketsInMatchToDate
, sum(BallCount) over(partition by MatchNum, Innings, BowlerScorecardName order by cast(BallNum as numeric(10,4))) as BallsInMatchToDate
from RecBallByBall_stage
)

,calcs as (
select
DimMatchStartDateKey, TestNum, Innings, BallNum, BatsmanScorecardName, BowlerScorecardName, Result, Commentary, BatsmanRuns, BatsmanWicket
, BowlerWicketsToDate
, BowlerRunsConcededToDate
, BowlerDeliveriesToDate
, BowlerAsAtStrikeRate
, BowlerAsAtEconomy
, WicketsToDate = WicketsInMatchToDate+CumulativeWickets
, RunsConcededToDate = ConcededInMatchToDate+CumulativeRuns
, DeliveriesToDate = BallsInMatchToDate+CumulativeDeliveries
, BowlerAverageSR =
	1.0*(WicketsInMatchToDate+CumulativeWickets)
	/
	case when BallsInMatchToDate + CumulativeDeliveries = 0 then 1 else BallsInMatchToDate + CumulativeDeliveries end
, BowlerAverageEcon =
	1.0*(ConcededInMatchToDate+CumulativeRuns)
	/
	case when BallsInMatchToDate + CumulativeDeliveries = 0 then 1 else BallsInMatchToDate + CumulativeDeliveries end
from MatchToDate bb
left join PrevMatch p
on bb.MatchNum = p.MatchNum
and bb.Innings = p.InningsNum
and bb.BowlerScorecardName = p.Bowler
)

update calcs
set
BowlerWicketsToDate = WicketsToDate
, BowlerRunsConcededToDate = RunsConcededToDate
, BowlerDeliveriesToDate = RunsConcededToDate
, BowlerAsAtStrikeRate = BowlerAverageSR
, BowlerAsAtEconomy = BowlerAverageEcon;


--Get as-at stats for batsmen
with PrevMatch as (
select cast(replace(replace(TestName, 'Test # ',''),' - Live','') as int) as TestNum, s.MatchNum, InningsNum, PlayerName, RunsScored, BallsFaced, DismissedCount, m.DimMatchStartDateKey,
CumulativeDeliveries =
	sum(BallsFaced)
	over(
		partition by PlayerName 
		order by cast(replace(replace(TestName, 'Test # ',''),' - Live','') as int), InningsNum
		) - BallsFaced
, CumulativeWickets =
	sum(DismissedCount)
	over(
		partition by PlayerName 
		order by cast(replace(replace(TestName, 'Test # ',''),' - Live','') as int), InningsNum
		) - DismissedCount
, CumulativeRuns =
	sum(RunsScored)
	over(
		partition by PlayerName 
		order by cast(replace(replace(TestName, 'Test # ',''),' - Live','') as int), InningsNum
		) - RunsScored
from ScorecardBattingRow s
join match m on m.MatchNum = s.MatchNum
where PlayerName <> 'Extras' and BallsFaced is not null
)

, MatchToDate as (
select MatchNum, Innings, BallNum, BatsmanScorecardName, BowlerScorecardName, Result, Commentary, BatsmanRuns, BatsmanWicket
, BatterAsAtRunRate
, BatterAsAtDismissalRate
, sum(BatsmanRuns) over(partition by MatchNum, Innings, BatsmanScorecardName order by cast(BallNum as numeric(10,4))) - BatsmanRuns as RunsInMatchToDate
, sum(BatsmanWicket) over(partition by MatchNum, Innings, BatsmanScorecardName order by cast(BallNum as numeric(10,4))) - BatsmanWicket as WicketsInMatchToDate
, sum(BallCount) over(partition by MatchNum, Innings, BatsmanScorecardName order by cast(BallNum as numeric(10,4))) - BallCount as BallsInMatchToDate
from RecBallByBall_stage
)

,calcs as (
select
DimMatchStartDateKey, TestNum, Innings, BallNum, BatsmanScorecardName, BowlerScorecardName, Result, Commentary, BatsmanRuns, BatsmanWicket
, BatterAsAtRunRate
, BatterAsAtDismissalRate
, WicketsToDate = WicketsInMatchToDate + CumulativeWickets
, RunsInMatchToDate = RunsInMatchToDate + CumulativeRuns
, DeliveriesToDate = BallsInMatchToDate + CumulativeDeliveries
, BatterAverageSR =
	1.0*(WicketsInMatchToDate+CumulativeWickets)
	/
	case when BallsInMatchToDate + CumulativeDeliveries = 0 then 1 else BallsInMatchToDate + CumulativeDeliveries end
, BatterAverageEcon =
	1.0*(RunsInMatchToDate+CumulativeRuns)
	/
	case when BallsInMatchToDate + CumulativeDeliveries = 0 then 1 else BallsInMatchToDate + CumulativeDeliveries end
from MatchToDate bb
left join PrevMatch p
on bb.MatchNum = p.MatchNum
and bb.Innings = p.InningsNum
and bb.BatsmanScorecardName = p.PlayerName
)

update calcs
set
BatterAsAtRunRate = BatterAverageEcon
, BatterAsAtDismissalRate = BatterAverageSR;


--Delete and reload rows in main table
delete 
from RecBallByBall
where url in (select url from #url)

insert into RecBallByBall
select * from RecBallByBall_Stage








GO


