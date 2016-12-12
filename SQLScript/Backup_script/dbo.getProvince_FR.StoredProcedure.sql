USE [RAM]
GO
/****** Object:  StoredProcedure [dbo].[getProvince_FR]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getProvince_FR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[getProvince_FR]
GO
/****** Object:  StoredProcedure [dbo].[getProvince_FR]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getProvince_FR]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[getProvince_FR] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[getProvince_FR]
 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT        ProvinceID, ProvinceFrench,ProvinceAlias  
FROM            Province
 where  ProvinceID <20
END

GO
