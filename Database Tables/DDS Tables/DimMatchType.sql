USE [CricketDDS]
GO

/****** Object:  Table [dbo].[DimMatchType]    Script Date: 04/12/2016 00:20:14 ******/
DROP TABLE [dbo].[DimMatchType]
GO

/****** Object:  Table [dbo].[DimMatchType]    Script Date: 04/12/2016 00:20:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimMatchType](
	[DimMatchTypeID] [int] IDENTITY(1,1) NOT NULL,
	[MatchType] [nvarchar](50) NULL,
	[MatchTypeName] [nvarchar](100) NULL,
 CONSTRAINT [PK_DimMatchType] PRIMARY KEY CLUSTERED 
(
	[DimMatchTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


