Create PROC PR_City_filter
@CountryID int,
@StateID int = null,
@CityName varchar(100) = null,
@CityCode varchar(100) = null
AS
	Select [dbo].[LOC_City].[CityID],
		[dbo].[LOC_City].[CityName],
		[dbo].[LOC_City].[CityCode],
		[dbo].[LOC_City].[CountryID],
		[dbo].[LOC_Country].[CountryName],
		[dbo].[LOC_City].[StateID],
		[dbo].[LOC_State].[StateName]
	FROM [dbo].[LOC_City]
	INNER JOIN [dbo].[LOC_State]
	ON [dbo].[LOC_State].[StateID] = [dbo].[LOC_City].[StateID]

	INNER JOIN [dbo].[LOC_Country]
	ON [dbo].[LOC_Country].[CountryID] = [dbo].[LOC_State].[CountryID] 

	WHERE (
		(@CountryID IS NULL OR [dbo].[LOC_City].[CountryID] = @CountryID) AND
		(@StateID IS NULL OR [dbo].[LOC_City].[StateID] = @StateID) AND
		(@CityName IS NULL OR StateName LIKE CONCAT('%',@CityName,'%')) AND
		(@CityCode IS NULL OR StateCode LIKE CONCAT('%',@CityCode,'%')) 
	)

EXEC PR_City_filter 