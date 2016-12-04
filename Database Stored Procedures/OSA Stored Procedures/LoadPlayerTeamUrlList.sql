USE [CricketOSA]
GO

/****** Object:  StoredProcedure [dbo].[LoadPlayerTeamUrlList]    Script Date: 03/12/2016 15:27:00 ******/
DROP PROCEDURE [dbo].[LoadPlayerTeamUrlList]
GO

/****** Object:  StoredProcedure [dbo].[LoadPlayerTeamUrlList]    Script Date: 03/12/2016 15:27:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create proc [dbo].[LoadPlayerTeamUrlList] as

truncate table PlayerTeamUrlList

insert into PlayerTeamUrlList
select 
row_number() over(order by n1.Num, n2.Num)
, TeamNumber = n1.Num
, TeamName =
	case n1.Num
	when 1 then 'England'
	when 2 then 'Australia'
	when 3 then 'South Africa'
	when 4 then 'West Indies'
	when 5 then 'New Zealand'
	when 6 then 'India'
	when 7 then 'Pakistan'
	when 8 then 'Sri Lanka'
	when 9 then 'Zimbabwe'
	when 25 then 'Bangladesh'
	when 11 then 'USA'
	when 12 then 'Bermuda'
	when 14 then 'East Africa'
	when 15 then 'Netherlands'
	when 17 then 'Canada'
	when 19 then 'Hong Kong'
	when 20 then 'Papua New Guinea'
	when 26 then 'Kenya'
	when 27 then 'UAE'
	when 28 then 'Namibia'
	when 29 then 'Ireland'
	when 30 then 'Scotland'
	when 40 then 'Afghanistan'
	end
, MatchFormat =
	case n2.Num
	when 1 then 'Test'
	when 2 then 'ODI'
	when 3 then 'T20'
	end
, TeamUrl =
	'http://www.espncricinfo.com/ci/content/player/caps.html?country='
	+ cast(n1.num as varchar(3))
	+ ';class='
	+ cast(n2.num as varchar(1))
, Result = 'Waiting'
from nums n1
cross join nums n2
where (n1.num between 1 and 9 or n1.num in (11,12,14,15,17,19,20,25,26,27,28,29,30,40))
and n2.num <= 3

GO


