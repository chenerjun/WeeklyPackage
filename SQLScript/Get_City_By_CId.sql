USE [RAM]
GO
/****** Object:  StoredProcedure [dbo].[Get_City_By_CId]    Script Date: 8/5/2016 11:28:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		William Chen
-- Create date: <Create Date,,>
-- Description:	Get allowing city information in detail by using CityID
-- Reversion: Aug.5, 2016
-- Added parameter @token
-- =============================================
ALTER PROCEDURE [dbo].[Get_City_By_CId]
	-- Add the parameters for the stored procedure here
	@cid int,
	@token NVARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT        CityId, CityName as city, province.ProvinceAlias as province, CityLocation.latitude, CityLocation.longitude
FROM            CityLocation  join province on CityLocation.ProvinceID = province.ProvinceID
WHERE CityLocation.CityId = @cid and CityName !='TBD' and CityId IN (SELECT CityId FROM F_Get_ALL_Allow_City(@token))
ORDER BY CityName, CityId
END
