USE [CricketOSA]
GO

/****** Object:  StoredProcedure [dbo].[OrganiseHTML]    Script Date: 03/12/2016 15:35:20 ******/
DROP PROCEDURE [dbo].[OrganiseHTML]
GO

/****** Object:  StoredProcedure [dbo].[OrganiseHTML]    Script Date: 03/12/2016 15:35:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE proc [dbo].[OrganiseHTML] as

begin try
truncate table RawData
truncate table AtLeastOneEndTag
truncate table Shifted
truncate table SingleElement
end try
begin catch
end catch

insert into RawData
select 0, RowId, RowHtml, null from htmlbyrow;

DECLARE @Continue INT
DECLARE @Iteration INT

SET @Iteration = 0
SELECT @Continue = SUM(CASE WHEN CHARINDEX('>',[Row]) = 0 THEN 1 ELSE 0 END) FROM RawData WHERE Iteration = @Iteration

WHILE @Continue > 0
BEGIN

INSERT INTO RawData
SELECT
--r1.string AS CurrentString,
--r2.string AS NextString,
--r3.string AS NextNextString,
r1.Iteration + 1 AS NewIteration,
ROW_NUMBER() OVER(ORDER BY r1.RowID) AS NewRowNum,
CASE 
       WHEN CHARINDEX('>',isnull(r2.[Row],'')) = 0 AND (CHARINDEX('>',isnull(r3.[Row],'')) > 0 OR r3.[Row] IS NULL)
       THEN ISNULL(r1.[Row],'') + ISNULL(r2.[Row],'') 
       ELSE r1.[Row] 
END AS NewString,
r1.RowID AS PreviousIterationRowID
FROM RawData r1
LEFT JOIN RawData r2 ON r1.RowID + 1 = r2.RowID AND r2.Iteration = @Iteration
LEFT JOIN RawData r3 ON r1.rowID + 2 = r3.RowID AND r3.Iteration = @Iteration
WHERE
r1.Iteration = @Iteration
AND CASE 
       WHEN CHARINDEX('>',isnull(r1.[Row],'')) = 0 AND (CHARINDEX('>',isnull(r2.[Row],'')) <> 0 OR r2.[Row] IS NULL)
       THEN 1 
       ELSE 0 
       END = 0
order by NewString

SET @Iteration = @Iteration + 1
SELECT @Continue = SUM(CASE WHEN CHARINDEX('>',[Row]) = 0 THEN 1 ELSE 0 END) FROM RawData WHERE Iteration = @Iteration

END



insert into AtLeastOneEndTag
select
row_number() over(order by RowID) as rownum,
[Row]
from RawData 
where Iteration = (select max(Iteration) from RawData);


--with fulltags as (
--select
--a1.RowNum,
--isnull(case when a1.rownum = 1 then a1.[Row] else right(a1.[Row], len(a1.[Row]) - charindex('>',a1.[Row])) end,'') +
--isnull(left(a2.[Row], charindex('>',a2.[Row])),'') as ft
--from AtLeastOneEndTag a1
--left join AtLeastOneEndTag a2 on a1.rownum + 1 = a2.rownum 
--)

--select sum(len(ft)) from fulltags
--select sum(len([Row])) from AtLeastOneEndTag
--select sum(len([Row])) from RawData where Iteration = 3

insert into Shifted
select 
r1.rownum
, string =	
	case 
	when r1.RowNum = 1 	then r1.[Row] 
	--else isnull(right(rtrim(r1.[Row]), len(rtrim(r1.[Row])) - charindex('>',rtrim(r1.[Row]))),'')
	else isnull(substring(r1.[Row], charindex('>',r1.[Row]) + 1, 1000),'')
	end
	+ isnull(left(r2.[Row], charindex('>',r2.[Row])),'')
from AtLeastOneEndTag r1
left join AtLeastOneEndTag r2 on r1.RowNum + 1 = r2.RowNum

insert into SingleElement
select
row_number() over(order by rownum, num) as rownum
, substring(string,num,charindex('>',string + '>', num) - num) + '>' as element
from Shifted
join Nums 
on Num <= len(string) + 1
and substring('>'+string,num,1) = '>'






GO


