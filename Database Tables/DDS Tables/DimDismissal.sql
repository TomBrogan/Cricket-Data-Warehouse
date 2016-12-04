USE [CricketDDS]
GO

/****** Object:  Table [dbo].[DimDismissal]    Script Date: 04/12/2016 00:20:02 ******/
DROP TABLE [dbo].[DimDismissal]
GO

/****** Object:  Table [dbo].[DimDismissal]    Script Date: 04/12/2016 00:20:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimDismissal](
	[DimDismissalID] [int] IDENTITY(1,1) NOT NULL,
	[DismissalName] [nvarchar](200) NULL,
 CONSTRAINT [PK_DimDismissal] PRIMARY KEY CLUSTERED 
(
	[DimDismissalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


