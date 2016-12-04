USE [CricketOSA]
GO

/****** Object:  StoredProcedure [dbo].[LoadODIYearUrlList]    Script Date: 03/12/2016 15:24:13 ******/
DROP PROCEDURE [dbo].[LoadODIYearUrlList]
GO

/****** Object:  StoredProcedure [dbo].[LoadODIYearUrlList]    Script Date: 03/12/2016 15:24:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[LoadODIYearUrlList] as

insert into ODIYearUrlList
select
Yr = Num
, Url =
'http://www.espncricinfo.com'
+ '/ci/engine/records/team/match_results.html?class=2;id='
+ cast(num as varchar(4))
+ ';type=year'
, Result = 'Waiting'
, YearCompleted = case when Num = year(getdate()) then 'N' else 'Y' end
from nums
where num between 1971 and year(getdate())
and num not in (select Yr from ODIYearUrlList)

update ODIYearUrlList set YearCompleted = case when Yr >= year(getdate()) - 1 then 'N' else 'Y' end

GO


