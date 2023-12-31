USE [21010101121]
GO
/****** Object:  StoredProcedure [dbo].[PR_Country_SelectByCountryName]    Script Date: 28-08-2023 22:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PR_Country_SelectByCountryName]
	@CountryName varchar(100) = null
AS
	Select [dbo].[LOC_Country].[CountryID],
			[dbo].[LOC_Country].[CountryName],
			[dbo].[LOC_Country].[CountryCode],
			[dbo].[LOC_Country].[Created],
			[dbo].[LOC_Country].[Modified]
	From LOC_Country
	Where (@CountryName IS NULL OR CountryName LIKE CONCAT('%',@CountryName,'%'))
GO
