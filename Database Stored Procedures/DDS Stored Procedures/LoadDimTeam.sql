USE [CricketDDS]
GO

/****** Object:  StoredProcedure [dbo].[LoadDimTeam]    Script Date: 04/12/2016 00:13:08 ******/
DROP PROCEDURE [dbo].[LoadDimTeam]
GO

/****** Object:  StoredProcedure [dbo].[LoadDimTeam]    Script Date: 04/12/2016 00:13:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE proc [dbo].[LoadDimTeam] as

Truncate table DimTeam;

insert into DimTeam(Team)
select
replace(replace(InningsName,' 1st innings',''),' 2nd innings','') as Team
from CricketRec.dbo.ScorecardBattingRow

union

select
replace(InningsName,' innings','') as Team
from CricketRec.dbo.ODIScorecardBattingRow;

SET IDENTITY_INSERT dbo.DimTeam ON;

insert into DimTeam(DimTeamID,Team)
select -1, 'Unknown';

SET IDENTITY_INSERT dbo.DimTeam OFF;



GO


