USE [CricketOSA]
GO

/****** Object:  Table [dbo].[BallByBallUrlList]    Script Date: 03/12/2016 15:59:28 ******/
DROP TABLE [dbo].[BallByBallUrlList]
GO

/****** Object:  Table [dbo].[BallByBallUrlList]    Script Date: 03/12/2016 15:59:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[BallByBallUrlList](
	[rownum] [bigint] NULL,
	[Root] [varchar](800) NULL,
	[TestName] [varchar](800) NULL,
	[MatchNum] [int] NULL,
	[Innings] [int] NULL,
	[Page] [int] NULL,
	[Url] [varchar](800) NULL,
	[Result] [varchar](50) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


