USE [CricketOSA]
GO

/****** Object:  StoredProcedure [dbo].[LoadFallOfWicket]    Script Date: 03/12/2016 15:20:43 ******/
DROP PROCEDURE [dbo].[LoadFallOfWicket]
GO

/****** Object:  StoredProcedure [dbo].[LoadFallOfWicket]    Script Date: 03/12/2016 15:20:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE proc [dbo].[LoadFallOfWicket]

@Url varchar(800)

as


declare @ScorecardEnd int

begin try drop table #scorecard end try begin catch end catch;
begin try drop table #fow end try begin catch end catch;
begin try drop table #inningstitle end try begin catch end catch;

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


select
rownum,
FallOfWicket = replace(element,'</span>','')
into #fow
from #scorecard
where element like '%-% (%,%ov)</span>%';


with InningsHead as (
select 
rownum,
element, 
lead(element,1) over(order by rownum) as e1
from #scorecard
)

select
rownum,
isnull(lead(rownum,1) over(order by rownum),@ScorecardEnd) as nextrownum,
InningsName = rtrim(replace(e1,'<span class="normal">','')) + ' Batting'
into #InningsTitle
from InningsHead
where element like '%<th colspan="2" scope="col" class="th-innings-heading">%';


delete from FallOfWicket where Url = @Url

insert into FallOfWicket
select
@Url as Url
, Title = InningsName
, FallOfWicket
from #fow f
join #InningsTitle i
	on f.rownum between i.rownum and i.nextrownum




GO


