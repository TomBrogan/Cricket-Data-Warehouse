USE [CricketDDS]
GO

/****** Object:  StoredProcedure [dbo].[LoadDimBattingPosition]    Script Date: 04/12/2016 00:12:36 ******/
DROP PROCEDURE [dbo].[LoadDimBattingPosition]
GO

/****** Object:  StoredProcedure [dbo].[LoadDimBattingPosition]    Script Date: 04/12/2016 00:12:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create proc [dbo].[LoadDimBattingPosition] as

truncate table DimBattingPosition;

insert into DimBattingPosition (BattingPosition)
select distinct BattingOrder 
from CricketRec.dbo.ScorecardBattingRow
order by BattingOrder;


SET IDENTITY_INSERT dbo.DimBattingPosition ON;

insert into DimBattingPosition (DimBattingPositionID, BattingPosition)
select -1, -1;

SET IDENTITY_INSERT dbo.DimBattingPosition OFF;


GO


