USE [CricketRec]
GO

/****** Object:  StoredProcedure [dbo].[LoadODIFallOfWicket]    Script Date: 03/12/2016 17:27:39 ******/
DROP PROCEDURE [dbo].[LoadODIFallOfWicket]
GO

/****** Object:  StoredProcedure [dbo].[LoadODIFallOfWicket]    Script Date: 03/12/2016 17:27:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



--exec LoadODIFallOfWicket
--select * from ODIFallOfWicket



CREATE proc [dbo].[LoadODIFallOfWicket] as

truncate table ODIFallOfWicket

select distinct
ODIName
, InningsName
, InningsNum
, Team
, BowlingTeam
into #innings
from CricketRec.dbo.ODIScorecardBattingRow;

with base as (
select
MatchUrl = f.Url
, ODIName = s.ODIName
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
from CricketOSA.dbo.ODIFallOfWicket f
join CricketOSA.dbo.ODIUrlList s on s.url = f.url
)


insert into CricketRec.dbo.ODIFallOfWicket
select
b.MatchUrl
, b.ODIName
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
, Partnership = Runs - isnull(lag(Runs,1) over(partition by b.ODIName, b.InningsName order by b.WicketNumber, b.Runs, b.IsOut desc),0)
, BallsBowledSinceLastKnownPoint =
	6 * cast(left(OversBowled,charindex('.',OversBowled)-1) as int) + cast(substring(OversBowled,charindex('.',OversBowled)+1,1000) as int)
	- 
	isnull(lag(6 * cast(left(OversBowled,charindex('.',OversBowled)-1) as int) + cast(substring(OversBowled,charindex('.',OversBowled)+1,1000) as int),1)
	over(partition by b.ODIName, b.InningsName
	order by 6 * cast(left(OversBowled,charindex('.',OversBowled)-1) as int) + cast(substring(OversBowled,charindex('.',OversBowled)+1,1000) as int)),0)
, SequenceNumber = row_number() over(partition by b.ODIName, b.InningsName order by b.WicketNumber, b.Runs, b.IsOut desc)
, ReturnsAfterWicket = null
, BallByBallOversBowled = null
from base b
join #innings i
	on i.ODIName = b.ODIName
	and i.InningsName + ' Batting' = b.InningsName
order by b.ODIName, b.InningsName, SequenceNumber


update f
set DepartingBatsmanUrl =
	case
	when s2.PlayerName is not null then s2.PlayerUrl
	when s.PlayerName is not null then s.PlayerUrl
	when f.ODIName = 'ODI # 1892' and f.DepartingBatsman = 'Anwar Hossain' then 'http://www.espncricinfo.com/ci/content/player/56235.html' --'Anwar Hossain Monir'
	when f.ODIName = 'ODI # 3012' and f.DepartingBatsman = 'JO Ngoche' then 'http://www.espncricinfo.com/ci/content/player/308515.html' --'SO Ngoche'
	when f.ODIName = 'ODI # 3541' and f.DepartingBatsman = 'Raho' then 'http://www.espncricinfo.com/ci/content/player/25051.html' --'MD Dai'
	when f.ODIName = 'ODI # 2912' and f.DepartingBatsman = 'Waller' then 'http://www.espncricinfo.com/ci/content/player/55612.html' --'S Matsikenyeri'
	when f.ODIName = 'ODI # 3709' and f.DepartingBatsman = 'Asif Iqbal' then 'http://www.espncricinfo.com/ci/content/player/39898.html'
	when f.DepartingBatsman = 'Yadav' then 'http://www.espncricinfo.com/ci/content/player/36054.html' --'Jai P Yadav'
	when f.DepartingBatsman = 'Singh' then 'http://www.espncricinfo.com/ci/content/player/35280.html' --'RP Singh'
	end
from CricketRec.dbo.ODIFallOfWicket f
left join CricketRec.dbo.ODIScorecardBattingRow s
	on s.ODIName = f.ODIName
	and s.InningsNum = f.InningsNum
	and s.PlayerName = f.DepartingBatsman
left join CricketRec.dbo.ODIScorecardBattingRow s2
	on s2.ODIName = f.ODIName
	and s2.InningsNum = f.InningsNum
	and s2.Surname = f.DepartingBatsman
	and s.ODIName is null

update f
set ReturnsAfterWicket = u.ReturnsAfterWicket
from CricketRec.dbo.ODIFallOfWicket f
join CricketRec.dbo.ODIFallOfWicketUpdates u
	on f.ODIName = u.ODIName
	and f.InningsNum = u.InningsNum
	and f.SequenceNumber = u.SequenceNumber


select s.ODIName, s.InningsNum, s.BattingOrder, s.PlayerUrl, s.PlayerName
, BatDeparts = isnull(min(fow.SequenceNumber),99)
, BatReturns = max(fow.ReturnsAfterWicket) + 1
, BatDeparts2 = max(case when fow.ReturnsAfterWicket is not null then fow.SequenceNumber end)
into #Score
from ODIScorecardBattingRow s
left join ODIFallOfWicket fow
	on s.ODIName = fow.ODIName
	and s.InningsNum = fow.InningsNum
	and s.PlayerUrl = fow.DepartingBatsmanUrl
group by s.ODIName, s.InningsNum, s.BattingOrder, s.PlayerUrl, s.PlayerName
order by s.ODIName, s.InningsNum, s.BattingOrder;


with UpdateRemainingBatsman as (
select
f.ODIName, f.InningsNum, FallOfWicket, SequenceNumber, DepartingBatsman, RemainingBatsman, RemainingBatsmanUrl
, RemainingBatsmanToUpdate = s.PlayerName
, RemainingBatsmanUrlToUpdate = s.PlayerUrl
, rn = row_number() over(partition by f.ODIName, f.InningsNum, f.SequenceNumber order by s.BattingOrder)
from ODIFallOfWicket f
left join #Score s
	on s.ODIName = f.ODIName
	and s.InningsNum = f.InningsNum
	and (s.BatDeparts > f.SequenceNumber or (s.BatReturns < f.SequenceNumber and s.BatDeparts2 > f.SequenceNumber))
)

update UpdateRemainingBatsman
set RemainingBatsman = RemainingBatsmanToUpdate
, RemainingBatsmanUrl = RemainingBatsmanUrlToUpdate
where rn = 1;



GO


