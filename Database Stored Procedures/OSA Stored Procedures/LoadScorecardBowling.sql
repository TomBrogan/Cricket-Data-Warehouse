USE [CricketOSA]
GO

/****** Object:  StoredProcedure [dbo].[LoadScorecardBowling]    Script Date: 03/12/2016 15:30:52 ******/
DROP PROCEDURE [dbo].[LoadScorecardBowling]
GO

/****** Object:  StoredProcedure [dbo].[LoadScorecardBowling]    Script Date: 03/12/2016 15:30:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

--USE [CricketOSA]
--GO

--/****** Object:  StoredProcedure [dbo].[LoadScorecardBowling]    Script Date: 17/01/2015 19:15:12 ******/
--SET ANSI_NULLS ON
--GO

--SET QUOTED_IDENTIFIER ON
--GO



CREATE proc [dbo].[LoadScorecardBowling] 

@Url varchar(800)

as

declare @ScorecardEnd int;

begin try drop table #Scorecard end try begin catch end catch;
begin try drop table #InningsTitle end try begin catch end catch;
begin try drop table #Bowling end try begin catch end catch;

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

select @ScorecardEnd = max(rownum) from #scorecard;

with InningsHead as (
select 
rownum,
element, 
lead(element,1) over(order by rownum) as e1,
lead(element,5) over(order by rownum) as col1,
lead(element,7) over(order by rownum) as col2,
lead(element,9) over(order by rownum) as col3,
lead(element,11) over(order by rownum) as col4,
lead(element,13) over(order by rownum) as col5
from #scorecard
)

select
rownum,
isnull(lead(rownum,1) over(order by rownum),@ScorecardEnd) as nextrownum,
element,
InningsNumber = row_number() over(order by rownum),
InningsName = rtrim(replace(e1,'<span class="normal">','')),
col1 = replace(col1,'</th>',''), 
col2 = replace(col2,'</th>',''),
col3 = replace(col3,'</th>',''),
col4 = replace(col4,'</th>',''),
col5 = replace(col5,'</th>','')
into #InningsTitle
from InningsHead
where element like '%<th colspan="2" scope="col" class="th-innings-heading">%';


with l as (
select
rownum
, element
, lead(element,1) over(order by rownum) l1
, lead(element,2) over(order by rownum) l2
, lead(element,5) over(order by rownum) l5
, lead(element,7) over(order by rownum) l7
, lead(element,9) over(order by rownum) l9
, lead(element,11) over(order by rownum) l11
from #scorecard
)

select
rownum,
'www.espncricinfo.com' + 
replace(
left(l1, patindex('% target%', l1) -2)
,'<a href="','') as PlayerUrl,
replace(l2,'</a>','') as Bowler,
replace(l5,'</td>','')  as Overs,
replace(l7,'</td>','')  as Maidens,
replace(l9,'</td>','')  as Runs,
replace(l11,'</td>','')  as Wickets
into #bowling
from l
where element like '%<td class="bowler-Name">'


delete from ScorecardBowling where Url = @Url

insert into ScorecardBowling
select
@Url as Url,
i.InningsNumber,
i.InningsName + ' Bowling',
b.rownum,
b.PlayerUrl,
b.Bowler,
b.Overs,
b.Maidens,
b.Runs,
b.Wickets
from #InningsTitle i
join #bowling b
	on b.rownum > i.rownum
	and b.rownum < i.nextrownum




GO


