USE [CricketDDS]
GO

/****** Object:  Table [dbo].[DimSeries]    Script Date: 04/12/2016 00:20:30 ******/
DROP TABLE [dbo].[DimSeries]
GO

/****** Object:  Table [dbo].[DimSeries]    Script Date: 04/12/2016 00:20:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimSeries](
	[DimSeriesID] [int] IDENTITY(1,1) NOT NULL,
	[SeriesName] [nvarchar](250) NULL,
 CONSTRAINT [PK_DimSeries] PRIMARY KEY CLUSTERED 
(
	[DimSeriesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


