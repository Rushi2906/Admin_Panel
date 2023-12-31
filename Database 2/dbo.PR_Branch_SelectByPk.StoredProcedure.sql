USE [21010101121]
GO
/****** Object:  StoredProcedure [dbo].[PR_Branch_SelectByPk]    Script Date: 28-08-2023 22:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Branch_SelectByPk]
@BranchID INT
AS
BEGIN
	SELECT  [dbo].[MST_Branch].[BranchName],
			[dbo].[MST_Branch].[BranchCode],
			[dbo].[MST_Branch].[Created],
			[dbo].[MST_Branch].[Modified]
	FROM [dbo].[MST_Branch]

	WHERE [dbo].[MST_Branch].[BranchID] = @BranchID

	ORDER BY [dbo].[MST_Branch].[BranchName]
END
GO
