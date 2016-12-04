USE [CricketOSA]
GO

/****** Object:  Table [dbo].[ODIScorecardBatting]    Script Date: 03/12/2016 16:01:10 ******/
DROP TABLE [dbo].[ODIScorecardBatting]
GO

/****** Object:  Table [dbo].[ODIScorecardBatting]    Script Date: 03/12/2016 16:01:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[ODIScorecardBatting](
	[Url] [varchar](800) NULL,
	[InningsNum] [varchar](8000) NULL,
	[Title] [varchar](8000) NULL,
	[col1] [varchar](800) NULL,
	[col2] [varchar](800) NULL,
	[col3] [varchar](800) NULL,
	[col4] [varchar](800) NULL,
	[BattingOrder] [int] NULL,
	[Name] [varchar](8000) NULL,
	[PlayerUrl] [varchar](8000) NULL,
	[Dismissal] [varchar](8000) NULL,
	[RunsScored] [varchar](8000) NULL,
	[Details1] [varchar](800) NULL,
	[Details2] [varchar](800) NULL,
	[Details3] [varchar](800) NULL,
	[Details4] [varchar](800) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


