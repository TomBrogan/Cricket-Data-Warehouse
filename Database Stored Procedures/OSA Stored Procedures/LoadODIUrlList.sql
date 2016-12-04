USE [CricketOSA]
GO

/****** Object:  StoredProcedure [dbo].[LoadODIUrlList]    Script Date: 03/12/2016 15:23:34 ******/
DROP PROCEDURE [dbo].[LoadODIUrlList]
GO

/****** Object:  StoredProcedure [dbo].[LoadODIUrlList]    Script Date: 03/12/2016 15:23:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create proc [dbo].[LoadODIUrlList]

@Url varchar(800)

as

declare @ODIYear int
select @ODIYear = Yr from ODIYearUrlList where Url = @Url;

with ElementClean as (
select
rownum,
element
from SingleElement
where element <> '>'
)

, List as (
select
rownum
, element
, lag(element,1) over(order by rownum) as lag1
from ElementClean
)

insert into ODIUrlList
select
ODIYearUrl = @Url
, ODIYear = @ODIYear
, ODIName = replace(element,'</a>','')
, Url =
	'http://www.espncricinfo.com'
	+ replace(replace(lag1,'<a href="',''),'" class="data-link">','')
, Result = 'Waiting'
from List
where element like '%ODI #%'
and lag1 like '%class="data-link">%'
and replace(element,'</a>','') not in (select ODIName from ODIUrlList)

GO


