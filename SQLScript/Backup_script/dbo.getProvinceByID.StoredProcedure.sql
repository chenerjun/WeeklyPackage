USE [RAM]
GO
/****** Object:  StoredProcedure [dbo].[getProvinceByID]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getProvinceByID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[getProvinceByID]
GO
/****** Object:  StoredProcedure [dbo].[getProvinceByID]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getProvinceByID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[getProvinceByID] AS' 
END
GO
-- =======================================================================================================
-- Author:		William Chen
-- Create date: Feb.14, 2016
-- Description:	Get Province by language and  Province ID
-- Reversion: July 23, 2016
-- Add Parmeter @Token. Based on access control list, authorizted user list province info by provinceID
-- If ProvinceId = 0 in table permission, means allow list out all of province
-- =======================================================================================================
ALTER PROCEDURE [dbo].[getProvinceByID] 
	-- Add the parameters for the stored procedure here
@lang nvarchar(50) = N'en',
@pid int = 1,
@token NVARCHAR (50)
AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @v INT
	SELECT TOP(1) @v = ProvinceID FROM F_Get_Allow_Province (@token) 
	IF @v = 0 
		BEGIN -- Allow list out any province
			if @lang = 'en'
				SELECT        ProvinceID, [ProvinceAlias] as Alias, Province as Province
				FROM            Province
				WHERE        (ProvinceID =@pid)
			else
				SELECT        ProvinceID, [ProvinceAlias] as Alias, [ProvinceFrench] as Province
				FROM            Province
				WHERE        (ProvinceID =@pid)
		END
	ELSE
		BEGIN  -- Allow list specific Province based on access control list in table permission
			if @lang = 'en'
				SELECT        ProvinceID, [ProvinceAlias] as Alias, Province as Province
				FROM            Province
				WHERE         ProvinceID =@pid  AND  @pid IN (SELECT  ProvinceID FROM F_Get_Allow_Province (@token) )
			else
				SELECT        ProvinceID, [ProvinceAlias] as Alias, [ProvinceFrench] as Province
				FROM            Province
				WHERE         ProvinceID =@pid  AND  @pid IN (SELECT  ProvinceID FROM F_Get_Allow_Province (@token) )
		END



END
 

GO
