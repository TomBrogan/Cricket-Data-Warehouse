USE [CricketDDS]
GO

/****** Object:  Table [dbo].[DimDate]    Script Date: 04/12/2016 00:19:59 ******/
DROP TABLE [dbo].[DimDate]
GO

/****** Object:  Table [dbo].[DimDate]    Script Date: 04/12/2016 00:19:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[DimDate](
	[DateKey] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Day] [char](10) NULL,
	[DayOfWeek] [smallint] NULL,
	[DayOfMonth] [smallint] NULL,
	[DayOfYear] [smallint] NULL,
	[PreviousDay] [datetime] NULL,
	[NextDay] [datetime] NULL,
	[WeekOfYear] [smallint] NULL,
	[Month] [char](10) NULL,
	[MonthOfYear] [smallint] NULL,
	[QuarterOfYear] [smallint] NULL,
	[Year] [int] NULL,
	[Decade] [varchar](50) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


