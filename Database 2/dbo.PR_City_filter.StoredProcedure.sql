USE [21010101121]
GO
/****** Object:  StoredProcedure [dbo].[PR_City_filter]    Script Date: 04-09-2023 11:18:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Alter PROCEDURE [dbo].[PR_City_filter]
@CountryID		int = null ,
@StateID		int = null ,
@CityName varchar(100) = null,
@CityCode varchar(100) = null

As
SELECT  [dbo].[LOC_City].[CityID],
			[dbo].[LOC_City].[CityName],
			[dbo].[LOC_City].[CityCode],
			[dbo].[LOC_City].[StateID],
			[dbo].[LOC_State].[StateName],
			[dbo].[LOC_City].[CountryID],
			[dbo].[LOC_Country].[CountryName],
			[dbo].[LOC_City].[CreationDate],
		    [dbo].[LOC_City].[Modified]

	FROM [dbo].[LOC_City]

	INNER JOIN [dbo].[LOC_State]
	ON [dbo].[LOC_State].[StateID] = [dbo].[LOC_City].[StateID]

	INNER JOIN [dbo].[LOC_Country]
	ON [dbo].[LOC_Country].[CountryID] = [dbo].[LOC_State].[CountryID]

	Where (
		(@CountryID IS NULL OR [dbo].[LOC_City].[CountryID] = @CountryID) AND
		(@StateID IS NULL OR [dbo].[LOC_City].[StateID] = @StateID) AND
		(@CityName IS NULL OR CityName LIKE CONCAT('%',@CityName,'%')) AND
		(@CityCode IS NULL OR CityCode LIKE CONCAT('%',@CityCode,'%')) 
	)

	ORDER BY [dbo].[LOC_City].[CityName],
			 [dbo].[LOC_State].[StateName],
			 [dbo].[LOC_Country].[CountryName]

EXEC PR_City_filter 1,null,null,'R'