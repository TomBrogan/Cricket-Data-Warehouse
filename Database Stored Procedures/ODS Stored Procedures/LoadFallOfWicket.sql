USE [CricketRec]
GO

/****** Object:  StoredProcedure [dbo].[LoadFallOfWicket]    Script Date: 03/12/2016 17:26:11 ******/
DROP PROCEDURE [dbo].[LoadFallOfWicket]
GO

/****** Object:  StoredProcedure [dbo].[LoadFallOfWicket]    Script Date: 03/12/2016 17:26:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






--exec [LoadFallOfWicket20160405]

CREATE proc [dbo].[LoadFallOfWicket] as 

truncate table CricketRec.dbo.FallOfWicket;

select distinct
MatchNum
, InningsName
, InningsNum
, Team
, BowlingTeam
into #innings
from CricketRec.dbo.ScorecardBattingRow;

with base as (
select
MatchUrl = f.Url
, MatchNum = s.MatchNum
, InningsName = Title
, FallOfWicket
, WicketNumber = cast(replace(FallOfWicket,substring(FallOfWicket, charindex('-',FallOfWicket),1000),'') as int)
, Runs =
	cast(
	replace(
	substring(
	FallOfWicket
	, charindex('-',FallOfWicket) + 1
	,charindex(' ',FallOfWicket) - charindex('-',FallOfWicket)
	),'*','')
	as int)
, DepartingBatsman =
	substring(
	FallOfWicket
	,charindex('(',FallOfWicket) + 1
	,	case
		when charindex(',',FallOfWicket) > charindex('(',FallOfWicket)
		then charindex(',',FallOfWicket) - charindex('(',FallOfWicket) - 1
		else charindex(')',FallOfWicket) - charindex('(',FallOfWicket) - 1
		end
	)
, OversBowled =
	case
	when FallOfWicket like '% ov)' and patindex('%retired not out,%',FallOfWicket) = 0
	then substring(
		FallOfWicket
		,charindex(',',FallOfWicket) + 1
		,patindex('% ov)',FallOfWicket) - charindex(',',FallOfWicket)
		)
	when FallOfWicket like '% ov)' and patindex('%retired not out,%',FallOfWicket) > 0
	then substring(
		FallOfWicket
		,patindex('%retired not out,%',FallOfWicket) + 16
		,patindex('% ov)',FallOfWicket) - patindex('%retired not out,%',FallOfWicket) - 16
		)
	end
, IsOut = case when FallOfWicket like '%*%' then 'N' else 'Y' end
from CricketOSA.dbo.FallOfWicket f
join CricketOSA.dbo.ScorecardUrlList s on s.url = f.url
)

insert into CricketRec.dbo.FallOfWicket
select
b.MatchUrl
, b.MatchNum
, i.InningsNum
, b.InningsName
, BattingTeam = i.Team
, BowlingTeam = i.BowlingTeam
, b.FallOfWicket
, b.WicketNumber
, b.Runs
, b.IsOut
, b.DepartingBatsman
, DepartingBatsmanUrl = null
, RemainingBatsman = null
, RemainingBatsmanUrl = null
, OversBowled
, FullOversBowled = cast(left(OversBowled,charindex('.',OversBowled)-1) as int)
, BallsBowledInCurrentOver = cast(substring(OversBowled,charindex('.',OversBowled)+1,1000) as int)
, BallsBowled = 6 * cast(left(OversBowled,charindex('.',OversBowled)-1) as int) + cast(substring(OversBowled,charindex('.',OversBowled)+1,1000) as int)
, Partnership = Runs - isnull(lag(Runs,1) over(partition by b.MatchNum, b.InningsName order by b.WicketNumber, b.Runs, b.IsOut desc),0)
, BallsBowledSinceLastKnownPoint =
	6 * cast(left(OversBowled,charindex('.',OversBowled)-1) as int) + cast(substring(OversBowled,charindex('.',OversBowled)+1,1000) as int)
	- 
	isnull(lag(6 * cast(left(OversBowled,charindex('.',OversBowled)-1) as int) + cast(substring(OversBowled,charindex('.',OversBowled)+1,1000) as int),1)
	over(partition by b.MatchNum, b.InningsName
	order by 6 * cast(left(OversBowled,charindex('.',OversBowled)-1) as int) + cast(substring(OversBowled,charindex('.',OversBowled)+1,1000) as int)),0)
, SequenceNumber = row_number() over(partition by b.MatchNum, b.InningsName order by b.WicketNumber, b.Runs, b.IsOut desc)
, ReturnsAfterWicket = null
, BallByBallOversBowled = null
from base b
join #innings i
	on i.MatchNum = b.MatchNum
	and i.InningsName + ' Batting' = b.InningsName
order by b.MatchNum, b.InningsName, SequenceNumber


update f
set DepartingBatsmanUrl =
	case
	when f.MatchNum in (291352,291351,233797,332912,332911,291354) and DepartingBatsman = 'Singh' then 'www.espncricinfo.com/ci/content/player/35280.html'--RP Singh
	when f.MatchNum = 63813 and DepartingBatsman = 'Singh' then 'www.espncricinfo.com/ci/content/player/34059.html' --RR Singh
	when f.MatchNum = 239920 and DepartingBatsman = 'Singh' then 'www.espncricinfo.com/ci/content/player/35281.html' --VRV Singh
	when s.PlayerUrl is not null then s.PlayerUrl
	when s2.PlayerUrl is not null then s2.PlayerUrl
	when f.DepartingBatsman = 'Anwar Hossain' then 'www.espncricinfo.com/ci/content/player/56235.html' --Anwar Hossain Monir
	when f.DepartingBatsman = 'Shakeel Ahmed' then 'www.espncricinfo.com/ci/content/player/42650.html'
	end
from CricketRec.dbo.FallOfWicket f
left join CricketRec.dbo.ScorecardBattingRow s
	on s.MatchNum = f.MatchNum
	and s.InningsNum = f.InningsNum
	and s.PlayerName = f.DepartingBatsman
left join CricketRec.dbo.ScorecardBattingRow s2
	on s2.MatchNum = f.MatchNum
	and s2.InningsNum = f.InningsNum
	and s2.Surname = f.DepartingBatsman
	and s.MatchNum is null

update f
set ReturnsAfterWicket = u.ReturnsAfterWicket
from CricketRec.dbo.FallOfWicket f
join CricketRec.dbo.FallOfWicketUpdates u
	on f.MatchNum = u.MatchNum
	and f.InningsNum = u.InningsNum
	and f.SequenceNumber = u.SequenceNumber


select s.MatchNum, s.InningsNum, s.BattingOrder, s.PlayerUrl, s.PlayerName
, BatDeparts = isnull(min(fow.SequenceNumber),99)
, BatReturns = max(fow.ReturnsAfterWicket) + 1
, BatDeparts2 = max(case when fow.ReturnsAfterWicket is not null then fow.SequenceNumber end)
into #Score
from ScorecardBattingRow s
left join FallOfWicket fow
	on s.MatchNum = fow.MatchNum
	and s.InningsNum = fow.InningsNum
	and s.PlayerUrl = fow.DepartingBatsmanUrl
group by s.MatchNum, s.InningsNum, s.BattingOrder, s.PlayerUrl, s.PlayerName
order by s.MatchNum, s.InningsNum, s.BattingOrder;

with UpdateRemainingBatsman as (
select
MatchNum, InningsNum, FallOfWicket, SequenceNumber, DepartingBatsman, RemainingBatsman, RemainingBatsmanUrl
, RemainingBatsmanToUpdate = 
	(select top 1
	PlayerName
	from #Score s
	where s.MatchNum = f.MatchNum
	and s.InningsNum = f.InningsNum
	and (s.BatDeparts > f.SequenceNumber or (s.BatReturns < f.SequenceNumber and s.BatDeparts2 > f.SequenceNumber))
	order by BattingOrder)
, RemainingBatsmanUrlToUpdate = 
	(select top 1
	PlayerUrl
	from #Score s
	where s.MatchNum = f.MatchNum
	and s.InningsNum = f.InningsNum
	and (s.BatDeparts > f.SequenceNumber or (s.BatReturns < f.SequenceNumber and s.BatDeparts2 > f.SequenceNumber))
	order by BattingOrder)
from FallOfWicket f
)

update UpdateRemainingBatsman
set RemainingBatsman = RemainingBatsmanToUpdate
, RemainingBatsmanUrl = RemainingBatsmanUrlToUpdate;



GO


