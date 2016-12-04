USE [CricketOSA]
GO

/****** Object:  StoredProcedure [dbo].[LoadTestYearUrlList]    Script Date: 03/12/2016 15:34:19 ******/
DROP PROCEDURE [dbo].[LoadTestYearUrlList]
GO

/****** Object:  StoredProcedure [dbo].[LoadTestYearUrlList]    Script Date: 03/12/2016 15:34:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE proc [dbo].[LoadTestYearUrlList] as 

--truncate table TestYearUrlList

declare @UrlFormat varchar(200)
set @UrlFormat = 'http://stats.espncricinfo.com/ci/engine/records/team/match_results.html?class=1;id=YYYY;type=year'

declare @MaxRowNum int
select @MaxRowNum = max(RowNum) from TestYearUrlList

insert into TestYearUrlList (rownum, TestYear, Url, Result, YearCompleted)
select
@MaxRowNum + row_number() over(order by Num) as rownum,  
Num as TestYear,
replace(@UrlFormat, 'id=YYYY', 'id=' + cast(Num as varchar(4))) as Url,
'Waiting' as Result,
YearCompleted = 'Y'
from Nums
where num <= year(getdate())
and num > 1876
and num not in (
1878,
1891,
1900,
1915,
1916,
1917,
1918,
1919,
1940,
1941,
1942,
1943,
1944,
1945)
and replace(@UrlFormat, 'id=YYYY', 'id=' + cast(Num as varchar(4))) not in
	(select Url from TestYearUrlList)

update TestYearUrlList set YearCompleted = case when TestYear >= year(getdate()) - 1 then 'N' else 'Y' end


GO


