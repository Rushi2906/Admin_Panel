USE [21010101121]
GO
/****** Object:  StoredProcedure [dbo].[PR_City_SelectByCityName]    Script Date: 28-08-2023 22:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PR_City_SelectByCityName]
	@CName varchar(100) = null
AS
	SELECT  [dbo].[LOC_City].[CityID],
			[dbo].[LOC_City].[CityName],
			[dbo].[LOC_City].[Citycode],
			[dbo].[LOC_State].[StateName],
			[dbo].[LOC_Country].[CountryName],
			[dbo].[LOC_City].[CreationDate],
		    [dbo].[LOC_City].[Modified]

	FROM [dbo].[LOC_City]

	INNER JOIN [dbo].[LOC_State]
	ON [dbo].[LOC_State].[StateID] = [dbo].[LOC_City].[StateID]

	INNER JOIN [dbo].[LOC_Country]
	ON [dbo].[LOC_Country].[CountryID] = [dbo].[LOC_State].[CountryID]
	Where (@CName IS NULL OR CityName LIKE CONCAT('%',@CName,'%'))
GO
