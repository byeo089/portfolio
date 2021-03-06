USE [Kommu]
GO
/****** Object:  StoredProcedure [dbo].[EventInformation_Insert]    Script Date: 7/18/2022 7:40:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   PROC [dbo].[EventInformation_Insert]
			@Name nvarchar(255)
			, @Description nvarchar(4000)
			, @LocationTypeId int
			, @LineOne nvarchar(255)
			, @LineTwo nvarchar(255)
			, @City nvarchar(255)
			, @Zip nvarchar(50)
			, @StateId int
			, @Latitude float
			, @Longitude float
			, @ImageUrl nvarchar(255)
			, @Url nvarchar(255)
			, @CreateBy int
			, @ModifiedBy int
			, @CreatedBy int
			, @VenueId int Output
			, @EventTypeId int
			, @EventName nvarchar(255)
			, @Summary nvarchar(255)
			, @ShortDescription nvarchar(4000)
			, @EventVenueId int OUTPUT
			, @EventStatusId int
			, @EventImageUrl nvarchar(400)
			, @ExternalSiteUrl nvarchar(400)
			, @IsFree bit
			, @DateStart datetime2
			, @DateEnd datetime2
			, @Id int OUTPUT


AS

/* -----TEST CODE-----
	DECLARE   @Id int = 0;
	DECLARE	 @Name nvarchar(255) = 'Testing'
			, @Description nvarchar(4000) = 'Testing Insert'
			, @LocationTypeId int = 2
			, @LineOne nvarchar(255) = '500 Main Street'
			, @LineTwo nvarchar(255) = ''
			, @City nvarchar(255) = 'New Brighton'
			, @Zip nvarchar(50) = '55112'
			, @StateId int = 21
			, @Latitude float = 45.05855
			, @Longitude float = -93.19464
			, @ImageUrl nvarchar(255) = 'https://thumbs.dreamstime.com/b/modern-business-building-high-rise-buildings-against-sky-skyscrapers-district-89631665.jpg'
			, @Url nvarchar(255) = 'https://www.myservion.com/'
			, @CreateBy int = 3
			, @ModifiedBy int = 3
			, @CreatedBy int = 3
			, @VenueId int = 0
			, @EventTypeId int = 5
			, @EventName nvarchar(255) = 'Testing Event'
			, @Summary nvarchar(255) = 'Testing Insert 6/17/2022'
			, @ShortDescription nvarchar(4000) = 'Testing Insert 6/17/2022'
			, @EventVenueId int = 0
			, @EventStatusId int = 2
			, @EventImageUrl nvarchar(400) = 'https://thumbs.dreamstime.com/b/modern-business-building-high-rise-buildings-against-sky-skyscrapers-district-89631665.jpg'
			, @ExternalSiteUrl nvarchar(400) = 'https://www.myservion.com/'
			, @IsFree bit = 1
			, @DateStart datetime2 = '2022-08-19'
			, @DateEnd datetime2 = '2022-08-20';

EXECUTE dbo.EventInformation_Insert
			 @Name
			, @Description
			, @LocationTypeId
			, @LineOne
			, @LineTwo
			, @City
			, @Zip
			, @StateId
			, @Latitude
			, @Longitude
			, @ImageUrl
			, @Url
			, @CreateBy
			, @ModifiedBy
			, @CreatedBy
			, @VenueId Output
			, @EventTypeId
			, @EventName
			, @Summary
			, @ShortDescription
			, @VenueId
			, @EventStatusId
			, @EventImageUrl
			, @ExternalSiteUrl
			, @IsFree
			, @DateStart
			, @DateEnd
			, @Id OUTPUT
*/
SET NOCOUNT ON;


BEGIN TRY
	BEGIN TRANSACTION
	EXECUTE dbo.Venues_Insert
			@Name,
			@Description,
			@LocationTypeId,
			@LineOne,
			@LineTwo,
			@City,
			@Zip,
			@StateId,
			@Latitude,
			@Longitude,
			@ImageUrl,
			@Url,
			@CreateBy,
			@ModifiedBy,
			@CreatedBy,
			@VenueId Output

	EXECUTE dbo.Events_Insert
			@EventTypeId
			, @EventName
			, @Summary
			, @ShortDescription
			, @VenueId
			, @EventStatusId
			, @EventImageUrl
			, @ExternalSiteUrl
			, @IsFree
			, @DateStart
			, @DateEnd
			, @Id OUTPUT
	COMMIT
END TRY

BEGIN CATCH

	IF @@TRANCOUNT > 0
	ROLLBACK
	DECLARE @ErrorMessage NVARCHAR(4000), @ErrorSeverity INT;
  SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY();
  RAISERROR(@ErrorMessage, @ErrorSeverity, 1);
END CATCH;

GO
