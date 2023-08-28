USE [21010101121]
GO
/****** Object:  StoredProcedure [dbo].[PR_City_DeleteByPK]    Script Date: 28-08-2023 22:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_City_DeleteByPK]
	@CityID int
AS
BEGIN
	DELETE
	FROM [dbo].[LOC_City]
	WHERE [dbo].[LOC_City].[CityID] = @CityID
END
GO
