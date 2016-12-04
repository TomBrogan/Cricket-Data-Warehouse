USE [CricketOSA]
GO

/****** Object:  Table [dbo].[RawData]    Script Date: 03/12/2016 16:03:52 ******/
DROP TABLE [dbo].[RawData]
GO

/****** Object:  Table [dbo].[RawData]    Script Date: 03/12/2016 16:03:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[RawData](
	[Iteration] [int] NULL,
	[RowID] [int] NOT NULL,
	[Row] [varchar](8000) NULL,
	[PreviousIterationRowId] [int] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


