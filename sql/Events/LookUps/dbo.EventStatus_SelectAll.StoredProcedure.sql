USE [Kommu]
GO
/****** Object:  StoredProcedure [dbo].[EventStatus_SelectAll]    Script Date: 7/18/2022 7:40:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE     PROC [dbo].[EventStatus_SelectAll]


AS
/* ------TEST CODE ------

	EXECUTE		[dbo].[EventStatus_SelectAll]

	SELECT * FROM [dbo].[EventStatus]

*/
BEGIN


		SELECT    [Id]
				  , [Name]

		FROM     [dbo].[EventStatus]



END




GO
