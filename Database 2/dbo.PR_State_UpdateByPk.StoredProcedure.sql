USE [21010101121]
GO
/****** Object:  StoredProcedure [dbo].[PR_State_UpdateByPk]    Script Date: 28-08-2023 22:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_State_UpdateByPk]
	@StateId		int,
	@StateName		varchar(100),
	@CountryId		int,
	@StateCode		varchar(5)

AS
BEGIN

	UPDATE [dbo].[LOC_State]

	SET [StateName] = @StateName,
		[CountryID] = @CountryId,
		[StateCode] = @StateCode

	WHERE [dbo].[LOC_State].[StateID] = @StateId
	
END
GO
