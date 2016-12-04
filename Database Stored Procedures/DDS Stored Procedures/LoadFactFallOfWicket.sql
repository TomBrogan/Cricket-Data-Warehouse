USE [CricketDDS]
GO

/****** Object:  StoredProcedure [dbo].[LoadFactFallOfWicket]    Script Date: 04/12/2016 00:13:23 ******/
DROP PROCEDURE [dbo].[LoadFactFallOfWicket]
GO

/****** Object:  StoredProcedure [dbo].[LoadFactFallOfWicket]    Script Date: 04/12/2016 00:13:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE proc [dbo].[LoadFactFallOfWicket] as

truncate table CricketDDS.dbo.FactFallOfWicket;

insert into CricketDDS.dbo.FactFallOfWicket
select
isnull(ds.DimSeriesID,-1) as DimSeriesID
, isnull(dm.DimMatchID,-1) as DimMatchID
, isnull(dd.DateKey,-1) as DimMatchStartDateKey
, isnull(dg.DimGroundID, -1) as DimGroundID
, isnull(dr.DimResultID,-1) as DimResultID
, isnull(dttoss.DimTeamID,-1) as DimTossWinningTeamID
, isnull(dtbat.DimTeamID,-1) as DimBattingTeamID
, isnull(dtbowl.DimTeamID, -1) as DimBowlingTeamID
, isnull(di.DimInningsID,-1) as DimInningsID
, isnull(dpbat.DimPlayerID,-1) as DimBatterID
, f.SequenceNumber
, f.FallOfWicket
, f.IsOut
, f.WicketNumber
, RunsAtFallOfWicket = f.Runs
, f.FullOversBowled
, f.BallsBowledInCurrentOver
, f.BallsBowled
, DismissalCount = case when f.IsOut = 'Y' then 1 else 0 end
, f.Partnership
, f.BallsBowledSinceLastKnownPoint
from CricketRec.dbo.FallOfWicket f
join CricketRec.dbo.Match m
	on m.Url = f.MatchUrl
left join CricketDDS.dbo.DimMatch dm
	on f.MatchUrl = dm.MatchUrl
left join CricketDDS.dbo.DimDate dd
	on m.DimMatchStartDateKey = dd.DateKey
left join DimInnings di
	on di.InningsNumber = f.InningsNum
left join CricketDDS.dbo.DimResult dr
	on dr.Result = m.Result
	and dr.HomeAwayResult = m.HomeAwayResult
left join CricketDDS.dbo.DimSeries ds
	on ds.SeriesName = m.SeriesName
left join DimTeam dtbat
	on dtbat.Team = f.BattingTeam
left join DimTeam dtbowl
	on dtbowl.Team = f.BowlingTeam
left join CricketDDS.dbo.DimTeam dttoss
	on dttoss.Team = m.TossWinningTeam
left join CricketDDS.dbo.DimPlayer dpbat
	on dpbat.PlayerUrl = 'http://'+replace(f.DepartingBatsmanUrl,'the-ashes-2013-14','ci')
left join DimGround dg
	on dg.GroundUrl = 'http://' + m.GroundUrl



insert into CricketDDS.dbo.FactFallOfWicket
select
isnull(ds.DimSeriesID,-1) as DimSeriesID
, isnull(dm.DimMatchID,-1) as DimMatchID
, isnull(dd.DateKey,-1) as DimMatchStartDateKey
, isnull(dg.DimGroundID, -1) as DimGroundID
, isnull(dr.DimResultID,-1) as DimResultID
, isnull(dttoss.DimTeamID,-1) as DimTossWinningTeamID
, isnull(dtbat.DimTeamID,-1) as DimBattingTeamID
, isnull(dtbowl.DimTeamID, -1) as DimBowlingTeamID
, isnull(di.DimInningsID,-1) as DimInningsID
, isnull(dpbat.DimPlayerID,-1) as DimBatterID
, f.SequenceNumber
, f.FallOfWicket
, f.IsOut
, f.WicketNumber
, RunsAtFallOfWicket = f.Runs
, f.FullOversBowled
, f.BallsBowledInCurrentOver
, f.BallsBowled
, DismissalCount = case when f.IsOut = 'Y' then 1 else 0 end
, f.Partnership
, f.BallsBowledSinceLastKnownPoint
from CricketRec.dbo.ODIFallOfWicket f
join CricketRec.dbo.ODIMatch m
	on m.Url = f.MatchUrl
left join CricketDDS.dbo.DimMatch dm
	on f.MatchUrl = dm.MatchUrl
left join CricketDDS.dbo.DimDate dd
	on m.DimMatchStartDateKey = dd.DateKey
left join DimInnings di
	on di.InningsNumber = f.InningsNum
left join CricketDDS.dbo.DimResult dr
	on dr.Result = m.Result
	and dr.HomeAwayResult = m.HomeAwayResult
left join CricketDDS.dbo.DimSeries ds
	on ds.SeriesName = m.SeriesName
left join DimTeam dtbat
	on dtbat.Team = f.BattingTeam
left join DimTeam dtbowl
	on dtbowl.Team = f.BowlingTeam
left join CricketDDS.dbo.DimTeam dttoss
	on dttoss.Team = m.TossWinningTeam
left join CricketDDS.dbo.DimPlayer dpbat
	on dpbat.PlayerUrl = 'http://'+replace(f.DepartingBatsmanUrl,'the-ashes-2013-14','ci')
left join DimGround dg
	on dg.GroundUrl = 'http://' + m.GroundUrl



GO


