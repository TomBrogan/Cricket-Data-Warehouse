USE [CricketDDS]
GO

/****** Object:  Table [dbo].[FactBowlingScorecard]    Script Date: 04/12/2016 00:20:43 ******/
DROP TABLE [dbo].[FactBowlingScorecard]
GO

/****** Object:  Table [dbo].[FactBowlingScorecard]    Script Date: 04/12/2016 00:20:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[FactBowlingScorecard](
	[DimSeriesID] [int] NOT NULL,
	[DimMatchID] [int] NOT NULL,
	[DimMatchStartDateKey] [int] NOT NULL,
	[DimGroundID] [int] NOT NULL,
	[DimResultID] [int] NOT NULL,
	[DimBattingTeamID] [int] NOT NULL,
	[DimBowlingTeamID] [int] NOT NULL,
	[DimInningsID] [int] NOT NULL,
	[DimBowlerID] [int] NOT NULL,
	[BowlingTeamAtHome] [varchar](2) NULL,
	[BowlingPosition] [int] NULL,
	[Overs] [varchar](200) NULL,
	[FullOvers] [int] NULL,
	[PartOver] [int] NULL,
	[Deliveries] [int] NULL,
	[Maidens] [int] NULL,
	[Runs] [int] NULL,
	[Wickets] [int] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


