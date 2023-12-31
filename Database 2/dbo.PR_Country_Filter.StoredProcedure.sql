USE [21010101121]
GO
/****** Object:  StoredProcedure [dbo].[PR_Country_filter]    Script Date: 25-09-2023 13:08:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[PR_Country_filter]
@CountryName varchar(100) = null,
@CountryCode varchar(100) = null
AS
	Select [dbo].[LOC_Country].[CountryID],
			[dbo].[LOC_Country].[CountryName],
		   [dbo].[LOC_Country].[CountryCode],
		   [dbo].[LOC_Country].[Created],
		   [dbo].[LOC_Country].[Modified]
	FROM [dbo].[LOC_Country]
	Where (
		(@CountryName IS NULL OR CountryName LIKE CONCAT('%',@CountryName,'%')) AND
		(@CountryCode IS NULL OR CountryCode LIKE CONCAT('%',@CountryCode,'%')) 
	)