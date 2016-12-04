USE [CricketDDS]
GO

ALTER TABLE [dbo].[FactBattingScorecard] DROP CONSTRAINT [DF_FactBattingScorecard_IsExtrasFlag]
GO

ALTER TABLE [dbo].[FactBattingScorecard] DROP CONSTRAINT [DF_FactBattingScorecard_DimTossWinningTeamID]
GO

/****** Object:  Table [dbo].[FactBattingScorecard]    Script Date: 04/12/2016 00:20:40 ******/
DROP TABLE [dbo].[FactBattingScorecard]
GO

/****** Object:  Table [dbo].[FactBattingScorecard]    Script Date: 04/12/2016 00:20:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[FactBattingScorecard](
	[DimMatchTypeID] [int] NOT NULL,
	[DimSeriesID] [int] NOT NULL,
	[DimMatchID] [int] NOT NULL,
	[DimMatchStartDateKey] [int] NOT NULL,
	[DimGroundID] [int] NOT NULL,
	[DimResultID] [int] NOT NULL,
	[DimTossWinningTeamID] [int] NOT NULL,
	[DimBattingTeamID] [int] NOT NULL,
	[DimBowlingTeamID] [int] NOT NULL,
	[DimInningsID] [int] NOT NULL,
	[DimBattingPositionID] [int] NOT NULL,
	[DimBatterID] [int] NOT NULL,
	[DimDismissalID] [int] NOT NULL,
	[DimWicketTakerID] [int] NOT NULL,
	[DimFielderID] [int] NOT NULL,
	[IsExtrasFlag] [varchar](2) NOT NULL,
	[DismissedCount] [int] NULL,
	[RunsScored] [int] NULL,
	[MinutesBatted] [int] NULL,
	[BallsFaced] [int] NULL,
	[BoundaryFours] [int] NULL,
	[BoundarySixes] [int] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[FactBattingScorecard] ADD  CONSTRAINT [DF_FactBattingScorecard_DimTossWinningTeamID]  DEFAULT ((-2)) FOR [DimTossWinningTeamID]
GO

ALTER TABLE [dbo].[FactBattingScorecard] ADD  CONSTRAINT [DF_FactBattingScorecard_IsExtrasFlag]  DEFAULT ('N') FOR [IsExtrasFlag]
GO


