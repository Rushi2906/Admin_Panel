USE [21010101121]
GO
/****** Object:  StoredProcedure [dbo].[PR_Branch_UpdateByPK]    Script Date: 28-08-2023 22:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PR_Branch_UpdateByPK]
	@BranchID int,
	@BranchName varchar(100),
	@BranchCode varchar(100)
AS
Begin
	UPDATE [dbo].[MST_Branch]
	SET [BranchName] = @BranchName,
		[BranchCode] = @BranchCode

	WHERE [dbo].[MST_Branch].[BranchID] = @BranchID
End
GO
