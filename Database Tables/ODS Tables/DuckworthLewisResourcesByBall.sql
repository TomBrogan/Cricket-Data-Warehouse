USE [CricketRec]
GO

/****** Object:  Table [dbo].[DuckworthLewisResourcesByBall]    Script Date: 03/12/2016 23:56:55 ******/
DROP TABLE [dbo].[DuckworthLewisResourcesByBall]
GO

/****** Object:  Table [dbo].[DuckworthLewisResourcesByBall]    Script Date: 03/12/2016 23:56:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DuckworthLewisResourcesByBall](
	[BallsRemaining] [bigint] NULL,
	[WicketsLost] [int] NULL,
	[ResourcesRemaining] [numeric](38, 11) NULL
) ON [PRIMARY]

GO


