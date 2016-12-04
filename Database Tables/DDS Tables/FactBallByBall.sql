USE [CricketDDS]
GO

/****** Object:  Table [dbo].[FactBallByBall]    Script Date: 04/12/2016 00:20:37 ******/
DROP TABLE [dbo].[FactBallByBall]
GO

/****** Object:  Table [dbo].[FactBallByBall]    Script Date: 04/12/2016 00:20:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[FactBallByBall](
	[DimSeriesID] [int] NOT NULL,
	[DimMatchID] [int] NOT NULL,
	[DimMatchStartDateKey] [int] NOT NULL,
	[DimGroundID] [int] NOT NULL,
	[DimMatchResultID] [int] NOT NULL,
	[DimInningsID] [int] NOT NULL,
	[DimBattingTeamID] [int] NOT NULL,
	[DimBowlingTeamID] [int] NOT NULL,
	[DimBattingPositionID] [int] NOT NULL,
	[DimBatterID] [int] NOT NULL,
	[DimBowlerID] [int] NOT NULL,
	[DimDismissalID] [int] NOT NULL,
	[DimBattingPartnerID] [int] NOT NULL,
	[DimBattingPartnerBattingPositionID] [int] NULL,
	[OverNum] [int] NULL,
	[BallNumInOver] [int] NULL,
	[BallNum] [varchar](8000) NULL,
	[Commentary] [varchar](8000) NULL,
	[TeamRuns] [int] NULL,
	[TeamWickets] [int] NULL,
	[BatsmanRuns] [int] NULL,
	[BatsmanWicket] [int] NULL,
	[BowlerConceded] [int] NULL,
	[BowlerWicket] [int] NULL,
	[Extras] [int] NULL,
	[Byes] [int] NULL,
	[LegByes] [int] NULL,
	[Wides] [int] NULL,
	[NoBalls] [int] NULL,
	[PenaltyRuns] [int] NULL,
	[BallCount] [int] NULL,
	[ResourcesUsed] [numeric](7, 5) NULL,
	[WicketResourcesUsed] [numeric](7, 5) NULL,
	[BallResourcesUsed] [numeric](7, 5) NULL,
	[BowlerAsAtStrikeRate] [numeric](18, 6) NULL,
	[BowlerAsAtEconomy] [numeric](18, 6) NULL,
	[BatterAsAtRunRate] [numeric](18, 6) NULL,
	[BatterAsAtDismissalRate] [numeric](18, 6) NULL,
	[InsertedFrom] [varchar](800) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


