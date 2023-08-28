USE [21010101121]
GO
/****** Object:  StoredProcedure [dbo].[PR_State_ComboBox]    Script Date: 28-08-2023 22:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PR_State_ComboBox]
@CountryID int
AS
SELECT [dbo].[LOC_State].[StateID],
		[dbo].[LOC_State].[StateName]
From LOC_State
Where [dbo].[LOC_State].[CountryID] = @CountryID
GO
