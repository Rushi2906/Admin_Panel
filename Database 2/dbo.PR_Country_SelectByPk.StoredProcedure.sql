USE [21010101121]
GO
/****** Object:  StoredProcedure [dbo].[PR_Country_SelectByPk]    Script Date: 28-08-2023 22:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Country_SelectByPk]
@CountryID int
AS
BEGIN
	SELECT [dbo].[LOC_Country].[CountryID],
		   [dbo].[LOC_Country].[CountryName],
		   [dbo].[LOC_Country].[CountryCode],
		   [dbo].[LOC_Country].[Created],
		   [dbo].[LOC_Country].[Modified]

	FROM [dbo].[LOC_Country]

	WHERE [dbo].[LOC_Country].[CountryID] = @CountryID

	ORDER BY [dbo].[LOC_Country].[CountryName]

END
GO
