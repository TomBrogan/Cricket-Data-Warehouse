USE [CricketRec]
GO

/****** Object:  Table [dbo].[ODIFallOfWicketOverNumUpdates]    Script Date: 03/12/2016 23:57:30 ******/
DROP TABLE [dbo].[ODIFallOfWicketOverNumUpdates]
GO

/****** Object:  Table [dbo].[ODIFallOfWicketOverNumUpdates]    Script Date: 03/12/2016 23:57:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[ODIFallOfWicketOverNumUpdates](
	[ODIName] [varchar](50) NOT NULL,
	[InningsNum] [int] NOT NULL,
	[SequenceNumber] [int] NOT NULL,
	[BallByBallOverNum] [varchar](50) NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


