USE [RAM]
GO
/****** Object:  StoredProcedure [dbo].[Get_City_By_CId]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Get_City_By_CId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Get_City_By_CId]
GO
/****** Object:  StoredProcedure [dbo].[Get_City_By_CId]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Get_City_By_CId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Get_City_By_CId] AS' 
END
GO
-- =============================================
-- Author:		William Chen
-- Create date: <Create Date,,>
-- Description:	Get city information in detail by using CityID
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

GO
