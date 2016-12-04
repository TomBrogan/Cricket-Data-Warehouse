USE [CricketRec]
GO

/****** Object:  Table [dbo].[BallByBallToInsert]    Script Date: 03/12/2016 23:56:34 ******/
DROP TABLE [dbo].[BallByBallToInsert]
GO

/****** Object:  Table [dbo].[BallByBallToInsert]    Script Date: 03/12/2016 23:56:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[BallByBallToInsert](
	[MatchNum] [int] NULL,
	[Innings] [int] NULL,
	[RowNum] [int] NULL,
	[Url] [varchar](8000) NULL,
	[BallNum] [varchar](5) NULL,
	[Bowler] [varchar](15) NULL,
	[Batsman] [varchar](17) NULL,
	[Result] [varchar](3) NULL,
	[Commentary] [varchar](800) NULL,
	[NextComms] [varchar](800) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


