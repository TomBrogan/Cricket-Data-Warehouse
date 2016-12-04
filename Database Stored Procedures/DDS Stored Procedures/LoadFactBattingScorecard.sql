USE [CricketDDS]
GO

/****** Object:  StoredProcedure [dbo].[LoadFactBattingScorecard]    Script Date: 04/12/2016 00:13:16 ******/
DROP PROCEDURE [dbo].[LoadFactBattingScorecard]
GO

/****** Object:  StoredProcedure [dbo].[LoadFactBattingScorecard]    Script Date: 04/12/2016 00:13:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




--exec [LoadFactBattingScorecard]

CREATE proc [dbo].[LoadFactBattingScorecard] as

truncate table FactBattingScorecard

insert into FactBattingScorecard
select
isnull(dmt.DimMatchTypeID,-1) as DimMatchTypeID,
isnull(ds.DimSeriesID,-1) as DimSeriesID,
isnull(dm.DimMatchID,-1) as DimMatchID,
isnull(dd.DateKey,-1) as DimMatchStartDateKey,
isnull(dg.DimGroundID,-1) as DimGroundID,
isnull(dr.DimResultID,-1) as DimResultID,
isnull(dttoss.DimTeamID,-1) as DimTossWinningTeamID,
isnull(dt.DimTeamID,-1) as DimBattingTeamID,
isnull(dtbowl.DimTeamID, -1) as DimBowlingTeamID,
isnull(di.DimInningsID,-1) as DimInningsID,
isnull(dbp.DimBattingPositionID,-1) as DimBattingPositionID,
isnull(dpbat.DimPlayerID,-1) as DimBatterID,
isnull(ddi.DimDismissalID,-1) as DimDismissalID,
-2 as DimWicketTakerID,
-2 as DimFielderID,
case when s.PlayerName = 'Extras' then 'Y' else 'N' end as IsExtrasFlag,
DismissedCount,
RunsScored,
MinutesBatted,
BallsFaced,
BoundaryFours,
BoundarySixes
from CricketRec.dbo.ScorecardBattingRow s
join CricketRec.dbo.Match m
	on m.Url = s.MatchUrl
left join CricketDDS.dbo.DimMatch dm
	on s.MatchUrl = dm.MatchUrl
left join CricketDDS.dbo.DimBattingPosition dbp
	on s.BattingOrder = dbp.BattingPosition
left join CricketDDS.dbo.DimDate dd
	on m.DimMatchStartDateKey = dd.DateKey
left join CricketDDS.dbo.DimDismissal ddi
	on ddi.DismissalName = s.DismissalName
left join DimInnings di
	on di.InningsNumber = s.InningsNum
left join DimResult dr
	on dr.Result = m.Result
	and dr.HomeAwayResult = m.HomeAwayResult
left join DimSeries ds
	on ds.SeriesName = m.SeriesName
left join DimTeam dt
	on dt.Team = s.Team
left join DimTeam dttoss
	on dttoss.Team = m.TossWinningTeam
left join DimTeam dtbowl
	on dtbowl.Team = s.BowlingTeam
left join DimPlayer dpbat
	on dpbat.PlayerUrl = 'http://'+replace(s.PlayerUrl,'the-ashes-2013-14','ci')
left join DimGround dg
	on dg.GroundUrl = 'http://' + m.GroundUrl
left join DimMatchType dmt
	on dmt.MatchType = 'Test'





insert into FactBattingScorecard
select
isnull(dmt.DimMatchTypeID,-1) as DimMatchTypeID,
isnull(ds.DimSeriesID,-1) as DimSeriesID,
isnull(dm.DimMatchID,-1) as DimMatchID,
isnull(dd.DateKey,-1) as DimMatchStartDateKey,
isnull(dg.DimGroundID,-1) as DimGroundID,
isnull(dr.DimResultID,-1) as DimResultID,
isnull(dttoss.DimTeamID,-1) as DimTossWinningTeamID,
isnull(dt.DimTeamID,-1) as DimBattingTeamID,
isnull(dtbowl.DimTeamID, -1) as DimBowlingTeamID,
isnull(di.DimInningsID,-1) as DimInningsID,
isnull(dbp.DimBattingPositionID,-1) as DimBattingPositionID,
isnull(dpbat.DimPlayerID,-1) as DimBatterID,
isnull(ddi.DimDismissalID,-1) as DimDismissalID,
-2 as DimWicketTakerID,
-2 as DimFielderID,
case when s.PlayerName = 'Extras' then 'Y' else 'N' end as IsExtrasFlag,
DismissedCount,
RunsScored,
MinutesBatted,
BallsFaced,
BoundaryFours,
BoundarySixes
from CricketRec.dbo.ODIScorecardBattingRow s
join CricketRec.dbo.ODIMatch m
	on m.ODIName = s.ODIName
left join CricketDDS.dbo.DimMatch dm
	on s.MatchUrl = dm.MatchUrl
left join CricketDDS.dbo.DimBattingPosition dbp
	on s.BattingOrder = dbp.BattingPosition
left join CricketDDS.dbo.DimDate dd
	on m.DimMatchStartDateKey = dd.DateKey
left join CricketDDS.dbo.DimDismissal ddi
	on ddi.DismissalName = s.DismissalName
left join DimInnings di
	on di.InningsNumber = s.InningsNum
left join DimResult dr
	on dr.Result = m.Result
	and dr.HomeAwayResult = m.HomeAwayResult
left join DimSeries ds
	on ds.SeriesName = m.SeriesName
left join DimTeam dt
	on dt.Team = s.Team
left join DimTeam dttoss
	on dttoss.Team = m.TossWinningTeam
left join DimTeam dtbowl
	on dtbowl.Team = s.BowlingTeam
left join DimPlayer dpbat
	on dpbat.PlayerUrl = 'http://'+replace(s.PlayerUrl,'the-ashes-2013-14','ci')
left join DimGround dg
	on dg.GroundUrl = 'http://' + m.GroundUrl
left join DimMatchType dmt
	on dmt.MatchType = 'ODI'


GO


