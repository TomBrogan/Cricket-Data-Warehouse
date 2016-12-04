USE [CricketDDS]
GO

/****** Object:  StoredProcedure [dbo].[LoadDimInnings]    Script Date: 04/12/2016 00:12:49 ******/
DROP PROCEDURE [dbo].[LoadDimInnings]
GO

/****** Object:  StoredProcedure [dbo].[LoadDimInnings]    Script Date: 04/12/2016 00:12:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create proc [dbo].[LoadDimInnings] as

truncate table DimInnings;

insert into DimInnings(InningsNumber)
select distinct 
InningsNum 
from CricketOSA.dbo.Scorecard
order by InningsNum

SET IDENTITY_INSERT dbo.DimInnings ON;

insert into DimInnings (DimInningsID, InningsNumber)
select -1, -1;

SET IDENTITY_INSERT dbo.DimInnings OFF;
GO


