USE [CricketOSA]
GO

/****** Object:  Table [dbo].[BallByBall]    Script Date: 03/12/2016 15:59:18 ******/
DROP TABLE [dbo].[BallByBall]
GO

/****** Object:  Table [dbo].[BallByBall]    Script Date: 03/12/2016 15:59:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[BallByBall](
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


