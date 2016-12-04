USE [CricketDDS]
GO

/****** Object:  StoredProcedure [dbo].[LoadDimResult]    Script Date: 04/12/2016 00:13:02 ******/
DROP PROCEDURE [dbo].[LoadDimResult]
GO

/****** Object:  StoredProcedure [dbo].[LoadDimResult]    Script Date: 04/12/2016 00:13:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[LoadDimResult] as 

truncate table DimResult;

insert into DimResult (Result, Margin, MarginType, WinningTeam, HomeAwayResult)
select distinct 
Result 
, Margin =
	case
	when result like '% won by %'
	then substring(Result, patindex('% won by %', Result) + 8,1000)
	else Result
	end
, MarginType =
	case
	when Result like '% innings %' then 'Innings'
	when Result like '% wickets' then 'Wickets'
	when Result like '% wicket' then 'Wickets'
	when Result like '% runs' then 'Runs'
	when Result like '% run' then 'Runs'
	when Result like 'Match drawn%' then 'Draw'
	when Result like 'Match tied' then 'Tie'
	else 'Default'
	end
, WinningTeam =
	case
	when result like '% won by %'
	then Left(Result, patindex('% won by %', Result) - 1)
	else Result
	end
, HomeAwayResult =
	case
	when result like '% won by %'
	then 
		case
		when Left(Result, patindex('% won by %', Result) - 1) = HomeTeam
		then 'Home win'
		when Left(Result, patindex('% won by %', Result) - 1) = AwayTeam
		then 'Away win'
		else 'Unknown'
		end
	else Result
	end
from [CricketOSA].[dbo].[Match]

union

select distinct 
Result 
, Margin =
	case
	when result like '% won by %'
	then substring(Result, patindex('% won by %', Result) + 8,1000)
	else Result
	end
, MarginType =
	case
	when Result like '% innings %' then 'Innings'
	when Result like '% wickets' then 'Wickets'
	when Result like '% wicket' then 'Wickets'
	when Result like '% runs' then 'Runs'
	when Result like '% run' then 'Runs'
	when Result like 'Match drawn%' then 'Draw'
	when Result like 'Match tied' then 'Tie'
	else 'Default'
	end
, WinningTeam =
	case
	when result like '% won by %'
	then Left(Result, patindex('% won by %', Result) - 1)
	else Result
	end
, HomeAwayResult =
	case
	when result like '% won by %'
	then 
		case
		when Left(Result, patindex('% won by %', Result) - 1) = HomeTeam
		then 'Home win'
		when Left(Result, patindex('% won by %', Result) - 1) = AwayTeam
		then 'Away win'
		else 'Unknown'
		end
	else Result
	end
from [CricketRec].[dbo].[ODIMatch]


SET IDENTITY_INSERT dbo.DimResult ON;

insert into DimResult (DimResultID, Result, Margin, MarginType, WinningTeam, HomeAwayResult)
select -1, 'Unknown', 'Unknown', 'Unknown', 'Unknown', 'Unknown';

SET IDENTITY_INSERT dbo.DimResult OFF;


GO


