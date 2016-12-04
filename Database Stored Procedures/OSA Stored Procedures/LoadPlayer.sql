USE [CricketOSA]
GO

/****** Object:  StoredProcedure [dbo].[LoadPlayer]    Script Date: 03/12/2016 15:25:25 ******/
DROP PROCEDURE [dbo].[LoadPlayer]
GO

/****** Object:  StoredProcedure [dbo].[LoadPlayer]    Script Date: 03/12/2016 15:25:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[LoadPlayer]

@PlayerUrl varchar(8000)

as

with ElementClean as (
select
rownum,
element
from SingleElement
where element <> '>'
)

, leads as (
select *, lead(element,2) over(order by rownum) as l2
from ElementClean)

, attributes as (
select top 1 'Name' as Attribute, 
Value =
case 
when l2 like '%<a href="%'
then left(l2,patindex('%<a href="%',l2)-1)
else l2
end
from Leads
where element like '%<div style="margin:0; float:left; padding-bottom:3px;">%'
union all
select top 1 'Country', replace(l2,'</b>','')
from Leads
where element like '%<h3 class="PlayersSearchLink">%'
union all
select top 1 'FullName', replace(l2,'</span>','')
from Leads
where element like '%Full name</b>%'
union all
select top 1 'Born', replace(l2,'</span>','')
from Leads
where element like '%Born</b>%'
union all
select top 1 'Nickname', replace(l2,'</span>','')
from Leads
where element like '%Nickname</b>%'
union all
select top 1 'PlayingRole', replace(l2,'</span>','')
from Leads
where element like '%Playing role</b>%'
union all
select top 1 'BattingStyle', replace(l2,'</span>','')
from Leads
where element like '%Batting style</b>%'
union all
select top 1 'BowlingStyle', replace(l2,'</span>','')
from Leads
where element like '%Bowling style</b>%'
union all
select top 1 'Height', replace(l2,'</span>','')
from Leads
where element like '%Height</b>%'
union all
select top 1 'Education', replace(l2,'</span>','')
from Leads
where element like '%Education</b>%'
union all
select top 1 'InANutshell', replace(l2,'</span>','')
from Leads
where element like '%In a nutshell</b>%'
)

insert into Player
select @PlayerUrl as PlayerUrl, Name, Country, FullName, Born, Nickname, PlayingRole, BattingStyle, BowlingStyle, Height, Education, InANutshell
from attributes
PIVOT
(
Max(Value)
FOR Attribute IN (Name, Country, FullName, Born, Nickname, PlayingRole, BattingStyle, BowlingStyle, Height, Education, InANutshell)
) AS PivotTable



GO


