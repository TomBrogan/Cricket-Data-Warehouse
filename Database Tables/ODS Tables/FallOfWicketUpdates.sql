USE [CricketRec]
GO

/****** Object:  Table [dbo].[FallofWicketUpdates]    Script Date: 03/12/2016 23:57:05 ******/
DROP TABLE [dbo].[FallofWicketUpdates]
GO

/****** Object:  Table [dbo].[FallofWicketUpdates]    Script Date: 03/12/2016 23:57:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FallofWicketUpdates](
	[MatchNum] [int] NOT NULL,
	[InningsNum] [int] NOT NULL,
	[SequenceNumber] [int] NOT NULL,
	[ReturnsAfterWicket] [int] NOT NULL
) ON [PRIMARY]

GO


