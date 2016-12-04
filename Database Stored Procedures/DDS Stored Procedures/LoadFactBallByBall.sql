USE [CricketDDS]
GO

/****** Object:  StoredProcedure [dbo].[LoadFactBallByBall]    Script Date: 04/12/2016 00:13:13 ******/
DROP PROCEDURE [dbo].[LoadFactBallByBall]
GO

/****** Object:  StoredProcedure [dbo].[LoadFactBallByBall]    Script Date: 04/12/2016 00:13:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO










CREATE proc [dbo].[LoadFactBallByBall] as 

truncate table FactBallByBall;

insert into FactBallByBall
select
isnull(ds.DimSeriesID, -1) as DimSeriesID
, isnull(dm.DimMatchID, -1) as DimMatchID
, isnull(dd.DateKey, -1) as DimMatchStartDateKey
, isnull(dg.DimGroundID, -1) as DimGroundID
, isnull(dr.DimResultID, -1) as DimMatchResultID
, isnull(di.DimInningsID, -1) as DimInningsID
, isnull(dt.DimTeamID, -1) as DimBattingTeamID
, isnull(dtbowl.DimTeamID, -1) as DimBowlingTeamID
, isnull(dbp.DimBattingPositionID, -1) as DimBattingPositionID
, isnull(dpbat.DimPlayerID, -1) as DimBatterID
, isnull(dpbowl.DimPlayerID, -1) as DimBowlerID
, isnull(ddi.DimDismissalID, -1) as DimDismissalID
, isnull(dppart.DimPlayerID, -1) as DimBattingPartnerID
, isnull(dbp2.DimBattingPositionID, -1) as DimBattingPartnerBattingPositionID
, bb.OverNum
, bb.BallNumInOver
, bb.BallNum
, bb.Commentary
, bb.TeamRuns
, bb.TeamWickets
, bb.BatsmanRuns
, bb.BatsmanWicket
, bb.BowlerConceded
, bb.BowlerWicket
, bb.Extras
, bb.Byes
, bb.LegByes
, bb.Wides
, bb.NoBalls
, bb.PenaltyRuns
, bb.BallCount
, null as ResourcesUsed
, null as WicketResourcesUsed
, null as BallResourcesUsed
, bb.BowlerAsAtStrikeRate
, bb.BowlerAsAtEconomy
, bb.BatterAsAtRunRate
, bb.BatterAsAtDismissalRate
, bb.InsertedFrom
from CricketRec.dbo.RecBallByBall bb
left join CricketRec.dbo.ScorecardBattingRow s
	on bb.BatsmanScorecardName = s.PlayerName
	and bb.MatchNum = s.MatchNum
	and bb.Innings = s.InningsNum
left join CricketRec.dbo.Match m
	on m.MatchNum = bb.MatchNum
left join CricketRec.dbo.ScorecardBowlingRow sbowl
	on bb.BowlerScorecardName = sbowl.Bowler
	and bb.MatchNum = sbowl.MatchNum
	and bb.Innings = sbowl.InningsNum
left join CricketRec.dbo.ScorecardBattingRow s2
	on bb.BattingPartner = s2.PlayerName
	and bb.MatchNum = s2.MatchNum
	and bb.Innings = s2.InningsNum
left join DimPlayer dpbat
	on dpbat.PlayerUrl = 'http://'+replace(s.PlayerUrl,'the-ashes-2013-14','ci')
left join DimPlayer dpbowl
	on dpbowl.PlayerUrl = 'http://'+replace(sbowl.PlayerUrl,'the-ashes-2013-14','ci')
left join DimPlayer dppart
	on dppart.PlayerUrl = 'http://'+replace(s2.PlayerUrl,'the-ashes-2013-14','ci')
left join DimBattingPosition dbp
	on s.BattingOrder = dbp.BattingPosition
left join DimBattingPosition dbp2
	on s2.BattingOrder = dbp2.BattingPosition
left join DimInnings di
	on di.InningsNumber = coalesce(s.InningsNum, sbowl.inningsnum)
left join DimResult dr
	on dr.Result = m.Result
	and dr.HomeAwayResult = m.HomeAwayResult
left join DimSeries ds
	on ds.SeriesName = m.SeriesName
left join DimTeam dt
	on dt.Team = s.Team
left join DimTeam dtbowl
	on dtbowl.Team = sbowl.BowlingTeam
left join CricketDDS.dbo.DimDate dd
	on m.DimMatchStartDateKey = dd.DateKey
left join CricketDDS.dbo.DimMatch dm
	on bb.MatchNum = dm.MatchNum
left join DimDismissal ddi
	on ddi.DismissalName = s.DismissalName
left join DimGround dg
	on dg.GroundUrl = 'http://' + m.GroundUrl

insert into FactBallByBall
select
isnull(ds.DimSeriesID, -1) as DimSeriesID
, isnull(dm.DimMatchID, -1) as DimMatchID
, isnull(dd.DateKey, -1) as DimMatchStartDateKey
, isnull(dg.DimGroundID, -1) as DimGroundID
, isnull(dr.DimResultID, -1) as DimMatchResultID
, isnull(di.DimInningsID, -1) as DimInningsID
, isnull(dt.DimTeamID, -1) as DimBattingTeamID
, isnull(dtbowl.DimTeamID, -1) as DimBowlingTeamID
, isnull(dbp.DimBattingPositionID, -1) as DimBattingPositionID
, isnull(dpbat.DimPlayerID, -1) as DimBatterID
, isnull(dpbowl.DimPlayerID, -1) as DimBowlerID
, isnull(ddi.DimDismissalID, -1) as DimDismissalID
, -2 as DimBattingPartnerID --isnull(dppart.DimPlayerID, -1) as DimBattingPartnerID
, -2 as DimBattingPartnerBattingPositionID --isnull(dbp2.DimBattingPositionID, -1) as DimBattingPartnerBattingPositionID
, bb.OverNum
, bb.BallNumInOver
, bb.BallNum
, bb.Commentary
, bb.TeamRuns
, bb.TeamWickets
, bb.BatsmanRuns
, bb.BatsmanWicket
, bb.BowlerConceded
, bb.BowlerWicket
, bb.Extras
, bb.Byes
, bb.LegByes
, bb.Wides
, bb.NoBalls
, bb.PenaltyRuns
, bb.BallCount
, bb.ResourcesUsed
, bb.WicketResourcesUsed
, bb.BallResourcesUsed
, null --bb.BowlerAsAtStrikeRate
, null --bb.BowlerAsAtEconomy
, null --bb.BatterAsAtRunRate
, null --bb.BatterAsAtDismissalRate
, null --bb.InsertedFrom
from CricketRec.dbo.ODIRecBallByBall bb
left join CricketRec.dbo.ODIScorecardBattingRow s
	on bb.BatsmanScorecardName = s.PlayerName
	and bb.ODIName = s.ODIName
	and bb.Innings = s.InningsNum
left join CricketRec.dbo.ODIMatch m
	on m.ODIName = bb.ODIName
left join CricketRec.dbo.ODIScorecardBowlingRow sbowl
	on bb.BowlerScorecardName = sbowl.Bowler
	and bb.ODIName = sbowl.ODIName
	and bb.Innings = sbowl.InningsNum
--left join CricketRec.dbo.ScorecardBattingRow s2
--	on bb.BattingPartner = s2.PlayerName
--	and bb.MatchNum = s2.MatchNum
--	and bb.Innings = s2.InningsNum
left join DimPlayer dpbat
	on dpbat.PlayerUrl = 'http://'+replace(s.PlayerUrl,'the-ashes-2013-14','ci')
left join DimPlayer dpbowl
	on dpbowl.PlayerUrl = 'http://'+replace(sbowl.PlayerUrl,'the-ashes-2013-14','ci')
--left join DimPlayer dppart
--	on dppart.PlayerUrl = 'http://'+replace(s2.PlayerUrl,'the-ashes-2013-14','ci')
left join DimBattingPosition dbp
	on s.BattingOrder = dbp.BattingPosition
--left join DimBattingPosition dbp2
--	on s2.BattingOrder = dbp2.BattingPosition
left join DimInnings di
	on di.InningsNumber = coalesce(s.InningsNum, sbowl.inningsnum)
left join DimResult dr
	on dr.Result = m.Result
	and dr.HomeAwayResult = m.HomeAwayResult
left join DimSeries ds
	on ds.SeriesName = m.SeriesName
left join DimTeam dt
	on dt.Team = s.Team
left join DimTeam dtbowl
	on dtbowl.Team = sbowl.BowlingTeam
left join CricketDDS.dbo.DimDate dd
	on m.DimMatchStartDateKey = dd.DateKey
left join CricketDDS.dbo.DimMatch dm
	on bb.ODIName = dm.ODIName
left join DimDismissal ddi
	on ddi.DismissalName = s.DismissalName
left join DimGround dg
	on dg.GroundUrl = 'http://' + m.GroundUrl





GO


