USE [Kommu]
GO
/****** Object:  StoredProcedure [dbo].[Events_Insert]    Script Date: 7/18/2022 7:40:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   PROC [dbo].[Events_Insert]
				@EventTypeId int
				, @Name nvarchar(255)
				, @Summary nvarchar(255)
				, @ShortDescription nvarchar(4000)
				, @VenueId int
				, @EventStatusId int
				, @ImageUrl nvarchar(400)
				, @ExternalSiteUrl nvarchar(400)
				, @IsFree bit
				, @DateStart datetime2
				, @DateEnd datetime2
				, @Id int OUTPUT

AS
/*------TEST CODE ------
	SELECT * FROM dbo.Events

	DECLARE		@Id int = 0
	DECLARE		@EventTypeId int = 2
				, @Name nvarchar(255) = 'Meet By The Shores'
				, @Summary nvarchar(255) = 'Meeting people while stretching'
				, @ShortDescription nvarchar(4000) = 'Yoga on the beach. Bring own yoga mat'
				, @VenueId int = 1
				, @EventStatusId int = 1
				, @ImageUrl nvarchar(400) = 'https://i.pinimg.com/736x/b5/a0/80/b5a080a5a8669433545b8027c1d2031c.jpg'
				, @ExternalSiteUrl nvarchar(400) = 'https://i.pinimg.com/'
				, @IsFree bit = 1
				, @DateStart datetime2 = '2022-06-09'
				, @DateEnd datetime2 = '2022-06-10'

	Execute [dbo].[Events_Insert]
				@EventTypeId
				, @Name
				, @Summary
				, @ShortDescription
				, @VenueId
				, @EventStatusId
				, @ImageUrl
				, @ExternalSiteUrl
				, @IsFree
				, @DateStart
				, @DateEnd
				, @Id OUTPUT

	SELECT * FROM dbo.Events

*/
BEGIN

		INSERT INTO [dbo].[Events]
				   ([EventTypeId]
				   ,[Name]
				   ,[Summary]
				   ,[ShortDescription]
				   ,[VenueId]
				   ,[EventStatusId]
				   ,[ImageUrl]
				   ,[ExternalSiteUrl]
				   ,[IsFree]
				   ,[DateStart]
				   ,[DateEnd])

			 VALUES
				   (@EventTypeId
				   ,@Name
				   ,@Summary
				   ,@ShortDescription
				   ,@VenueId
				   ,@EventStatusId
				   ,@ImageUrl
				   ,@ExternalSiteUrl
				   ,@IsFree
				   ,@DateStart
				   ,@DateEnd)

		SET @Id = SCOPE_IDENTITY();

END




GO
