USE [21010101121]
GO
/****** Object:  Table [dbo].[LOC_City]    Script Date: 28-08-2023 22:03:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOC_City](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [varchar](100) NOT NULL,
	[StateID] [int] NOT NULL,
	[CountryID] [int] NOT NULL,
	[Citycode] [varchar](50) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
 CONSTRAINT [PK_LOC_City] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOC_Country]    Script Date: 28-08-2023 22:03:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOC_Country](
	[CountryID] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [varchar](100) NOT NULL,
	[CountryCode] [varchar](50) NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
 CONSTRAINT [PK_LOC_Country] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOC_State]    Script Date: 28-08-2023 22:03:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOC_State](
	[StateID] [int] IDENTITY(1,1) NOT NULL,
	[StateName] [varchar](100) NOT NULL,
	[CountryID] [int] NOT NULL,
	[StateCode] [varchar](50) NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
 CONSTRAINT [PK_LOC_State] PRIMARY KEY CLUSTERED 
(
	[StateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MST_Branch]    Script Date: 28-08-2023 22:03:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MST_Branch](
	[BranchID] [int] IDENTITY(1,1) NOT NULL,
	[BranchName] [varchar](100) NOT NULL,
	[BranchCode] [varchar](100) NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
 CONSTRAINT [PK_MST_Branch] PRIMARY KEY CLUSTERED 
(
	[BranchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MST_Student]    Script Date: 28-08-2023 22:03:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MST_Student](
	[StudentID] [int] IDENTITY(1,1) NOT NULL,
	[BranchID] [int] NOT NULL,
	[CityID] [int] NOT NULL,
	[StudentName] [varchar](100) NOT NULL,
	[MobileNoStudent] [varchar](100) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[MobileNoFather] [varchar](100) NULL,
	[Address] [varchar](500) NULL,
	[BirthDate] [datetime] NULL,
	[Age] [int] NULL,
	[IsActive] [bit] NULL,
	[Gender] [varchar](50) NULL,
	[Password] [varchar](100) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
 CONSTRAINT [PK_MST_Student] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LOC_City] ADD  CONSTRAINT [DF_LOC_City_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[LOC_City] ADD  CONSTRAINT [DF_LOC_City_Modified]  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[LOC_Country] ADD  CONSTRAINT [DF_LOC_Country_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[LOC_Country] ADD  CONSTRAINT [DF_LOC_Country_Modified]  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[LOC_State] ADD  CONSTRAINT [DF_LOC_State_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[LOC_State] ADD  CONSTRAINT [DF_LOC_State_Modified]  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[MST_Branch] ADD  CONSTRAINT [DF_MST_Branch_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[MST_Branch] ADD  CONSTRAINT [DF_MST_Branch_Modified]  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[MST_Student] ADD  CONSTRAINT [DF_MST_Student_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[MST_Student] ADD  CONSTRAINT [DF_MST_Student_Modified]  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[LOC_City]  WITH CHECK ADD  CONSTRAINT [FK_LOC_City_LOC_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[LOC_Country] ([CountryID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LOC_City] CHECK CONSTRAINT [FK_LOC_City_LOC_Country]
GO
ALTER TABLE [dbo].[LOC_State]  WITH CHECK ADD  CONSTRAINT [FK_LOC_State_LOC_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[LOC_Country] ([CountryID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LOC_State] CHECK CONSTRAINT [FK_LOC_State_LOC_Country]
GO
ALTER TABLE [dbo].[MST_Student]  WITH CHECK ADD  CONSTRAINT [FK_MST_Student_LOC_City] FOREIGN KEY([CityID])
REFERENCES [dbo].[LOC_City] ([CityID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MST_Student] CHECK CONSTRAINT [FK_MST_Student_LOC_City]
GO
ALTER TABLE [dbo].[MST_Student]  WITH CHECK ADD  CONSTRAINT [FK_MST_Student_MST_Branch] FOREIGN KEY([BranchID])
REFERENCES [dbo].[MST_Branch] ([BranchID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MST_Student] CHECK CONSTRAINT [FK_MST_Student_MST_Branch]
GO
/****** Object:  StoredProcedure [dbo].[PR_Branch_ComboBox]    Script Date: 28-08-2023 22:03:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PR_Branch_ComboBox]
As
 Select BranchID,BranchName from MST_Branch
GO
/****** Object:  StoredProcedure [dbo].[PR_Branch_DeleteByPK]    Script Date: 28-08-2023 22:03:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Branch_DeleteByPK]
	@BranchID int
AS
BEGIN
	DELETE
	FROM [dbo].[MST_Branch]
	WHERE [dbo].[MST_Branch].[BranchID] = @BranchID
END
GO
/****** Object:  StoredProcedure [dbo].[PR_Branch_Insert]    Script Date: 28-08-2023 22:03:40 ******/
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
/****** Object:  StoredProcedure [dbo].[PR_Branch_SelectAll]    Script Date: 28-08-2023 22:03:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Branch_SelectAll]
AS
BEGIN
	SELECT  [dbo].[MST_Branch].[BranchID],
			[dbo].[MST_Branch].[BranchName],
			[dbo].[MST_Branch].[BranchCode],
			[dbo].[MST_Branch].[Created],
			[dbo].[MST_Branch].[Modified]
	FROM [dbo].[MST_Branch]

	ORDER BY [dbo].[MST_Branch].[BranchName]
END
GO
/****** Object:  StoredProcedure [dbo].[PR_Branch_SelectByPk]    Script Date: 28-08-2023 22:03:40 ******/
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
/****** Object:  StoredProcedure [dbo].[PR_Branch_UpdateByPK]    Script Date: 28-08-2023 22:03:40 ******/
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
/****** Object:  StoredProcedure [dbo].[PR_City_ComboBox]    Script Date: 28-08-2023 22:03:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PR_City_ComboBox]
As
 Select CityID,CityName from LOC_City
GO
/****** Object:  StoredProcedure [dbo].[PR_City_DeleteByPK]    Script Date: 28-08-2023 22:03:40 ******/
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
/****** Object:  StoredProcedure [dbo].[PR_City_Insert]    Script Date: 28-08-2023 22:03:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_City_Insert]
	@CityName		varchar(100),
	@StateId		int,
	@CountryId		int,
	@CityCode		varchar(5)

AS
BEGIN
	INSERT INTO [dbo].[LOC_City]
	(
		CityName,	
		StateId,
		CountryID,	
		CityCode
	)
	VALUES
	(
		@CityName,	
		@StateId,
		@CountryId,	
		@CityCode
	)
END
GO
/****** Object:  StoredProcedure [dbo].[PR_City_SelectAll]    Script Date: 28-08-2023 22:03:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_City_SelectAll]
AS
BEGIN
	SELECT  [dbo].[LOC_City].[CityID],
			[dbo].[LOC_City].[CityName],
			[dbo].[LOC_City].[Citycode],
			[dbo].[LOC_State].[StateName],
			[dbo].[LOC_Country].[CountryName],
			[dbo].[LOC_City].[CreationDate],
		    [dbo].[LOC_City].[Modified]

	FROM [dbo].[LOC_City]

	INNER JOIN [dbo].[LOC_State]
	ON [dbo].[LOC_State].[StateID] = [dbo].[LOC_City].[StateID]

	INNER JOIN [dbo].[LOC_Country]
	ON [dbo].[LOC_Country].[CountryID] = [dbo].[LOC_State].[CountryID]

	ORDER BY [dbo].[LOC_Country].[CountryName],
			 [dbo].[LOC_State].[StateName],
			 [dbo].[LOC_City].[CityName]
END
GO
/****** Object:  StoredProcedure [dbo].[PR_City_SelectByCityName]    Script Date: 28-08-2023 22:03:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PR_City_SelectByCityName]
	@CName varchar(100) = null
AS
	SELECT  [dbo].[LOC_City].[CityID],
			[dbo].[LOC_City].[CityName],
			[dbo].[LOC_City].[Citycode],
			[dbo].[LOC_State].[StateName],
			[dbo].[LOC_Country].[CountryName],
			[dbo].[LOC_City].[CreationDate],
		    [dbo].[LOC_City].[Modified]

	FROM [dbo].[LOC_City]

	INNER JOIN [dbo].[LOC_State]
	ON [dbo].[LOC_State].[StateID] = [dbo].[LOC_City].[StateID]

	INNER JOIN [dbo].[LOC_Country]
	ON [dbo].[LOC_Country].[CountryID] = [dbo].[LOC_State].[CountryID]
	Where (@CName IS NULL OR CityName LIKE CONCAT('%',@CName,'%'))
GO
/****** Object:  StoredProcedure [dbo].[PR_City_SelectByPk]    Script Date: 28-08-2023 22:03:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_City_SelectByPk]
@CityId int
AS
BEGIN
	SELECT  [dbo].[LOC_City].[CityID],
			[dbo].[LOC_City].[CityName],
			[dbo].[LOC_City].[Citycode],
			[dbo].[LOC_City].[CountryID],
			[dbo].[LOC_State].[StateName],
			[dbo].[LOC_City].[StateID],
			[dbo].[LOC_Country].[CountryName],
			[dbo].[LOC_City].[CreationDate],
		    [dbo].[LOC_City].[Modified]

	FROM [dbo].[LOC_City]

	INNER JOIN [dbo].[LOC_State]
	ON [dbo].[LOC_State].[StateID] = [dbo].[LOC_City].[StateID]

	INNER JOIN [dbo].[LOC_Country]
	ON [dbo].[LOC_Country].[CountryID] = [dbo].[LOC_State].[CountryID]

	WHERE [dbo].[LOC_City].[CityID] = @CityId

	ORDER BY [dbo].[LOC_Country].[CountryName],
			 [dbo].[LOC_State].[StateName],
			 [dbo].[LOC_City].[CityName]
END
GO
/****** Object:  StoredProcedure [dbo].[PR_City_UpdateByPK]    Script Date: 28-08-2023 22:03:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_City_UpdateByPK]
	@CityID			int,
	@CityName		varchar(100),
	@StateID		int,
	@CountryID		int,
	@CityCode		varchar(5)
AS
BEGIN
	UPDATE [dbo].[LOC_City]
	SET [CityName] = @CityName,
		[StateID] = @StateID,
		[CountryID] = @CountryID,
		[Citycode] = @CityCode

	WHERE [dbo].[LOC_City].[CityID] = @CityID
END
GO
/****** Object:  StoredProcedure [dbo].[PR_Country_ComboBox]    Script Date: 28-08-2023 22:03:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PR_Country_ComboBox]
AS
SELECT [dbo].[LOC_Country].[CountryID],
		[dbo].[LOC_Country].[CountryName]
From LOC_Country
GO
/****** Object:  StoredProcedure [dbo].[PR_Country_DeleteByPK]    Script Date: 28-08-2023 22:03:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Country_DeleteByPK]
	@CountryID int
AS
BEGIN
	DELETE
	FROM [dbo].[LOC_Country]
	WHERE [dbo].[LOC_Country].[CountryID] = @CountryID
END
GO
/****** Object:  StoredProcedure [dbo].[PR_Country_Insert]    Script Date: 28-08-2023 22:03:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Country_Insert]
	@CountryName	varchar(100),
	@CountryCode	varchar(5)
AS
BEGIN

	INSERT INTO [dbo].[LOC_Country]
	(
		CountryName,
		CountryCode
	)
	VALUES
	(
		@CountryName,
		@CountryCode
	)
END
GO
/****** Object:  StoredProcedure [dbo].[PR_Country_SelectAll]    Script Date: 28-08-2023 22:03:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Country_SelectAll]
AS
BEGIN
	SELECT [dbo].[LOC_Country].[CountryID],
		   [dbo].[LOC_Country].[CountryName],
		   [dbo].[LOC_Country].[CountryCode],
		   [dbo].[LOC_Country].[Created],
		   [dbo].[LOC_Country].[Modified]

	FROM [dbo].[LOC_Country]

	ORDER BY [dbo].[LOC_Country].[CountryName]
END
GO
/****** Object:  StoredProcedure [dbo].[PR_Country_SelectByCountryName]    Script Date: 28-08-2023 22:03:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PR_Country_SelectByCountryName]
	@CountryName varchar(100) = null
AS
	Select [dbo].[LOC_Country].[CountryID],
			[dbo].[LOC_Country].[CountryName],
			[dbo].[LOC_Country].[CountryCode],
			[dbo].[LOC_Country].[Created],
			[dbo].[LOC_Country].[Modified]
	From LOC_Country
	Where (@CountryName IS NULL OR CountryName LIKE CONCAT('%',@CountryName,'%'))
GO
/****** Object:  StoredProcedure [dbo].[PR_Country_SelectByPk]    Script Date: 28-08-2023 22:03:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Country_SelectByPk]
@CountryID int
AS
BEGIN
	SELECT [dbo].[LOC_Country].[CountryID],
		   [dbo].[LOC_Country].[CountryName],
		   [dbo].[LOC_Country].[CountryCode],
		   [dbo].[LOC_Country].[Created],
		   [dbo].[LOC_Country].[Modified]

	FROM [dbo].[LOC_Country]

	WHERE [dbo].[LOC_Country].[CountryID] = @CountryID

	ORDER BY [dbo].[LOC_Country].[CountryName]

END
GO
/****** Object:  StoredProcedure [dbo].[PR_Country_UpdateByPk]    Script Date: 28-08-2023 22:03:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Country_UpdateByPk]
	@CountryId		int,
	@CountryName	varchar(100),
	@CountryCode	varchar(5)
AS
BEGIN

	UPDATE [dbo].[LOC_Country]

	SET [CountryName] = @CountryName,
		[CountryCode] = @CountryCode

	WHERE [dbo].[LOC_Country].[CountryID] = @CountryId
END
GO
/****** Object:  StoredProcedure [dbo].[PR_State_ComboBox]    Script Date: 28-08-2023 22:03:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PR_State_ComboBox]
@CountryID int
AS
SELECT [dbo].[LOC_State].[StateID],
		[dbo].[LOC_State].[StateName]
From LOC_State
Where [dbo].[LOC_State].[CountryID] = @CountryID
GO
/****** Object:  StoredProcedure [dbo].[PR_State_DeleteByPK]    Script Date: 28-08-2023 22:03:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_State_DeleteByPK]
	@StateID int
AS
BEGIN
	DELETE
	FROM [dbo].[LOC_State]
	WHERE [dbo].[LOC_State].[StateID] = @StateID
END
GO
/****** Object:  StoredProcedure [dbo].[PR_State_filter]    Script Date: 28-08-2023 22:03:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_State_filter]
@CountryID		int = null ,
@StateName varchar(100) = null,
@StateCode varchar(100) = null

As
SELECT [dbo].[LOC_State].[StateID],
		   [dbo].[LOC_State].[StateName],
		   [dbo].[LOC_State].[StateCode],
		   [dbo].[LOC_State].[CountryID],
		   [dbo].[LOC_Country].[CountryName],
		   [dbo].[LOC_State].[Created],
		   [dbo].[LOC_State].[Modified]
	FROM [dbo].[LOC_State]
	
	INNER JOIN [dbo].[LOC_Country]
	ON [dbo].[LOC_Country].[CountryID] = [dbo].[LOC_State].[CountryID]
	Where (
		(@CountryID IS NULL OR [dbo].[LOC_State].[CountryID] = @CountryID) AND
		(@StateName IS NULL OR StateName LIKE CONCAT('%',@StateName,'%')) AND
		(@StateCode IS NULL OR StateCode LIKE CONCAT('%',@StateCode,'%')) 
	)

GO
/****** Object:  StoredProcedure [dbo].[PR_State_Insert]    Script Date: 28-08-2023 22:03:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_State_Insert]
	@StateName		varchar(100),
	@CountryId		int,
	@StateCode		varchar(5)

AS
BEGIN
	
	INSERT INTO [dbo].[LOC_State]
	(
		StateName,
		CountryId,
		StateCode
	)
	VALUES
	(
		@StateName,
		@CountryId,
		@StateCode
	)
END
GO
/****** Object:  StoredProcedure [dbo].[PR_State_SelectAll]    Script Date: 28-08-2023 22:03:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_State_SelectAll]
As
Begin
	SELECT [dbo].[LOC_State].[StateID],
		   [dbo].[LOC_State].[StateName],
		   [dbo].[LOC_State].[StateCode],
		   [dbo].[LOC_State].[CountryID],
		   [dbo].[LOC_Country].[CountryName],
		   [dbo].[LOC_State].[Created],
		   [dbo].[LOC_State].[Modified]
	FROM [dbo].[LOC_State]
	
	INNER JOIN [dbo].[LOC_Country]
	ON [dbo].[LOC_Country].[CountryID] = [dbo].[LOC_State].[CountryID]

	ORDER BY [dbo].[LOC_Country].[CountryName],
			 [dbo].[LOC_State].[StateName]
END
GO
/****** Object:  StoredProcedure [dbo].[PR_State_SelectByPk]    Script Date: 28-08-2023 22:03:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_State_SelectByPk]
@StateId int
As
Begin
	SELECT [dbo].[LOC_State].[StateID],
		   [dbo].[LOC_State].[StateName],
		   [dbo].[LOC_State].[StateCode],
		   [dbo].[LOC_State].[CountryID],
		   [dbo].[LOC_Country].[CountryName],
		   [dbo].[LOC_State].[Created],
		   [dbo].[LOC_State].[Modified]
	FROM [dbo].[LOC_State]

	INNER JOIN [dbo].[LOC_Country]
	ON [dbo].[LOC_Country].[CountryID] = [dbo].[LOC_State].[CountryID]

	WHERE [dbo].[LOC_State].[StateID] = @StateId

	ORDER BY [dbo].[LOC_Country].[CountryName],
			 [dbo].[LOC_State].[StateName]
END
GO
/****** Object:  StoredProcedure [dbo].[PR_State_SelectByStateName]    Script Date: 28-08-2023 22:03:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PR_State_SelectByStateName]
	@SName varchar(100) = null
AS
	SELECT [dbo].[LOC_State].[StateID],
		   [dbo].[LOC_State].[StateName],
		   [dbo].[LOC_State].[StateCode],
		   [dbo].[LOC_State].[CountryID],
		   [dbo].[LOC_Country].[CountryName],
		   [dbo].[LOC_State].[Created],
		   [dbo].[LOC_State].[Modified]
	FROM [dbo].[LOC_State]
	
	INNER JOIN [dbo].[LOC_Country]
	ON [dbo].[LOC_Country].[CountryID] = [dbo].[LOC_State].[CountryID]
	Where (@SName IS NULL OR StateName LIKE CONCAT('%',@SName,'%'))
GO
/****** Object:  StoredProcedure [dbo].[PR_State_UpdateByPk]    Script Date: 28-08-2023 22:03:40 ******/
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
/****** Object:  StoredProcedure [dbo].[PR_Student_DeleteByPK]    Script Date: 28-08-2023 22:03:40 ******/
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
/****** Object:  StoredProcedure [dbo].[PR_Student_Insert]    Script Date: 28-08-2023 22:03:40 ******/
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
/****** Object:  StoredProcedure [dbo].[PR_Student_SelectAll]    Script Date: 28-08-2023 22:03:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Student_SelectAll]
AS
BEGIN
	SELECT [dbo].[MST_Student].[StudentID],
		   [dbo].[MST_Student].[BranchID],
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

	ORDER BY [dbo].[MST_Student].[StudentName],
			 [dbo].[MST_Branch].[BranchName],
			 [dbo].[LOC_City].[CityName]
END
GO
/****** Object:  StoredProcedure [dbo].[PR_Student_SelectByPk]    Script Date: 28-08-2023 22:03:40 ******/
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
/****** Object:  StoredProcedure [dbo].[PR_Student_UpdateByPK]    Script Date: 28-08-2023 22:03:40 ******/
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
