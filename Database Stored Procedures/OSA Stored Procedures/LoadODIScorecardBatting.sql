USE [CricketOSA]
GO

/****** Object:  StoredProcedure [dbo].[LoadODIScorecardBatting]    Script Date: 03/12/2016 15:22:30 ******/
DROP PROCEDURE [dbo].[LoadODIScorecardBatting]
GO

/****** Object:  StoredProcedure [dbo].[LoadODIScorecardBatting]    Script Date: 03/12/2016 15:22:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



--exec [LoadScorecardBatting] 'Test'

CREATE proc [dbo].[LoadODIScorecardBatting]

@Url varchar(800)

as

begin try drop table #Scorecard end try begin catch end catch
begin try drop table #Dismissals end try begin catch end catch
begin try drop table #Total end try begin catch end catch
begin try drop table #Extras end try begin catch end catch
begin try drop table #InningsTitle end try begin catch end catch
begin try drop table #Rows end try begin catch end catch;

declare @ScorecardEnd int;


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

select @ScorecardEnd = max(rownum) from #Scorecard;

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


with dismissals as (
select
rownum,
element,
lead(element,1) over(order by rownum) as PlayerUrl,
lead(element,2) over(order by rownum) as BatsmanName,
lead(element,5) over(order by rownum) as Dismissal,
lead(element,7) over(order by rownum) as Col1,
lead(element,9) over(order by rownum) as Col2,
lead(element,11) over(order by rownum) as Col3,
lead(element,13) over(order by rownum) as Col4,
lead(element,15) over(order by rownum) as Col5
from #scorecard
)

select
rownum,
isnull(lead(rownum,1) over(order by rownum), @ScorecardEnd) as nextrownum,
PlayerUrl = 'www.espncricinfo.com' + replace(left(PlayerUrl,charindex('.',PlayerUrl)),'<a href="','') + 'html',
BatsmanName = rtrim(replace(BatsmanName,'</a>','')) ,
Dismissal = rtrim(replace(Dismissal,'</td>','')),
Col1 = replace(Col1,'</td>',''),
Col2 = replace(Col2,'</td>',''),
Col3 = replace(Col3,'</td>',''),
Col4 = replace(Col4,'</td>',''),
Col5 = replace(Col5,'</td>','')
into #dismissals
from dismissals
where element like '%<td class="batsman-name">%';


With Extras as (
select
rownum,
element,
lead(element,2) over(order by rownum) as name1,
lead(element,4) over(order by rownum) as name2
from #scorecard
)

select
rownum,
isnull(lead(rownum,1) over(order by rownum), @ScorecardEnd) as nextrownum,
PlayerUrl = cast(NULL as varchar(800)),
BatsmanName = 'Extras',
Dismissal = replace(name1,'</td>',''),
Col1 = replace(name2,'</td>',''),
Col2 = '',
Col3 = '',
Col4 = '',
Col5 = ''
into #Extras
from Extras
where element like '%extras</td>%';


With Total as (
select
rownum,
element,
lead(element,3) over(order by rownum) as name1,
lead(element,6) over(order by rownum) as name2,
lead(element,9) over(order by rownum) as name3
from #scorecard
)

select
rownum,
isnull(lead(rownum,1) over(order by rownum), @ScorecardEnd) as nextrownum,
PlayerUrl = cast(NULL as varchar(800)),
BatsmanName = 'Total',
Dismissal = replace(name1,'</td>',''),
Col1 = replace(name2,'</b>',''),
Col2 = '',
Col3 = '',
Col4 = '',
Col5 = ''
into #Total
from Total
where element like '%total</b>%'


select * into #Rows from #dismissals union all
select * from #Extras union all
select * from #Total


delete from ODIScorecardBatting where Url = @Url

insert into ODIScorecardBatting
select
@Url as Url
,it.InningsNumber
,it.InningsName
,it.col2
,it.col3
,it.col4
,it.col5
,rank() over(partition by it.rownum order by r.rownum) as Battingorder
,r.BatsmanName
,r.PlayerUrl
,r.dismissal
,r.Col1 as RunsScored
,r.Col2 as Details1
,r.Col3 as Details2
,r.Col4 as Details3
,r.Col5 as Details4
from #InningsTitle it
join #Rows r on r.rownum > it.rownum and r.rownum < it.nextrownum


GO


