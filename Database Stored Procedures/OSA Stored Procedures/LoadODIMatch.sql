USE [CricketOSA]
GO

/****** Object:  StoredProcedure [dbo].[LoadODIMatch]    Script Date: 03/12/2016 15:21:18 ******/
DROP PROCEDURE [dbo].[LoadODIMatch]
GO

/****** Object:  StoredProcedure [dbo].[LoadODIMatch]    Script Date: 03/12/2016 15:21:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






CREATE proc [dbo].[LoadODIMatch]

@Url varchar(800)

as


begin try
drop table #Scorecard
end try
begin catch
end catch;

declare @SeriesText varchar(800)
declare @HomeTeam varchar(800)
declare @AwayTeam varchar(800)
declare @Result varchar(800)
declare @Ground varchar(800)
declare @GroundUrl varchar(800)
declare @Date varchar(800)
declare @TossResult varchar(800)
declare @MoM varchar(800);



with ElementClean as (
select
rownum,
element
from SingleElement
where element <> '>'
)

select
rownum,
element
into #scorecard
from ElementClean;


with SeriesLeads as (
select
element,
SeriesText =
lead(element,1) over(order by rownum) +
lead(element,2) over(order by rownum)
from #scorecard
)

select
@SeriesText = replace(replace(SeriesText,'</a>',''),'</div>','')
from SeriesLeads
where element like '%<a href="/ci/engine/series%'
and element not like '%index.html?%';


with TeamLeads as (
select
element,
lead(element,1) over(order by rownum) as s1
from #scorecard
)

select
@HomeTeam = replace(s1,'</a>','')
from TeamLeads
where Element like '%view the team home page for%'
and Element not like '%v <a href=%';


with TeamLeads as (
select
element,
lead(element,1) over(order by rownum) as s1
from #scorecard
)

select
@AwayTeam = replace(s1,'</a>','')
from TeamLeads
where Element like '%view the team home page for%'
and Element like '%v <a href=%';


with TeamLeads as (
select
element,
lead(element,1) over(order by rownum) as s1
from #scorecard
)

select
@Result = replace(s1,'</div>','')
from TeamLeads
where Element like '%<div class="innings-requirement">%';


With PlayedAt as (
select
element,
lead(element,1) over(order by rownum) as Ground,
lead(element,4) over(order by rownum) as Dates
from #scorecard
)

select
@Ground = replace(Ground,'</a>',''),
@Date = rtrim(left(Dates,charindex('<',Dates)-1)),
@GroundUrl = 'www.espncricinfo.com'
+	ltrim(
		replace(
			replace(replace(
				left(element, patindex('%l" target%'
					,replace(replace(element,'class=','target='),'title=','target=')
				))
			,char(13),''),char(10),'')
		,'Played at <a href="','')
	)
from PlayedAt
where replace(replace(element,char(10),''),char(13),'') like '%Played at <a href%';


With Toss as (
select
element,
lead(element,1) over(order by rownum) as TossResult
from #scorecard
)
select
@TossResult = 
replace(TossResult,'</span>','')
from Toss
where element like '%Toss %- <span class=%';


With MoM as (
select
element,
lead(element,1) over(order by rownum) as MoM
from #scorecard
)
select
@Mom = 
rtrim(left(Mom, charindex('<',Mom)-1))
from MoM
where element like '%Player of the match %- <span class=%';



delete from ODIMatch where Url = @Url

insert into ODIMatch
select
@Url as Url,
@SeriesText as SeriesText,
@HomeTeam as HomeTeam,
@AwayTeam as AwayTeam,
@Result as Result,
@Ground as Ground,
@GroundUrl as GroundUrl,
@Date as MatchDate,
@TossResult as TossResult,
@MoM as PlayerOfTheMatch;





GO


