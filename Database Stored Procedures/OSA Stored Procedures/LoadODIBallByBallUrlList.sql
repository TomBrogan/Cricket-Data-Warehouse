USE [CricketOSA]
GO

/****** Object:  StoredProcedure [dbo].[LoadODIBallByBallUrlList]    Script Date: 03/12/2016 15:21:02 ******/
DROP PROCEDURE [dbo].[LoadODIBallByBallUrlList]
GO

/****** Object:  StoredProcedure [dbo].[LoadODIBallByBallUrlList]    Script Date: 03/12/2016 15:21:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create proc [dbo].[LoadODIBallByBallUrlList] as

declare @maxrownum int
select @maxrownum = max(rownum) from ODIBallByBallUrlList

insert into ODIBallByBallUrlList
select 
rownum = @maxrownum + row_number() over(order by Url, innings.num)
, [Root] = Url
, ODIName
, Innings = innings.num
, Url =
	url
	+ '?innings=' 
	+ cast(innings.num as varchar(1))
	+ ';view=commentary'
, Result = 'Waiting'
from ODIUrlList
join nums as innings on innings.num <= 2
where Url not in (select [Root] from ODIBallByBallUrlList)



GO


