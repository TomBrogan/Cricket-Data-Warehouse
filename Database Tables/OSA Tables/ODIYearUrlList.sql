USE [CricketOSA]
GO

/****** Object:  Table [dbo].[ODIYearUrlList]    Script Date: 03/12/2016 16:01:28 ******/
DROP TABLE [dbo].[ODIYearUrlList]
GO

/****** Object:  Table [dbo].[ODIYearUrlList]    Script Date: 03/12/2016 16:01:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[ODIYearUrlList](
	[Yr] [bigint] NOT NULL,
	[Url] [varchar](95) NULL,
	[Result] [varchar](7) NOT NULL,
	[YearCompleted] [varchar](1) NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


