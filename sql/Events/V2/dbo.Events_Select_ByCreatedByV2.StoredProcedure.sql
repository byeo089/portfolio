USE [Kommu]
GO
/****** Object:  StoredProcedure [dbo].[Events_Select_ByCreatedByV2]    Script Date: 7/18/2022 7:40:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE     PROC [dbo].[Events_Select_ByCreatedByV2]
				@DateCreated datetime2
				, @PageIndex int
				, @PageSize int

AS
/* ------TEST CODE ------

	DECLARE		@DateCreated datetime2 = '2022-06-08 22:49:28.1700000'
				, @PageIndex int = 0
				, @PageSize int = 5

	EXECUTE		[dbo].[Events_Select_ByCreatedByV2] @DateCreated
												  , @PageIndex
												  , @PageSize


	SELECT * FROM dbo.Events
	WHERE DateCreated = @DateCreated

*/
BEGIN

		DECLARE @offSet int = @PageIndex * @PageSize

		SELECT  e.Id
				   , et.[Name] as EventTypeName
				   , e.[Name]
				   , e.[Summary]
				   , e.[ShortDescription]
				   , v.[Name] as VenueName
				   , es.[Name] as EventStatusName
				   , e.[ImageUrl]
				   , e.[ExternalSiteUrl]
				   , e.[IsFree]
				   , e.[DateCreated]
				   , e.[DateModified]
				   , e.[DateStart]
				   , e.[DateEnd]
				   , TotalCount = COUNT(1) OVER()

		FROM     [dbo].[Events] as e INNER JOIN [dbo].[EventTypes] as et
							ON e.[EventTypeId] = et.Id
						INNER JOIN [dbo].[EventStatus] as es
							ON es.Id = e.EventStatusId
						INNER JOIN [dbo].[Venues] as v
							ON e.VenueId = v.Id

		WHERE e.DateCreated = @DateCreated
		ORDER BY e.DateCreated ASC

		OFFSET @offSet Rows
		FETCH NEXT @PageSize Rows ONLY


END
GO
