USE [CricketOSA]
GO

/****** Object:  StoredProcedure [dbo].[LoadScorecardUrlListByYear]    Script Date: 03/12/2016 15:32:07 ******/
DROP PROCEDURE [dbo].[LoadScorecardUrlListByYear]
GO

/****** Object:  StoredProcedure [dbo].[LoadScorecardUrlListByYear]    Script Date: 03/12/2016 15:32:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






CREATE proc [dbo].[LoadScorecardUrlListByYear] as 

with ElementClean as (
select
rownum,
element
from SingleElement
where element <> '>'
)

, lags as (
select 
rownum, 
element, 
lag(rownum,1) over(order by rownum) as previousrownum, 
lag(element,1) over(order by rownum) as previouselement
from ElementClean
)

, CTE_PreStringRemoved as (
select 
substring(previouselement,charindex('<a href="/ci/engine/match/',previouselement) + 26,1000) as PreStringRemoved,
* 
from lags
where element like '%test #%'
)

select distinct
left(element, charindex('<',element) - 1) as TestName,
cast(left(PreStringRemoved,charindex('.',PreStringRemoved) - 1) as int) as MatchNum,
'http://stats.espncricinfo.com/ci/engine/match/'
+ left(PreStringRemoved,charindex('.',PreStringRemoved) - 1)
+ '.html' as Url
into #Urls
from CTE_PreStringRemoved

delete from ScorecardUrlList
where Url in (select Url from #Urls)

insert into ScorecardUrlList (rownum, TestName, MatchNum, Url, Result)
select
row_number() over(order by MatchNum) as rownum,
TestName,
MatchNum,
Url,
'Waiting' as Result
from #Urls





GO


