USE [Kommu]
GO
/****** Object:  StoredProcedure [dbo].[EventInformation_SelectAll]    Script Date: 7/18/2022 7:40:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROC [dbo].[EventInformation_SelectAll]

AS

/* -----TEST CODE-----

	EXECUTE dbo.EventInformation_SelectAll

*/
BEGIN

	Select e.Id
			, et.Name AS EventType
			, e.Name
			, e.Summary
			, e.ShortDescription
			, es.Name AS EventStatus
			, e.ImageUrl
			, ExternalSiteUrl
			, isFree
			, DateStart
			, DateEnd
			, v.Id AS VenueId
			, v.Name AS VenueName
			, v.Description
			, v.Url as VenueUrl
			, Location = (SELECT l.Id
								, lt.Name
								, l.LineOne
								, l.LineTwo
								, l.City
								, st.Name AS State
								, l.Zip
								, l.Latitude
								, l.Longitude
								, l.DateCreated
								, l.DateModified
						FROM dbo.Locations AS l LEFT OUTER JOIN dbo.States AS st
							ON l.StateId = st.Id
						LEFT OUTER JOIN dbo.LocationTypes AS lt
							on lt.Id = l.LocationTypeId
						WHERE v.LocationId = l.Id
							FOR JSON AUTO)

	FROM dbo.Events AS e LEFT OUTER JOIN dbo.Venues AS v
		ON e.VenueId = v.Id
	LEFT OUTER JOIN dbo.EventTypes AS et
		ON e.EventTypeId = et.Id
	LEFT OUTER JOIN dbo.EventStatus AS es
		ON e.EventStatusId = es.Id

END
GO
