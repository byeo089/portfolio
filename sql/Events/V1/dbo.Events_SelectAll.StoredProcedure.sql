USE [Kommu]
GO
/****** Object:  StoredProcedure [dbo].[Events_SelectAll]    Script Date: 7/18/2022 7:40:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE     PROC [dbo].[Events_SelectAll]
				@PageIndex int
				, @PageSize int

AS
/* ------TEST CODE ------

	DECLARE		@PageIndex int = 0
				, @PageSize int = 5

	EXECUTE		[dbo].[Events_SelectAll]
				@PageIndex
				, @PageSize

	SELECT *
	FROM dbo.Events

*/
BEGIN
		DECLARE @offSet int = @PageIndex * @PageSize

		SELECT     [Id]
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
				   , TotalCount = Count(1) OVER()

		FROM     [dbo].[Events]

		ORDER BY [Id]

		OFFSET @offSet Rows
		FETCH NEXT @PageSize Rows ONLY




END
GO
