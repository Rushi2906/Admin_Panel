USE [21010101121]
GO
/****** Object:  StoredProcedure [dbo].[PR_State_filter]    Script Date: 28-08-2023 22:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_State_filter]
@CountryID		int = null ,
@StateName varchar(100) = null,
@StateCode varchar(100) = null

As
SELECT [dbo].[LOC_State].[StateID],
		   [dbo].[LOC_State].[StateName],
		   [dbo].[LOC_State].[StateCode],
		   [dbo].[LOC_State].[CountryID],
		   [dbo].[LOC_Country].[CountryName],
		   [dbo].[LOC_State].[Created],
		   [dbo].[LOC_State].[Modified]
	FROM [dbo].[LOC_State]
	
	INNER JOIN [dbo].[LOC_Country]
	ON [dbo].[LOC_Country].[CountryID] = [dbo].[LOC_State].[CountryID]
	Where (
		(@CountryID IS NULL OR [dbo].[LOC_State].[CountryID] = @CountryID) AND
		(@StateName IS NULL OR StateName LIKE CONCAT('%',@StateName,'%')) AND
		(@StateCode IS NULL OR StateCode LIKE CONCAT('%',@StateCode,'%')) 
	)

GO
