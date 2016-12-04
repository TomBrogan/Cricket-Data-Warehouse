USE [CricketOSA]
GO

/****** Object:  StoredProcedure [dbo].[LoadPlayerUrlList]    Script Date: 03/12/2016 15:27:35 ******/
DROP PROCEDURE [dbo].[LoadPlayerUrlList]
GO

/****** Object:  StoredProcedure [dbo].[LoadPlayerUrlList]    Script Date: 03/12/2016 15:27:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE proc [dbo].[LoadPlayerUrlList] 

@Url varchar(200)

as 

declare @Format varchar(200)
declare @Team varchar(200)

select
@Format = MatchFormat
, @Team = TeamName
from PlayerTeamUrlList
where TeamUrl = @Url;

with ElementClean as (
select
rownum,
element
from SingleElement
where element <> '>'
)

, leads as (
select
rownum,
element, 
lead(element,1) over(order by rownum) as l1,
lead(element,3) over(order by rownum) as l3,
lead(element,4) over(order by rownum) as l4
from ElementClean
)

,FullList as (
select
@Format as [Format],
@Team as Team,
Rownum = row_number() over(order by rownum),
cast(replace(l1,'</li>','') as int) as CapNumber,
'http://' + replace(replace(l3,'<a href="','www.espncricinfo.com'),'" class="ColumnistSmry" style="valign:middle;">','') as PlayerUrl,
replace(l4,'</a>','') as PlayerName,
'Waiting' as Result
from leads 
where element like '%<li class="ciPlayerserialno">%'
)

insert into PlayerUrlList
select
Format,
Team,
Rownum,
CapNumber,
PlayerUrl,
PlayerName,
Result
from FullList f
where not exists
	(select 1
	from PlayerUrlList p
	where f.[Format] = p.[Format]
	and f.Team = p.Team
	and f.CapNumber = p.CapNumber)



GO


