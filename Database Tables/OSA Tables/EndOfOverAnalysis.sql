USE [CricketOSA]
GO

/****** Object:  Table [dbo].[EndOfOverAnalysis]    Script Date: 03/12/2016 15:59:52 ******/
DROP TABLE [dbo].[EndOfOverAnalysis]
GO

/****** Object:  Table [dbo].[EndOfOverAnalysis]    Script Date: 03/12/2016 15:59:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[EndOfOverAnalysis](
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


