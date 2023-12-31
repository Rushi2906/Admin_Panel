USE [21010101121]
GO
/****** Object:  StoredProcedure [dbo].[PR_Student_UpdateByPK]    Script Date: 28-08-2023 22:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PR_Student_UpdateByPK]
	@StudentID INT,
	@BranchID INT,
	@CityID INT,
	@StudentName VARCHAR(100),
	@MobileNoStudent VARCHAR(100),
	@Email VARCHAR(100),
	@MobileNoFather VARCHAR(100),
	@Address VARCHAR(500),
	@BirthDate DATETIME,
	@Age INT,
	@IsActive BIT,
	@Gender VARCHAR(50),
	@Password VARCHAR(100)
AS
Begin
	UPDATE [dbo].[MST_Student]
	SET [BranchID]=@BranchID,
		[CityID]=@CityID,
		[StudentName]=@StudentName,
		[MobileNoStudent]=@MobileNoStudent,
		[Email]=@Email,
		[MobileNoFather]=@MobileNoFather,
		[Address]=@Address,
		[BirthDate]=@BirthDate,
		[Age]=@Age,
		[IsActive]=@IsActive,
		[Gender]=@Gender,
		[Password]=@Password

	WHERE [dbo].[MST_Student].[StudentID] = @StudentID
End
GO
