USE [21010101121]
GO
/****** Object:  StoredProcedure [dbo].[PR_Student_Insert]    Script Date: 28-08-2023 22:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PR_Student_Insert]
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
BEGIN
	INSERT INTO [dbo].[MST_Student]
	(
		BranchID,
		CityID,
		StudentName,
		MobileNoStudent,
		Email,
		MobileNoFather,
		Address,
		BirthDate,
		Age,
		IsActive,
		Gender,
		Password
	)
	VALUES
	(
		@BranchID,
		@CityID,
		@StudentName,
		@MobileNoStudent,
		@Email,
		@MobileNoFather,
		@Address,
		@BirthDate,
		@Age,
		@IsActive,
		@Gender,
		@Password
	)
END
GO
