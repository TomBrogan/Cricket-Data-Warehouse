USE [CricketDDS]
GO

/****** Object:  StoredProcedure [dbo].[LoadDimMatchType]    Script Date: 04/12/2016 00:12:56 ******/
DROP PROCEDURE [dbo].[LoadDimMatchType]
GO

/****** Object:  StoredProcedure [dbo].[LoadDimMatchType]    Script Date: 04/12/2016 00:12:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create proc [dbo].[LoadDimMatchType] as 

Truncate Table DimMatchType

insert into DimMatchType (MatchType, MatchTypeName)
select 'Test', 'Test'
union all
select 'ODI', 'One Day International'
union all
select 'T20', 'Twenty20'

SET IDENTITY_INSERT dbo.DimMatchType ON;

insert into DimMatchType (DimMatchTypeID, MatchType, MatchTypeName)
select -1, 'Unknown', 'Unknown';

SET IDENTITY_INSERT dbo.DimMatchType OFF;


GO


