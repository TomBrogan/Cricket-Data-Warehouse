USE [CricketDDS]
GO

/****** Object:  Table [dbo].[DimResult]    Script Date: 04/12/2016 00:20:22 ******/
DROP TABLE [dbo].[DimResult]
GO

/****** Object:  Table [dbo].[DimResult]    Script Date: 04/12/2016 00:20:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimResult](
	[DimResultID] [int] IDENTITY(1,1) NOT NULL,
	[Result] [nvarchar](200) NULL,
	[Margin] [nvarchar](200) NULL,
	[MarginType] [nvarchar](200) NULL,
	[WinningTeam] [nvarchar](200) NULL,
	[HomeAwayResult] [nvarchar](200) NULL,
 CONSTRAINT [PK_DimResult] PRIMARY KEY CLUSTERED 
(
	[DimResultID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


