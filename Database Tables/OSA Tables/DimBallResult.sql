USE [CricketOSA]
GO

ALTER TABLE [dbo].[DimBallResult] DROP CONSTRAINT [DF_DimBallResult_BallCount]
GO

/****** Object:  Table [dbo].[DimBallResult]    Script Date: 03/12/2016 16:19:51 ******/
DROP TABLE [dbo].[DimBallResult]
GO

/****** Object:  Table [dbo].[DimBallResult]    Script Date: 03/12/2016 16:19:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[DimBallResult](
	[Result] [varchar](8000) NULL,
	[TeamRuns] [int] NOT NULL,
	[TeamWickets] [int] NOT NULL,
	[BatsmanRuns] [int] NOT NULL,
	[BowlerConceded] [int] NOT NULL,
	[Bowlerwicket] [int] NOT NULL,
	[Extras] [int] NOT NULL,
	[Byes] [int] NULL,
	[LegByes] [int] NULL,
	[Wides] [int] NULL,
	[NoBalls] [int] NULL,
	[PenaltyRuns] [int] NULL,
	[BallCount] [int] NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[DimBallResult] ADD  CONSTRAINT [DF_DimBallResult_BallCount]  DEFAULT ((1)) FOR [BallCount]
GO


