USE [CricketOSA]
GO

/****** Object:  Table [dbo].[ODIUrlList]    Script Date: 03/12/2016 16:01:25 ******/
DROP TABLE [dbo].[ODIUrlList]
GO

/****** Object:  Table [dbo].[ODIUrlList]    Script Date: 03/12/2016 16:01:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[ODIUrlList](
	[ODIYearUrl] [varchar](800) NULL,
	[ODIYear] [int] NULL,
	[ODIName] [varchar](8000) NULL,
	[Url] [varchar](8000) NULL,
	[Result] [varchar](7) NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


