USE [CricketOSA]
GO

/****** Object:  Table [dbo].[PlayerUrlList]    Script Date: 03/12/2016 16:01:47 ******/
DROP TABLE [dbo].[PlayerUrlList]
GO

/****** Object:  Table [dbo].[PlayerUrlList]    Script Date: 03/12/2016 16:01:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[PlayerUrlList](
	[PlayerUrlListID] [int] IDENTITY(1,1) NOT NULL,
	[Format] [varchar](200) NULL,
	[Team] [varchar](200) NULL,
	[Rownum] [bigint] NULL,
	[CapNumber] [int] NULL,
	[PlayerUrl] [varchar](8000) NULL,
	[PlayerName] [varchar](8000) NULL,
	[Result] [varchar](200) NULL,
 CONSTRAINT [PK_PlayerUrlList] PRIMARY KEY CLUSTERED 
(
	[PlayerUrlListID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


