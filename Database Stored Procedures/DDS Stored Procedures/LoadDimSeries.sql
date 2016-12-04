USE [CricketDDS]
GO

/****** Object:  StoredProcedure [dbo].[LoadDimSeries]    Script Date: 04/12/2016 00:13:05 ******/
DROP PROCEDURE [dbo].[LoadDimSeries]
GO

/****** Object:  StoredProcedure [dbo].[LoadDimSeries]    Script Date: 04/12/2016 00:13:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[LoadDimSeries] as

truncate table DimSeries;

insert into DimSeries (SeriesName)
select distinct 
SeriesName =
	case
	when patindex('% - %', SeriesText) = 0 then SeriesText
	else Left(SeriesText,patindex('% - %', SeriesText) - 1)
	end
from CricketOSA.dbo.Match

union

select distinct 
SeriesName =
	case
	when patindex('% - %', SeriesText) = 0 then SeriesText
	else Left(SeriesText,patindex('% - %', SeriesText) - 1)
	end
from CricketRec.dbo.ODIMatch

SET IDENTITY_INSERT dbo.DimSeries ON;

insert into DimSeries (DimSeriesID, SeriesName)
select -1, 'Unknown';

SET IDENTITY_INSERT dbo.DimSeries OFF;


GO


