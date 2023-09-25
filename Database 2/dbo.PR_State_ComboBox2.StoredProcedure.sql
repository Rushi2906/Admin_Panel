CREATE PROC [dbo].[PR_State_ComboBox2]
AS
SELECT [dbo].[LOC_State].[StateID],
		[dbo].[LOC_State].[StateName]
From LOC_State