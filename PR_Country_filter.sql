Alter PROC PR_Country_filter
@CountryName varchar(100) = null,
@CountryCode varchar(100) = null
AS
	Select [dbo].[LOC_Country].[CountryID],
			[dbo].[LOC_Country].[CountryName],
		   [dbo].[LOC_Country].[CountryCode]
	FROM [dbo].[LOC_Country]
	Where (
		(@CountryName IS NULL OR CountryName LIKE CONCAT('%',@CountryName,'%')) AND
		(@CountryCode IS NULL OR CountryCode LIKE CONCAT('%',@CountryCode,'%')) 
	)

EXEC PR_Country_filter 'Pakistan','P'