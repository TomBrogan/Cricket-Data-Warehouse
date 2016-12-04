USE [CricketOSA]
GO

/****** Object:  Table [dbo].[TestYearUrlList]    Script Date: 03/12/2016 16:04:54 ******/
DROP TABLE [dbo].[TestYearUrlList]
GO

/****** Object:  Table [dbo].[TestYearUrlList]    Script Date: 03/12/2016 16:04:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[TestYearUrlList](
	[rownum] [bigint] NULL,
	[TestYear] [bigint] NOT NULL,
	[Url] [varchar](8000) NULL,
	[Result] [varchar](50) NULL,
	[YearCompleted] [varchar](10) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


