USE [21010101121]
GO
/****** Object:  StoredProcedure [dbo].[PR_Branch_Filter]    Script Date: 17-09-2023 21:13:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[PR_Branch_Filter]
@BranchName varchar(100) = null,
@BranchCode varchar(100) = null
AS
	Select [dbo].[MST_Branch].[BranchID],
			[dbo].[MST_Branch].[BranchName],
		   [dbo].[MST_Branch].[BranchCode],
		   [dbo].[MST_Branch].[Created],
		   [dbo].[MST_Branch].[Modified]
	FROM [dbo].[MST_Branch]
	Where (
		(@BranchName IS NULL OR BranchName LIKE CONCAT('%',@BranchName,'%')) AND
		(@BranchCode IS NULL OR BranchCode LIKE CONCAT('%',@BranchCode,'%')) 
	)
