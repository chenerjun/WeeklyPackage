USE [RAM]
GO
/****** Object:  UserDefinedFunction [dbo].[Test_NewRam_address_etc]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Test_NewRam_address_etc]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[Test_NewRam_address_etc]
GO
/****** Object:  UserDefinedFunction [dbo].[Test_NewRam_address_etc]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Test_NewRam_address_etc]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[Test_NewRam_address_etc] 
(
@ETLLOADID int
)
RETURNS 
@resuleTab TABLE 
(
n char(100),
etlloadid int,
 [PhysicalAddress] varchar(2000),
[PhysicalCityID] int,
[PhysicalProvinceID] int,
[PhysicalPostalCode]varchar(20),
[Latitude] numeric(18,10),
longitude numeric(18,10) 
)
AS
BEGIN
	-- Fill the table variable with the rows for your result set
  --input etlloadid only
--program
-- declare @ETLLOADID int; select @ETLLOADID =22959
-- select ''program'',etlloadid , ResourceAgencyNum,publicname, TaxonomyLevelNameID , ParentAgency, ParentAgencyNum,Phone1Number,PhysicalAddress1 ,PhysicalCity, PhysicalStateProvince, ConnectsToProgramNum ,ConnectsToSiteNum,latitude, longitude 
		--from TaxonomyRAW where ETLLOADID=@ETLLOADID
declare @resourceagencynum varchar(50);
select @resourceagencynum = resourceagencynum from TaxonomyRAW where ETLLOADID=@ETLLOADID;  

declare @ParentAgencyNum varchar(50)
select @ParentAgencyNum=ParentAgencyNum  from TaxonomyRAW where ETLLOADID=@ETLLOADID; 

--all @ParentAgencyNum   related records
--select ''same parent#'', etlloadid , ResourceAgencyNum,publicname, TaxonomyLevelNameID , ParentAgency, ParentAgencyNum,Phone1Number,PhysicalAddress1 ,PhysicalCity, PhysicalStateProvince, ConnectsToProgramNum ,ConnectsToSiteNum,latitude, longitude 
--		from [dbo].[RAMRAW]  where ParentAgencyNum=@ParentAgencyNum

--program at site
--select ''P@S'' etlloadid , ResourceAgencyNum,publicname, TaxonomyLevelNameID , ParentAgency, ParentAgencyNum,Phone1Number,PhysicalAddress1 ,PhysicalCity, PhysicalStateProvince, ConnectsToProgramNum ,ConnectsToSiteNum,latitude, longitude 
--		from [dbo].[RAMRAW]  where ParentAgencyNum=@ParentAgencyNum and TaxonomyLevelNameID =4 and ConnectsToProgramNum = @resourceagencynum


--site
declare @connectstositenum varchar(50)
select  @connectstositenum = connectstositenum from [dbo].[RAMRAW] where ParentAgencyNum=@ParentAgencyNum and TaxonomyLevelNameID =4 and ConnectsToProgramNum = @resourceagencynum; 
--select ''site'', etlloadid , ResourceAgencyNum,publicname, TaxonomyLevelNameID , ParentAgency, ParentAgencyNum,Phone1Number,PhysicalAddress1 ,PhysicalCity, PhysicalStateProvince, ConnectsToProgramNum ,ConnectsToSiteNum,latitude, longitude
--		from [dbo].[RAMRAW]  where ResourceAgencyNum=@connectstositenum


--agency
--select ''Agency'', etlloadid , ResourceAgencyNum,publicname, TaxonomyLevelNameID , ParentAgency, ParentAgencyNum,Phone1Number,PhysicalAddress1 ,PhysicalCity, PhysicalStateProvince, ConnectsToProgramNum ,ConnectsToSiteNum,latitude, longitude
--		from [dbo].[RAMRAW]  where ResourceAgencyNum = @ParentAgencyNum  and TaxonomyLevelNameid=1




insert into @resuleTab select ''Related Site'',
etlloadid, 
ISNULL( [PhysicalAddress1],'''') + ISNULL([PhysicalAddress2],'''')  as physicalAddress,
[PhysicalCityID]  ,
[PhysicalProvinceID]  ,
[PhysicalPostalCode],
[Latitude]   ,
longitude  
from [dbo].[RAMRAW]  where ResourceAgencyNum=@connectstositenum
	RETURN 

END
' 
END

GO
