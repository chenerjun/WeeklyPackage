USE [RAM]
GO
/****** Object:  StoredProcedure [dbo].[getProvince]    Script Date: 7/23/2016 9:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		William Chen
-- Create date: Feb.14, 2016
-- Description:	Get province list by language
-- Reversion: July 23, 2016
--            Add Paremeter @token, based on the access control list , 
--            authorized use can list out specific province list
--            if allow provinceID = 0 int the table permission , means allow list out all of provinces
-- =============================================
ALTER PROCEDURE [dbo].[getProvince]
 @lang nvarchar(10) = N'en',
 @token NVARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @V INT
	SELECT TOP(1) @v = ProvinceID FROM F_Get_Allow_Province (@token) 

	IF @v = 0  -- allow access all of province
		BEGIN
			IF @lang = 'en'
				SELECT        ProvinceID, [ProvinceAlias] as Alias, Province as Province
				FROM            Province
				WHERE        (ProvinceID < 20)

			else
				SELECT        ProvinceID, [ProvinceAlias] as Alias, [ProvinceFrench] as Province
				FROM            Province
				WHERE        (ProvinceID < 20)
		END
	ELSE
		BEGIN  -- allow access sepcific province based on the access control List table 
			IF @lang = 'en'
				SELECT        ProvinceID, [ProvinceAlias] as Alias, Province as Province
				FROM            Province
				WHERE        (ProvinceID < 20) AND ProvinceID IN (SELECT  ProvinceID FROM F_Get_Allow_Province (@token) )

			else
				SELECT        ProvinceID, [ProvinceAlias] as Alias, [ProvinceFrench] as Province
				FROM            Province
				WHERE        (ProvinceID < 20) AND ProvinceID IN (SELECT  ProvinceID FROM F_Get_Allow_Province (@token) )
		END
END
