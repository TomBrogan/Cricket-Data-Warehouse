USE [CricketOSA]
GO

/****** Object:  Table [dbo].[ODIEndOfOverAnalysis]    Script Date: 03/12/2016 16:00:49 ******/
DROP TABLE [dbo].[ODIEndOfOverAnalysis]
GO

/****** Object:  Table [dbo].[ODIEndOfOverAnalysis]    Script Date: 03/12/2016 16:00:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[ODIEndOfOverAnalysis](
	[rownum] [bigint] NULL,
	[Url] [varchar](800) NULL,
	[OverNum] [varchar](8000) NULL,
	[OverResult] [varchar](8000) NULL,
	[Score] [varchar](8000) NULL,
	[BatsmanOnStrike] [varchar](8000) NULL,
	[BatsmanOnStrikeScore] [varchar](8000) NULL,
	[CurrentBowler] [varchar](8000) NULL,
	[CurrentBowlerAnalysis] [varchar](8000) NULL,
	[BatsmanOffStrike] [varchar](8000) NULL,
	[BatsmanOffStrikeScore] [varchar](8000) NULL,
	[OtherBowler] [varchar](8000) NULL,
	[OtherBowlerAnalysis] [varchar](8000) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


