USE [CricketOSA]
GO

/****** Object:  Table [dbo].[Nums]    Script Date: 03/12/2016 16:00:26 ******/
DROP TABLE [dbo].[Nums]
GO

/****** Object:  Table [dbo].[Nums]    Script Date: 03/12/2016 16:00:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Nums](
	[Num] [bigint] NOT NULL,
 CONSTRAINT [PK_Nums] PRIMARY KEY CLUSTERED 
(
	[Num] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


