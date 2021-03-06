USE [Kommu]
GO
/****** Object:  StoredProcedure [dbo].[Events_Select_ById]    Script Date: 7/18/2022 7:40:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE     PROC [dbo].[Events_Select_ById]
				@Id int

AS
/*------TEST CODE ------

	DECLARE		@Id int = 1
	EXECUTE		[dbo].[Events_Select_ById] @Id

	SELECT * FROM dbo.Events

*/
BEGIN


		SELECT [Id]
				   , [EventTypeId]
				   , [Name]
				   , [Summary]
				   , [ShortDescription]
				   , [VenueId]
				   , [EventStatusId]
				   , [ImageUrl]
				   , [ExternalSiteUrl]
				   , [IsFree]
				   , [DateCreated]
				   , [DateModified]
				   , [DateStart]
				   , [DateEnd]

		FROM     [dbo].[Events]

		WHERE [Id] = @Id





END




GO
