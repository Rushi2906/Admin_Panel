USE [21010101121]
GO
/****** Object:  StoredProcedure [dbo].[PR_Branch_Insert]    Script Date: 28-08-2023 22:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PR_Branch_Insert]
	@BranchName Varchar(100),
	@BranchCode Varchar(100)
AS
BEGIN
	INSERT INTO [dbo].[MST_Branch]
	(
		BranchName,
		BranchCode
	)
	VALUES
	(
		@BranchName,
		@BranchCode
	)
END
GO
