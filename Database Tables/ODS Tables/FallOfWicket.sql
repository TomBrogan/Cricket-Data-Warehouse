USE [CricketRec]
GO

/****** Object:  Table [dbo].[FallOfWicket]    Script Date: 03/12/2016 23:57:00 ******/
DROP TABLE [dbo].[FallOfWicket]
GO

/****** Object:  Table [dbo].[FallOfWicket]    Script Date: 03/12/2016 23:57:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[FallOfWicket](
	[MatchUrl] [varchar](800) NULL,
	[MatchNum] [bigint] NULL,
	[InningsNum] [int] NULL,
	[InningsName] [varchar](8000) NULL,
	[BattingTeam] [varchar](8000) NULL,
	[BowlingTeam] [varchar](8000) NULL,
	[FallOfWicket] [varchar](8000) NULL,
	[WicketNumber] [int] NULL,
	[Runs] [int] NULL,
	[IsOut] [varchar](1) NOT NULL,
	[DepartingBatsman] [varchar](8000) NULL,
	[DepartingBatsmanUrl] [varchar](8000) NULL,
	[RemainingBatsman] [varchar](8000) NULL,
	[RemainingBatsmanUrl] [varchar](8000) NULL,
	[OversBowled] [varchar](8000) NULL,
	[FullOversBowled] [int] NULL,
	[BallsBowledInCurrentOver] [int] NULL,
	[BallsBowled] [int] NULL,
	[Partnership] [int] NULL,
	[BallsBowledSinceLastKnownPoint] [int] NULL,
	[SequenceNumber] [bigint] NULL,
	[ReturnsAfterWicket] [int] NULL,
	[BallByBallOversBowled] [varchar](10) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


