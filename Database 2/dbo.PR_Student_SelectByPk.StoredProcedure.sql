USE [21010101121]
GO
/****** Object:  StoredProcedure [dbo].[PR_Student_SelectByPk]    Script Date: 28-08-2023 22:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PR_Student_SelectByPk]
@StudentID INT
AS
BEGIN
	SELECT [dbo].[MST_Student].[BranchID],
		   [dbo].[MST_Student].[CityID],
		   [dbo].[MST_Student].[StudentName],
		   [dbo].[MST_Student].[MobileNoStudent],
		   [dbo].[MST_Student].[Email],
		   [dbo].[MST_Student].[MobileNoFather],
		   [dbo].[MST_Student].[Address],
		   [dbo].[MST_Student].[BirthDate],
		   [dbo].[MST_Student].[Age],
		   [dbo].[MST_Student].[IsActive],
		   [dbo].[MST_Student].[Gender],
		   [dbo].[MST_Student].[Password],
		   [dbo].[MST_Student].[Created],
		   [dbo].[MST_Student].[Modified]
	FROM [dbo].[MST_Student]

	INNER JOIN [dbo].[MST_Branch]
	ON [dbo].[MST_Student].[BranchID] = [dbo].[MST_Branch].[BranchID]

	INNER JOIN [dbo].[LOC_City]
	ON [dbo].[MST_Student].[CityID] = [dbo].[LOC_City].[CityID]

	WHERE [dbo].[MST_Student].[StudentID] = @StudentID

	ORDER BY [dbo].[MST_Student].[StudentName],
			 [dbo].[MST_Branch].[BranchName],
			 [dbo].[LOC_City].[CityName]
END
GO
