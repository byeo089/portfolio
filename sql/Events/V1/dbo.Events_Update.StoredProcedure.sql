USE [Kommu]
GO
/****** Object:  StoredProcedure [dbo].[Events_Update]    Script Date: 7/18/2022 7:40:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   PROC [dbo].[Events_Update]
						@EventTypeId int
						, @Name nvarchar(255)
						, @Summary nvarchar(255)
						, @ShortDescription nvarchar(4000)
						, @VenueId int
						, @EventStatusId int
						, @ImageUrl nvarchar(400)
						, @ExternalSiteUrl nvarchar(400)
						, @IsFree bit
						, @Id int

AS
/* ------TEST CODE ------

	SELECT * FROM dbo.Events

	DECLARE		@Id int = 11
	DECLARE		@EventTypeId int = 2
				, @Name nvarchar(255) = 'Meet The Shores by the Beach'
				, @Summary nvarchar(255) = 'Meeting people while stretching'
				, @ShortDescription nvarchar(4000) = 'Yoga on the beach. Bring own yoga mat'
				, @VenueId int = 1
				, @EventStatusId int = 1
				, @ImageUrl nvarchar(400) = 'https://i.pinimg.com/736x/b5/a0/80/b5a080a5a8669433545b8027c1d2031c.jpg'
				, @ExternalSiteUrl nvarchar(400) = 'https://i.pinimg.com/'
				, @IsFree bit = 0

	Execute [dbo].[Events_Update]
				@EventTypeId
				, @Name
				, @Summary
				, @ShortDescription
				, @VenueId
				, @EventStatusId
				, @ImageUrl
				, @ExternalSiteUrl
				, @IsFree
				, @Id

	SELECT * FROM dbo.Events

*/
BEGIN

	DECLARE @DateMod datetime2 = getutcdate()

	UPDATE [dbo].[Events]

	SET	    [EventTypeId]		= @EventTypeId
			,[Name]				= @Name
			,[Summary]			= @Summary
			,[ShortDescription] = @ShortDescription
			,[VenueId]			= @VenueId
			,[EventStatusId]	= @EventStatusId
			,[ImageUrl]			= @ImageUrl
			,[ExternalSiteUrl]	= @ExternalSiteUrl
			,[IsFree]			= @IsFree
			,[DateModified]		= @DateMod

	WHERE Id = @Id


END




GO
