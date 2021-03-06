USE [Kommu]
GO
/****** Object:  StoredProcedure [dbo].[Events_Select_ByIdV2]    Script Date: 7/18/2022 7:40:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE     PROC [dbo].[Events_Select_ByIdV2]
				@Id int

AS
/*------TEST CODE ------

	DECLARE		@Id int = 1
	EXECUTE		[dbo].[Events_Select_ByIdV2] @Id

	SELECT *
	FROM dbo.Events
	WHERE Id = @Id

*/
BEGIN


		SELECT e.[Name]
					 , et.[Name] as EventTypeName
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

		FROM     [dbo].[Events] as e INNER JOIN [dbo].[EventTypes] as et
							ON e.[EventTypeId] = et.Id
						INNER JOIN [dbo].[EventStatus] as es
							ON es.Id = e.EventStatusId
						INNER JOIN [dbo].[Venues] as v
							ON e.VenueId = v.Id

		WHERE e.Id = @Id

END
GO
