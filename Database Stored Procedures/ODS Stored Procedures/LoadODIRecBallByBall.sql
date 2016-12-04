USE [CricketRec]
GO

/****** Object:  StoredProcedure [dbo].[LoadODIRecBallByBall]    Script Date: 03/12/2016 17:33:00 ******/
DROP PROCEDURE [dbo].[LoadODIRecBallByBall]
GO

/****** Object:  StoredProcedure [dbo].[LoadODIRecBallByBall]    Script Date: 03/12/2016 17:33:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO












CREATE proc [dbo].[LoadODIRecBallByBall] as

begin try drop table #url end try begin catch end catch

declare @LatestMatch int

select top 1 @LatestMatch = ODINum from (
select distinct top 4
l.ODIName
, ODINum = cast(replace(l.ODIName, 'ODI # ','') as int)
from CricketOSA.dbo.ODIBallByBallUrlList l
join ODIRecBallByBall r on l.url = r.url
order by cast(replace(l.ODIName, 'ODI # ','') as int) desc
) x
order by ODINum

select @LatestMatch = 3738

select url, ODIName
into #url
from CricketOSA.dbo.ODIBallByBallUrlList l
where cast(replace(ODIName, 'ODI # ','') as int) >= @LatestMatch


--OSA Corrections
--Trash and reload table ready for data cleansing
truncate table CricketRec.dbo.ODIBallByBallUpdated;

insert into CricketRec.dbo.ODIBallByBallUpdated
select u.ODIName, u.Innings, b.RowNum, b.Url, b.BallNum, b.bowler, b.batsman, b.result, b.commentary, b.nextcomms
from CricketOSA.dbo.ODIBallByBall b
join CricketOSA.dbo.ODIBallByBallUrlList u on b.url = u.url
join #url url on url.url = u.url

update b
set b.Batsman = u.UpdateValue
from ODIBallByBallUpdated b
join ODIOSAUpdate u
	on b.ODIName = u.ODIName
	and b.innings = u.InningsNum
	and b.BallNum = u.BallNum
where u.UpdateColumn = 'Batsman'

update b
set b.Result = u.UpdateValue
from ODIBallByBallUpdated b
join ODIOSAUpdate u
	on b.ODIName = u.ODIName
	and b.innings = u.InningsNum
	and b.BallNum = u.BallNum
where u.UpdateColumn = 'Result'

delete r from CricketRec.dbo.ODIBallByBallUpdated r
join CricketRec.dbo.ODIBallByBallToDelete d on r.RowNum = d.RowNum and r.Url = d.Url


--Load stage
truncate table ODIRecBallByBall_Stage;

insert into ODIRecBallByBall_Stage
select
b.RowNum,
b.Url,
u.ODIName,
u.Innings,
cast(left(b.BallNum,charindex('.',b.BallNum) - 1) as int) + 1 as OverNum,
cast(right(b.BallNum,len(BallNum) - charindex('.',b.BallNum)) as int) as BallNumInOver,
b.BallNum,
b.Bowler,
cast (null as varchar(8000)) as BowlerScorecardName,
b.Batsman,
cast (null as varchar(8000)) as BatsmanScorecardName,
b.Result,
b.Commentary,
RainAffected = case when m.Result like '%(D/L method)%' then 'Y' else 'N' end,
BattingPartner = cast(null as varchar(2000)),
BatterDismissed = cast(null as varchar(2000)),
InsertedFrom = cast('OSA' as varchar(200)),
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
dbr.BallCount
, AsAtRunsInInningsBefore = cast(null as int)
, AsAtRunsInInningsAfter = cast(null as int)
, AsAtWicketsInInningsBefore = cast(null as int)
, AsAtWicketsInInningsAfter = cast(null as int)
, AsAtBallsBowledBefore = cast(null as int)
, AsAtBallsBowledAfter = cast(null as int)
, AsAtBallsRemainingBefore = cast(null as int)
, AsAtBallsRemainingAfter = cast(null as int)
, TotalRunsInInnings = cast(null as int)
, TotalWicketsInInnings = cast(null as int)
, ResourcesRemainingBefore = null
, ResourcesRemainingAfter = null
, ResourcesUsed = null
, ResourcesRemainingWithoutLostWicket = null
, BallResourcesUsed = null
, WicketResourcesUsed = null
from CricketRec.dbo.ODIBallByBallUpdated b
join CricketOSA.dbo.ODIBallByBallUrlList u
on b.Url = u.Url
join CricketOSA.dbo.ODIMatch m
on u.[Root] = m.Url
left join CricketOSA.dbo.DimBallResult dbr
on rtrim(replace(replace(replace(b.Result,char(10),''),char(13),''),char(9),'')) = dbr.Result;

--Update batsman scorecard name
update r
set BatsmanScorecardName =
	case
	when s2.PlayerName is not null then s2.PlayerName
	when s.PlayerName is not null then s.PlayerName
	when r.ODIName = 'ODI # 1892' and r.Batsman = 'Anwar Hossain' then 'Anwar Hossain Monir'
	when r.ODIName = 'ODI # 3012' and r.Batsman = 'JO Ngoche' then 'SO Ngoche'
	when r.ODIName = 'ODI # 3541' and r.Batsman = 'Raho' then 'MD Dai'
	when r.ODIName = 'ODI # 2912' and r.Batsman = 'Waller' then 'S Matsikenyeri'
	when r.ODIName = 'ODI # 3709' and r.Batsman = 'Asif Iqbal' then 'Asif Iqbal (1)'
	when r.Batsman = 'Yadav' then 'Jai P Yadav'
	when r.Batsman = 'Singh' then 'RP Singh'
	end
from ODIRecBallByBall_Stage r
left join ODIScorecardBattingRow s
	on s.ODIName = r.ODIName
	and s.InningsNum = r.Innings
	and s.CommentaryName = r.Batsman
left join ODIScorecardBattingRow s2
	on s2.ODIName = r.ODIName
	and s2.InningsNum = r.Innings
	and s2.PlayerName = r.Batsman



--update bowler scorecard name
update r
set r.BowlerScorecardName =
	case
	when s2.Bowler is not null then s2.Bowler
	when s.Bowler is not null then s.Bowler
	when r.ODIName = 'ODI # 1892' and r.Bowler = 'Anwar Hossain' then 'Anwar Hossain Monir'
	when r.Bowler = 'Singh' then 'RP Singh'
	when r.Bowler = 'Yadav' then 'Jai P Yadav'
	when r.ODIName in ('ODI # 2725','ODI # 2749') then 'Sami Faridi'
	when r.ODIName in ('ODI # 2956','ODI # 2958') then 'SO Ngoche'
	when r.ODIName = 'ODI # 3010' then 'MBS Jonkman'
	when r.ODIName = 'ODI # 3022' then 'JO Ngoche'
	when r.ODIName = 'ODI # 3344' then 'NN Odhiambo'
	when r.ODIName = 'ODI # 3196' then 'Junaid Siddiqui'
	end
from ODIRecBallByBall_Stage r
left join ODIScorecardBowlingRow s
	on s.ODIName = r.ODIName
	and s.InningsNum = r.Innings
	and s.CommentaryName = r.Bowler
left join ODIScorecardBowlingRow s2
	on s2.ODIName = r.ODIName
	and s2.InningsNum = r.Innings
	and s2.Bowler = r.Bowler;


--D/L Ratings
With RunningTotals as (
select
AsAtRunsInInningsBefore
, AsAtRunsInInningsAfter
, AsAtWicketsInInningsBefore
, AsAtWicketsInInningsAfter
, AsAtBallsBowledBefore
, AsAtBallsBowledAfter
, AsAtBallsRemainingBefore
, AsAtBallsRemainingAfter
, TotalRunsInInnings
, TotalWicketsInInnings
, uAsAtRunsInInningsBefore = sum(TeamRuns) over(partition by ODIName, Innings order by OverNum, BallNumInOver, BallCount) - TeamRuns
, uAsAtRunsInInningsAfter = sum(TeamRuns) over(partition by ODIName, Innings order by OverNum, BallNumInOver, BallCount)
, uAsAtWicketsInInningsBefore = sum(TeamWickets) over(partition by ODIName, Innings order by OverNum, BallNumInOver, BallCount) - TeamWickets
, uAsAtWicketsInInningsAfter = sum(TeamWickets) over(partition by ODIName, Innings order by OverNum, BallNumInOver, BallCount)
, uAsAtBallsBowledBefore = ((OverNum - 1) * 6) + BallNumInOver - 1
, uAsAtBallsBowledAfter = ((OverNum - 1) * 6) + BallNumInOver + BallCount - 1
, uAsAtBallsRemainingBefore = case when RainAffected = 'N' then 300 - (((OverNum - 1) * 6) + BallNumInOver - 1) end
, uAsAtBallsRemainingAfter = case when RainAffected = 'N' then 300 - (((OverNum - 1) * 6) + BallNumInOver + BallCount - 1) end
, uTotalRunsInInnings = sum(TeamRuns) over(partition by ODIName, Innings)
, uTotalWicketsInInnings = sum(TeamWickets) over(partition by ODIName, Innings)
from ODIRecBallByBall_Stage
)

update Runningtotals
set
AsAtRunsInInningsBefore = uAsAtRunsInInningsBefore
, AsAtRunsInInningsAfter = uAsAtRunsInInningsAfter
, AsAtWicketsInInningsBefore = uAsAtWicketsInInningsBefore
, AsAtWicketsInInningsAfter = uAsAtWicketsInInningsAfter
, AsAtBallsBowledBefore = uAsAtBallsBowledBefore
, AsAtBallsBowledAfter = uAsAtBallsBowledAfter
, AsAtBallsRemainingBefore = uAsAtBallsRemainingBefore
, AsAtBallsRemainingAfter = uAsAtBallsRemainingAfter
, TotalRunsInInnings = uTotalRunsInInnings
, TotalWicketsInInnings = uTotalWicketsInInnings


update b
set 
ResourcesRemainingBefore = d1.ResourcesRemaining
, ResourcesRemainingAfter = d2.ResourcesRemaining
, ResourcesUsed = d1.ResourcesRemaining - isnull(d2.ResourcesRemaining,0)
, ResourcesRemainingWithoutLostWicket = d3.ResourcesRemaining
, BallResourcesUsed = d1.ResourcesRemaining - isnull(d3.ResourcesRemaining,0)
, WicketResourcesUsed = 
	isnull(d3.ResourcesRemaining,0) - isnull(d2.ResourcesRemaining,0)
from ODIRecBallByBall_Stage b
left join DuckworthLewisResourcesByBall d1
	 on b.AsAtBallsRemainingBefore = d1.BallsRemaining
	 and b.AsAtWicketsInInningsBefore = d1.WicketsLost
left join DuckworthLewisResourcesByBall d2
	 on b.AsAtBallsRemainingAfter = d2.BallsRemaining
	 and b.AsAtWicketsInInningsAfter = d2.WicketsLost
left join DuckworthLewisResourcesByBall d3
	 on b.AsAtBallsRemainingAfter = d3.BallsRemaining
	 and b.AsAtWicketsInInningsBefore = d3.WicketsLost
where RainAffected = 'N'


--Run outs
update ODIFallOfWicket
set BallByBallOversBowled = ltrim(rtrim(OversBowled))

update f
set BallByBallOversBowled = u.BallByBallOverNum
from ODIFallOfWicket f
join ODIFallOfWicketOverNumUpdates u
	on u.ODIName = f.ODIName
	and u.InningsNum = f.InningsNum
	and u.SequenceNumber = f.SequenceNumber


--Identify Batting Partner and dismissed batter from FallOfWicket
select
b.*
, FowSequence = sum(NewPartnership) over(partition by b.ODIName, b.Innings order by b.OverNum, b.BallNumInOver, b.RowNum)
into #BbFowSeq
from (
	select
	b.ODIName, b.Innings, b.BallNum, b.RowNum, b.Commentary, b.OverNum, b.BallNumInOver, b.BatsmanScorecardName
	, PartnershipEnd =
		case when f.ODIName is not null then 1 else 0 end
	, NewPartnership =
		isnull(
		lag(case when f.ODIName is not null then 1 else 0 end,1)
		over(partition by b.ODIName, b.Innings order by b.OverNum, b.BallNumInOver, b.RowNum)
		,1)
	from ODIRecBallByBall_Stage b
	left join ODIFallOfWicket f
		on b.ODIName = f.ODIName
		and b.Innings = f.InningsNum
		and b.BallNum = f.BallByBallOversBowled
		and (b.TeamWickets = 1 or f.IsOut = 'N')
		) b


select
b.ODIName
, b.Innings
, b.BallNum
, b.RowNum
, BattingPartnerToUpdate =
	case
	when f.ODIName is null and NotOutBat1 = BatsmanScorecardName then NotOutBat2
	when f.ODIName is null and NotOutBat2 = BatsmanScorecardName then NotOutBat1
	when BatsmanScorecardName = sd.PlayerName then sr.PlayerName
	else sd.PlayerName
	end
, BatterDismissedToUpdate = case when BatsmanScorecardName = sd.PlayerName then 'Striker' else 'Non striker' end
into #BbPartner
from #BbFowSeq b
left join ODIFallOfWicket f
	on b.ODIName = f.ODIName
	and b.Innings = f.InningsNum
	and b.FowSequence = f.SequenceNumber
left join ODIScorecardBattingRow sd
	on f.ODIName = sd.ODIName
	and f.InningsNum = sd.InningsNum
	and f.DepartingBatsmanUrl = sd.PlayerUrl
left join ODIScorecardBattingRow sr
	on f.ODIName = sr.ODIName
	and f.InningsNum = sr.InningsNum
	and f.RemainingBatsmanUrl = sr.PlayerUrl
left join (
	select ODIName, InningsNum, NotOutBat1 = min(PlayerName), NotOutBat2 = max(PlayerName)
	from ODIScorecardBattingRow
	where DismissalName = 'Not Out'
	group by ODIName, InningsNum
	having count(*) > 1
	) notout
		on notout.ODIName = b.ODIName
		and notout.InningsNum = b.Innings

update b
set BattingPartner = u.BattingPartnerToUpdate
, BatterDismissed = u.BatterDismissedToUpdate
from ODIRecBallByBall_Stage b
left join #BbPartner u
	on u.ODIName = b.ODIName
	and u.Innings = b.Innings
	and u.BallNum = b.BallNum
	and u.RowNum = b.RowNum

update ODIRecBallByBall_stage
set BowlerWicket = 0, BatsmanWicket = 0
where BatterDismissed = 'Non Striker'

--Do not give bowler credit for wicket in the case of a run out
update n
set BowlerWicket = 0
from ODIRecBallByBall_Stage n
join ODIScorecardBattingRow s
on s.ODIName = n.ODIName
and s.InningsNum = n.Innings
and n.BatsmanScorecardName = s.PlayerName
and DismissalName = 'Run Out'
and n.TeamWickets = 1

--Add rows for instances where the non striker was run out
insert into ODIRecBallByBall_stage (
	Url, ODIName, Innings, OverNum, BallNumInOver, BallNum, Bowler, BowlerScorecardName,
	BatsmanScorecardName, Result, Commentary, TeamRuns, TeamWickets, BatsmanRuns, BowlerConceded, BowlerWicket,
	BatsmanWicket, Extras, Byes, LegByes, Wides, NoBalls, PenaltyRuns, BallCount, InsertedFrom
	)
select Url, ODIName, Innings, OverNum, BallNumInOver, BallNum, Bowler, BowlerScorecardName,
BattingPartner, Result, Commentary, 0, 0, 0, 0, 0,
1, 0, 0, 0, 0, 0, 0, 0, 'Non striker run out'
from ODIRecBallByBall_stage
where BatterDismissed = 'Non Striker' and TeamWickets = 1;


--Load main table from Stage
delete
from ODIRecBallByBall
where url in (select url from #url)

insert into ODIRecBallByBall
select * from ODIRecBallByBall_Stage










GO


