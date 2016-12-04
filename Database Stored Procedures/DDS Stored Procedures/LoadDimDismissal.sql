USE [CricketDDS]
GO

/****** Object:  StoredProcedure [dbo].[LoadDimDismissal]    Script Date: 04/12/2016 00:12:43 ******/
DROP PROCEDURE [dbo].[LoadDimDismissal]
GO

/****** Object:  StoredProcedure [dbo].[LoadDimDismissal]    Script Date: 04/12/2016 00:12:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create proc [dbo].[LoadDimDismissal] as

truncate table DimDismissal

insert into DimDismissal (DismissalName)
select distinct 
case
when Dismissal like 'b %' then 'Bowled'
when Dismissal like ' b %' then 'Bowled'
when Dismissal like 'c %' then 'Caught'
when Dismissal like 'lbw %' then 'LBW'
when Dismissal like 'st %' then 'Stumped'
when Dismissal like 'run out%' then 'Run Out'
when Dismissal like 'hit wicket%' then 'Hit Wicket'
when Dismissal like 'handled the ball%' then 'Handled the Ball'
when Dismissal like 'obstructing the field%' then 'Obstructing the Field'
when Dismissal like 'not out%' then 'Not Out'
when Dismissal in ('retired hurt','retired not out','retired ill') then 'Retired (Not Out)'
when Dismissal = 'retired out' then 'Retired (Out)'
when Dismissal in ('absent ill','absent hurt') then 'Absent'
else Dismissal
end as Dismissal
from CricketOSA.dbo.Scorecard
where Dismissal not like '(%'
and Dismissal <> ''
order by Dismissal

SET IDENTITY_INSERT dbo.DimDismissal ON;

insert into DimDismissal (DimDismissalID, DismissalName)
select -1, 'Unknown';

SET IDENTITY_INSERT dbo.DimDismissal OFF;


GO


