USE [CricketDDS]
GO

/****** Object:  StoredProcedure [dbo].[LoadFactBowlingScorecard]    Script Date: 04/12/2016 00:13:19 ******/
DROP PROCEDURE [dbo].[LoadFactBowlingScorecard]
GO

/****** Object:  StoredProcedure [dbo].[LoadFactBowlingScorecard]    Script Date: 04/12/2016 00:13:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE proc [dbo].[LoadFactBowlingScorecard] as

truncate table FactBowlingScorecard

insert into FactBowlingScorecard
select
isnull(ds.DimSeriesID,-1) as DimSeriesID,
isnull(dm.DimMatchID,-1) as DimMatchID,
isnull(dd.DateKey,-1) as DimMatchStartDateKey,
isnull(dg.DimGroundID, -1) as DimGroundID,
isnull(dr.DimResultID,-1) as DimResultID,
isnull(dtbat.DimTeamID,-1) as DimBattingTeamID,
isnull(dtbowl.DimTeamID,-1) as DimBowlingTeamID,
isnull(di.DimInningsID,-1) as DimInningsID,
isnull(dpbat.DimPlayerID,-1) as DimBowlerID,
s.BowlingTeamAtHome,
s.BowlingPosition,
s.Overs,
s.FullOvers,
s.PartOver,
s.Deliveries,
s.Maidens,
s.Runs,
s.Wickets
from CricketRec.dbo.ScorecardBowlingRow s
join CricketRec.dbo.Match m
	on m.Url = s.Url
left join CricketDDS.dbo.DimMatch dm
	on s.Url = dm.MatchUrl
left join CricketDDS.dbo.DimDate dd
	on m.DimMatchStartDateKey = dd.DateKey
left join DimInnings di
	on di.InningsNumber = s.InningsNum
left join DimResult dr
	on dr.Result = m.Result
	and dr.HomeAwayResult = m.HomeAwayResult
left join DimSeries ds
	on ds.SeriesName = m.SeriesName
left join DimTeam dtbowl
	on dtbowl.Team = s.BowlingTeam
left join DimTeam dtbat
	on dtbat.Team = s.BattingTeam
left join DimPlayer dpbat
	on dpbat.PlayerUrl = 'http://'+replace(s.PlayerUrl,'the-ashes-2013-14','ci')
left join DimGround dg
	on dg.GroundUrl = 'http://' + m.GroundUrl

insert into FactBowlingScorecard

select
isnull(ds.DimSeriesID,-1) as DimSeriesID,
isnull(dm.DimMatchID,-1) as DimMatchID,
isnull(dd.DateKey,-1) as DimMatchStartDateKey,
isnull(dg.DimGroundID, -1) as DimGroundID,
isnull(dr.DimResultID,-1) as DimResultID,
isnull(dtbat.DimTeamID,-1) as DimBattingTeamID,
isnull(dtbowl.DimTeamID,-1) as DimBowlingTeamID,
isnull(di.DimInningsID,-1) as DimInningsID,
isnull(dpbat.DimPlayerID,-1) as DimBowlerID,
s.BowlingTeamAtHome,
s.BowlingPosition,
s.Overs,
s.FullOvers,
s.PartOver,
s.Deliveries,
s.Maidens,
s.Runs,
s.Wickets
from CricketRec.dbo.ODIScorecardBowlingRow s
join CricketRec.dbo.ODIMatch m
	on m.Url = s.Url
left join CricketDDS.dbo.DimMatch dm
	on s.Url = dm.MatchUrl
left join CricketDDS.dbo.DimDate dd
	on m.DimMatchStartDateKey = dd.DateKey
left join DimInnings di
	on di.InningsNumber = s.InningsNum
left join DimResult dr
	on dr.Result = m.Result
	and dr.HomeAwayResult = m.HomeAwayResult
left join DimSeries ds
	on ds.SeriesName = m.SeriesName
left join DimTeam dtbowl
	on dtbowl.Team = s.BowlingTeam
left join DimTeam dtbat
	on dtbat.Team = s.BattingTeam
left join DimPlayer dpbat
	on dpbat.PlayerUrl = 'http://'+replace(s.PlayerUrl,'the-ashes-2013-14','ci')
left join DimGround dg
	on dg.GroundUrl = 'http://' + m.GroundUrl



GO


