USE [CricketOSA]
GO

/****** Object:  Table [dbo].[ODIBallByBallUrlList]    Script Date: 03/12/2016 16:00:45 ******/
DROP TABLE [dbo].[ODIBallByBallUrlList]
GO

/****** Object:  Table [dbo].[ODIBallByBallUrlList]    Script Date: 03/12/2016 16:00:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[ODIBallByBallUrlList](
	[rownum] [bigint] NULL,
	[Root] [varchar](8000) NULL,
	[ODIName] [varchar](8000) NULL,
	[Innings] [bigint] NOT NULL,
	[Url] [varchar](8000) NULL,
	[Result] [varchar](7) NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


