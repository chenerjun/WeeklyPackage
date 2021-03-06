USE [RAM]
GO
/****** Object:  StoredProcedure [dbo].[GetCityAll]    Script Date: 8/4/2016 10:33:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- Reversion: July 24, 2016
-- Based on access control list, authorized user allowing to list out cities
-- When CityId List  =  null, means does not allow 
-- =============================================
ALTER PROCEDURE [dbo].[GetCityAll] 
	-- Add the parameters for the stored procedure here
	@token NVARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @V INT

    -- Insert statements for procedure here
SELECT        CityId, CityName as city,   p.ProvinceAlias as Province
FROM            CityLocation as c  JOIN Province as p on  c.ProvinceID = p.ProvinceID
WHERE Cityname != 'TBD' AND CityID IN (select * from F_Get_ALL_Allow_City(@token))
ORDER BY c.ProvinceID, Cityname 
END
