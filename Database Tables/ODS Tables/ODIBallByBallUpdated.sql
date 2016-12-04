USE [CricketRec]
GO

/****** Object:  Table [dbo].[ODIBallByBallUpdated]    Script Date: 03/12/2016 23:57:19 ******/
DROP TABLE [dbo].[ODIBallByBallUpdated]
GO

/****** Object:  Table [dbo].[ODIBallByBallUpdated]    Script Date: 03/12/2016 23:57:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[ODIBallByBallUpdated](
	[ODIName] [varchar](8000) NULL,
	[Innings] [bigint] NOT NULL,
	[RowNum] [bigint] NULL,
	[Url] [varchar](8000) NULL,
	[BallNum] [varchar](8000) NULL,
	[bowler] [varchar](8000) NULL,
	[batsman] [varchar](8000) NULL,
	[result] [varchar](8000) NULL,
	[commentary] [varchar](8000) NULL,
	[nextcomms] [varchar](8000) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


