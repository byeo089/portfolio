USE [Kommu]
GO
/****** Object:  StoredProcedure [dbo].[Events_Select_ByCreatedBy]    Script Date: 7/18/2022 7:40:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE     PROC [dbo].[Events_Select_ByCreatedBy]
				@DateCreated datetime2
				, @PageIndex int
				, @PageSize int

AS
/* ------TEST CODE ------



	DECLARE		@DateCreated datetime2 = '2022-06-08 22:49:28.1700000'
				, @PageIndex int = 0
				, @PageSize int = 5

	EXECUTE		[dbo].[Events_Select_ByCreatedBy] @DateCreated
												  , @PageIndex
												  , @PageSize


	SELECT * FROM dbo.Events
	WHERE DateCreated = @DateCreated

*/
BEGIN

		DECLARE @offSet int = @PageIndex * @PageSize

		SELECT  [Id]
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

		WHERE [DateCreated] = @DateCreated
		ORDER BY [DateCreated] ASC

		OFFSET @offSet Rows
		FETCH NEXT @PageSize Rows ONLY





END
GO
