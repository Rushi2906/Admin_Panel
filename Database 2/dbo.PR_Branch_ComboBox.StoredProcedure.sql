USE [21010101121]
GO
/****** Object:  StoredProcedure [dbo].[PR_Branch_ComboBox]    Script Date: 28-08-2023 22:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PR_Branch_ComboBox]
As
 Select BranchID,BranchName from MST_Branch
GO
