USE [21010101121]
GO
/****** Object:  StoredProcedure [dbo].[PR_Student_DeleteByPK]    Script Date: 28-08-2023 22:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Student_DeleteByPK]
	@StudentID int
AS
BEGIN
	DELETE
	FROM [dbo].[MST_Student]
	WHERE [dbo].[MST_Student].[StudentID] = @StudentID
END
GO
