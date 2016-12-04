USE [CricketRec]
GO

/****** Object:  Table [dbo].[ODIRecBallByBall_Stage]    Script Date: 03/12/2016 23:57:48 ******/
DROP TABLE [dbo].[ODIRecBallByBall_Stage]
GO

/****** Object:  Table [dbo].[ODIRecBallByBall_Stage]    Script Date: 03/12/2016 23:57:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[ODIRecBallByBall_Stage](
	[RowNum] [bigint] NULL,
	[Url] [varchar](8000) NULL,
	[ODIName] [varchar](8000) NULL,
	[Innings] [bigint] NOT NULL,
	[OverNum] [int] NULL,
	[BallNumInOver] [int] NULL,
	[BallNum] [varchar](8000) NULL,
	[Bowler] [varchar](8000) NULL,
	[BowlerScorecardName] [varchar](8000) NULL,
	[Batsman] [varchar](8000) NULL,
	[BatsmanScorecardName] [varchar](8000) NULL,
	[Result] [varchar](8000) NULL,
	[Commentary] [varchar](8000) NULL,
	[RainAffected] [varchar](10) NULL,
	[BattingPartner] [varchar](8000) NULL,
	[BatterDismissed] [varchar](8000) NULL,
	[InsertedFrom] [varchar](200) NULL,
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
	[AsAtRunsInInningsBefore] [int] NULL,
	[AsAtRunsInInningsAfter] [int] NULL,
	[AsAtWicketsInInningsBefore] [int] NULL,
	[AsAtWicketsInInningsAfter] [int] NULL,
	[AsAtBallsBowledBefore] [int] NULL,
	[AsAtBallsBowledAfter] [int] NULL,
	[AsAtBallsRemainingBefore] [int] NULL,
	[AsAtBallsRemainingAfter] [int] NULL,
	[TotalRunsInInnings] [int] NULL,
	[TotalWicketsInInnings] [int] NULL,
	[ResourcesRemainingBefore] [numeric](7, 5) NULL,
	[ResourcesRemainingAfter] [numeric](7, 5) NULL,
	[ResourcesUsed] [numeric](7, 5) NULL,
	[ResourcesRemainingWithoutLostWicket] [numeric](7, 5) NULL,
	[BallResourcesUsed] [numeric](7, 5) NULL,
	[WicketResourcesUsed] [numeric](7, 5) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


