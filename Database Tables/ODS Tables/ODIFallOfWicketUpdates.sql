USE [CricketRec]
GO

/****** Object:  Table [dbo].[ODIFallOfWicketUpdates]    Script Date: 03/12/2016 23:57:33 ******/
DROP TABLE [dbo].[ODIFallOfWicketUpdates]
GO

/****** Object:  Table [dbo].[ODIFallOfWicketUpdates]    Script Date: 03/12/2016 23:57:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[ODIFallOfWicketUpdates](
	[ODIName] [varchar](30) NOT NULL,
	[InningsNum] [int] NOT NULL,
	[SequenceNumber] [int] NOT NULL,
	[ReturnsAfterWicket] [int] NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


