USE [CricketDDS]
GO

/****** Object:  Table [dbo].[DimInnings]    Script Date: 04/12/2016 00:20:08 ******/
DROP TABLE [dbo].[DimInnings]
GO

/****** Object:  Table [dbo].[DimInnings]    Script Date: 04/12/2016 00:20:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimInnings](
	[DimInningsID] [int] IDENTITY(1,1) NOT NULL,
	[InningsNumber] [int] NULL,
 CONSTRAINT [PK_DimInnings] PRIMARY KEY CLUSTERED 
(
	[DimInningsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


