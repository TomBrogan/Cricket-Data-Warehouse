USE [CricketRec]
GO

/****** Object:  Table [dbo].[BallByBallToUpdateResult]    Script Date: 03/12/2016 23:56:40 ******/
DROP TABLE [dbo].[BallByBallToUpdateResult]
GO

/****** Object:  Table [dbo].[BallByBallToUpdateResult]    Script Date: 03/12/2016 23:56:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[BallByBallToUpdateResult](
	[RowNum] [bigint] NULL,
	[Url] [varchar](8000) NULL,
	[NewResult] [varchar](50) NOT NULL,
	[UpdateReason] [varchar](50) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


