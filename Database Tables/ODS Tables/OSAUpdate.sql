USE [CricketRec]
GO

/****** Object:  Table [dbo].[OSAUpdate]    Script Date: 03/12/2016 23:58:00 ******/
DROP TABLE [dbo].[OSAUpdate]
GO

/****** Object:  Table [dbo].[OSAUpdate]    Script Date: 03/12/2016 23:58:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[OSAUpdate](
	[UpdateColumn] [varchar](7) NOT NULL,
	[UpdateValue] [varchar](15) NOT NULL,
	[MatchNum] [int] NOT NULL,
	[InningsNum] [int] NOT NULL,
	[BallNum] [varchar](5) NOT NULL,
	[RowNum] [int] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


