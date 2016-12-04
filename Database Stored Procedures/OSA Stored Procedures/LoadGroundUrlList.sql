USE [CricketOSA]
GO

/****** Object:  StoredProcedure [dbo].[LoadGroundUrlList]    Script Date: 03/12/2016 15:20:50 ******/
DROP PROCEDURE [dbo].[LoadGroundUrlList]
GO

/****** Object:  StoredProcedure [dbo].[LoadGroundUrlList]    Script Date: 03/12/2016 15:20:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE proc [dbo].[LoadGroundUrlList] as

insert into GroundUrlList (GroundUrl, GroundNum, Result)
select
distinct 
'http://' + GroundUrl
, substring(replace(GroundUrl,'.html',''),patindex('%ground/%',GroundUrl) + 7,999) as GroundNum
, 'Waiting' as Result
from Match
where 'http://' + GroundUrl not in (select GroundUrl from GroundUrlList)
union
select
distinct 
'http://' + GroundUrl
, substring(replace(GroundUrl,'.html',''),patindex('%ground/%',GroundUrl) + 7,999) as GroundNum
, 'Waiting' as Result
from ODIMatch
where 'http://' + GroundUrl not in (select GroundUrl from GroundUrlList)




GO


