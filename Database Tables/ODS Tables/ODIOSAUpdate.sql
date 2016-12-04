USE [CricketRec]
GO

/****** Object:  Table [dbo].[ODIOSAUpdate]    Script Date: 03/12/2016 23:57:40 ******/
DROP TABLE [dbo].[ODIOSAUpdate]
GO

/****** Object:  Table [dbo].[ODIOSAUpdate]    Script Date: 03/12/2016 23:57:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[ODIOSAUpdate](
	[UpdateColumn] [varchar](7) NOT NULL,
	[UpdateValue] [varchar](15) NOT NULL,
	[ODIName] [varchar](20) NULL,
	[InningsNum] [int] NOT NULL,
	[BallNum] [varchar](5) NOT NULL,
	[RowNum] [int] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


