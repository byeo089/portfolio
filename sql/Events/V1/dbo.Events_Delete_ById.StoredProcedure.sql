USE [Kommu]
GO
/****** Object:  StoredProcedure [dbo].[Events_Delete_ById]    Script Date: 7/18/2022 7:40:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROC [dbo].[Events_Delete_ById]
				@Id int
AS

/*------TEST CODE------
	SELECT *
	FROM dbo.Events


	DECLARE @Id int = 1
	EXECUTE [dbo].[Events_DeleteById] @Id


	SELECT *
	FROM dbo.Events
	SELECT *
	FROM dbo.EventStatus
	WHERE Id = @Id
*/

BEGIN

	DECLARE @DateMod datetime2(7) = GETUTCDATE()


	UPDATE	[dbo].[Events]
	SET		[EventStatusId] = 8
			, [DateModified] = @DateMod
	WHERE	Id = @Id



END
GO
