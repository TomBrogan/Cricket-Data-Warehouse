USE [CricketRec]
GO

/****** Object:  Table [dbo].[BallByBallUpdated]    Script Date: 03/12/2016 23:56:44 ******/
DROP TABLE [dbo].[BallByBallUpdated]
GO

/****** Object:  Table [dbo].[BallByBallUpdated]    Script Date: 03/12/2016 23:56:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[BallByBallUpdated](
	[MatchNum] [int] NULL,
	[Innings] [int] NULL,
	[Rownum] [bigint] NULL,
	[Url] [varchar](8000) NULL,
	[BallNum] [varchar](8000) NULL,
	[Bowler] [varchar](8000) NULL,
	[Batsman] [varchar](8000) NULL,
	[Result] [varchar](8000) NULL,
	[Commentary] [varchar](8000) NULL,
	[NextComms] [varchar](8000) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


