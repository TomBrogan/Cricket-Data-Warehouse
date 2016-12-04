USE [CricketOSA]
GO

/****** Object:  StoredProcedure [dbo].[LoadGround]    Script Date: 03/12/2016 15:20:47 ******/
DROP PROCEDURE [dbo].[LoadGround]
GO

/****** Object:  StoredProcedure [dbo].[LoadGround]    Script Date: 03/12/2016 15:20:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[LoadGround]

@Url varchar(8000)

as 

delete from Ground where Url = @Url;

with ElementClean as (
select
rownum,
element
from SingleElement
where element <> '>'
)

, CountryHead as (
select 
element, lead(element,1) over(order by rownum) as l1
from ElementClean
)
, Country as (
select
Country = replace(l1,'</span>','')
from CountryHead
where element like '%<span class="SubnavSubsection">%'
)

, GroundNameHead as (
select 
element, lead(element,2) over(order by rownum) as l2
from ElementClean
)
, GroundName as (
select
GroundName = rtrim(ltrim(replace(replace(replace(left(l2, patindex('%<a href%',l2)),char(10),''),char(13),''),'<','')))
from GroundNameHead
where element like '%<div id="head">%'
)

, LocationHead as (
select 
element
, lead(element,1) over(order by rownum) as l1
, lead(element,2) over(order by rownum) as l2
, lead(element,3) over(order by rownum) as l3
from ElementClean
)
, Location as (
select
Location = 
case
when l1 like '%</p>%'
then ltrim(rtrim(replace(replace(replace(l1,'</p>',''),char(10),''),char(13),'')))
when l2 like '%</p>%'
then ltrim(rtrim(replace(replace(replace(l1,'<br/>',''),char(10),''),char(13),'')))
+ ' ' + ltrim(rtrim(replace(replace(replace(l2,'</p>',''),char(10),''),char(13),'')))
when l3 like '%</p>%'
then ltrim(rtrim(replace(replace(replace(l1,'<br/>',''),char(10),''),char(13),'')))
+ ' ' + ltrim(rtrim(replace(replace(replace(l2,'<br/>',''),char(10),''),char(13),'')))
+ ' ' + ltrim(rtrim(replace(replace(replace(l3,'</p>',''),char(10),''),char(13),'')))
end
from LocationHead
where element like '%<p class="loc">%'
)

, LabelsHead as (
select
rownum
, element
, lead(element,1) over(order by rownum) as l1
, lead(element,2) over(order by rownum) as l2
from ElementClean
)
,Labels as (
select
OtherNames = max(case when l1 like '%Also or formerly known as </label>%' then replace(l2,'<br/>','') end)
, Established = max(case when l1 like '%Established </label>%' then replace(l2,'<br/>','') end)
, Capacity = max(case when l1 like '%Capacity </label>%' then replace(l2,'<br/>','') end)
, Floodlights = max(case when l1 like '%Floodlights </label>%' then replace(l2,'<br/>','') end)
, EndNames = max(case when l1 like '%End Names </label>%' then replace(l2,'<br/>','') end)
, PlayingArea = max(case when l1 like '%Playing Area </label>%' then replace(l2,'<br/>','') end)
, NamedAfter = max(case when l1 like '%Named after </label>%' then replace(l2,'<br/>','') end)
, OtherSports = max(case when l1 like '%Other sports </label>%' then replace(l2,'<br/>','') end)
, Curator = max(case when l1 like '%Curator </label>%' then replace(l2,'<br/>','') end)
, HomeTeams = max(case when l1 like '%Home teams </label>%' then replace(l2,'<br/>','') end)
from LabelsHead
where element like '%<label>%'
and rownum < (select rownum from SingleElement where element like '%Records and Statistics%')
)

insert into Ground
select
Url = @Url
, GroundName
, Country
, Location
, OtherNames
, Established
, Capacity
, Floodlights
, EndNames
, PlayingArea
, NamedAfter
, OtherSports
, Curator
, HomeTeams
from Labels
cross join Location
cross join GroundName
cross join Country



GO


