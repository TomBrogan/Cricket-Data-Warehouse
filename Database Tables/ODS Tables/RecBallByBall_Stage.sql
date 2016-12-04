USE [CricketRec]
GO

/****** Object:  Table [dbo].[RecBallByBall_Stage]    Script Date: 03/12/2016 23:58:12 ******/
DROP TABLE [dbo].[RecBallByBall_Stage]
GO

/****** Object:  Table [dbo].[RecBallByBall_Stage]    Script Date: 03/12/2016 23:58:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[RecBallByBall_Stage](
	[RowNum] [bigint] NULL,
	[Url] [varchar](8000) NULL,
	[MatchNum] [int] NULL,
	[Innings] [int] NULL,
	[Page] [int] NULL,
	[OverNum] [int] NULL,
	[BallNumInOver] [int] NULL,
	[BallNum] [varchar](8000) NULL,
	[Bowler] [varchar](8000) NULL,
	[BowlerScorecardName] [varchar](8000) NULL,
	[Batsman] [varchar](8000) NULL,
	[BatsmanScorecardName] [varchar](8000) NULL,
	[Result] [varchar](8000) NULL,
	[Commentary] [varchar](8000) NULL,
	[TeamRuns] [int] NULL,
	[TeamWickets] [int] NULL,
	[BatsmanRuns] [int] NULL,
	[BowlerConceded] [int] NULL,
	[BowlerWicket] [int] NULL,
	[BatsmanWicket] [int] NULL,
	[Extras] [int] NULL,
	[Byes] [int] NULL,
	[LegByes] [int] NULL,
	[Wides] [int] NULL,
	[NoBalls] [int] NULL,
	[PenaltyRuns] [int] NULL,
	[BallCount] [int] NULL,
	[WicketsLost] [int] NULL,
	[NoBatsmenDuringWicket] [int] NULL,
	[NoBatsmenRunningTotal] [int] NULL,
	[BattingPartner] [varchar](800) NULL,
	[BatterDismissed] [varchar](50) NULL,
	[InsertedFrom] [varchar](800) NULL,
	[UpdatedFrom] [varchar](800) NULL,
	[UpdatedReason] [varchar](800) NULL,
	[IssueDetected] [varchar](1) NULL,
	[TotalRunsInOver] [int] NULL,
	[TotalRunsInInnings] [int] NULL,
	[BatsmanRunsInInnings] [int] NULL,
	[BowlerRunsInInnings] [int] NULL,
	[ScorecardTotal] [int] NULL,
	[ScorecardBatsmanTotal] [int] NULL,
	[ScorecardBowlerTotal] [int] NULL,
	[EndOfOverRunsInOver] [int] NULL,
	[OverByOverRunsInOver] [int] NULL,
	[InningsTotalMismatch] [varchar](2) NULL,
	[BattingTotalMismatch] [varchar](2) NULL,
	[BowlingTotalMismatch] [varchar](2) NULL,
	[OverRunsMismatch] [varchar](2) NULL,
	[BowlerWicketsToDate] [int] NULL,
	[BowlerRunsConcededToDate] [int] NULL,
	[BowlerDeliveriesToDate] [int] NULL,
	[BowlerAsAtStrikeRate] [numeric](18, 6) NULL,
	[BowlerAsAtEconomy] [numeric](18, 6) NULL,
	[BatterAsAtRunRate] [numeric](18, 6) NULL,
	[BatterAsAtDismissalRate] [numeric](18, 6) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


