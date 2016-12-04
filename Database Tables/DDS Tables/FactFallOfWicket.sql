USE [CricketDDS]
GO

/****** Object:  Table [dbo].[FactFallOfWicket]    Script Date: 04/12/2016 00:20:47 ******/
DROP TABLE [dbo].[FactFallOfWicket]
GO

/****** Object:  Table [dbo].[FactFallOfWicket]    Script Date: 04/12/2016 00:20:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[FactFallOfWicket](
	[DimSeriesID] [int] NOT NULL,
	[DimMatchID] [int] NOT NULL,
	[DimMatchStartDateKey] [int] NOT NULL,
	[DimGroundID] [int] NOT NULL,
	[DimResultID] [int] NOT NULL,
	[DimTossWinningTeamID] [int] NOT NULL,
	[DimBattingTeamID] [int] NOT NULL,
	[DimBowlingTeamID] [int] NOT NULL,
	[DimInningsID] [int] NOT NULL,
	[DimBatterID] [int] NOT NULL,
	[SequenceNumber] [bigint] NULL,
	[FallOfWicket] [varchar](8000) NULL,
	[IsOut] [varchar](1) NOT NULL,
	[WicketNumber] [int] NULL,
	[RunsAtFallOfWicket] [int] NULL,
	[FullOversBowled] [int] NULL,
	[BallsBowledInCurrentOver] [int] NULL,
	[BallsBowled] [int] NULL,
	[DismissalCount] [int] NOT NULL,
	[Partnership] [int] NULL,
	[BallsBowledSinceLastKnownPoint] [int] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


