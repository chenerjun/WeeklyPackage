USE [RAM]
GO
/****** Object:  StoredProcedure [dbo].[new_lookup_process]    Script Date: 10/24/2016 3:02:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		William Chen
-- Create date: Long long ago
-- Description:	To manually inspect resource logic ,use below codes and uncomment them
-- =============================================
CREATE PROCEDURE [dbo].[new_lookup_process]
 @ETLLOADID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
---- if object_ID('#program') is not null drop table #program 
---- select *  into #program from ramraw where TaxonomyLevelNameID = 3
--declare  @parentagencynum varchar(50), @MyResourceAgencyNum varchar(50),  @ConnectsToSite varchar(50) 
----STEP 1 find out Program           9256
--select etlloadid , ResourceAgencyNum,publicname,#program.TaxonomyLevelNameID , TaxonomyLevelName,ParentAgency,Phone1Number, ParentAgencyNum,PhysicalAddress1 ,PhysicalCity, PhysicalStateProvince, ConnectsToProgramNum ,ConnectsToSiteNum 
-- from #program join TaxonomyLevelName on #program.taxonomylevelnameid=TaxonomyLevelName.TaxonomyLevelNameID order by etlloadid
-- set @MyResourceAgencyNum= '21473575';set @parentagencynum ='12381543' ;
-----STEP 2
--select   etlloadid , ResourceAgencyNum,publicname,t.TaxonomyLevelName , ParentAgency,Phone1Number, ParentAgencyNum,PhysicalAddress1 ,PhysicalCity, PhysicalStateProvince, ConnectsToProgramNum ,ConnectsToSiteNum 
-- from RAMRAW  join TaxonomyLevelName as t on RAMRAW.taxonomylevelnameid=t.TaxonomyLevelNameID where parentagencynum = @parentagencynum order by etlloadid
--select  @ConnectsToSite=  ConnectsToSiteNum from  RAMRAW  join TaxonomyLevelName as t on RAMRAW.taxonomylevelnameid=t.TaxonomyLevelNameID where parentagencynum = @parentagencynum  and ConnectsToProgramNum = @MyResourceAgencyNum
--print @ConnectsToSite
-- -- STEP 3 find out program@site
--select   etlloadid , ResourceAgencyNum,publicname,t.TaxonomyLevelName , ParentAgency,Phone1Number, ParentAgencyNum,PhysicalAddress1 ,PhysicalCity, PhysicalStateProvince, ConnectsToProgramNum ,ConnectsToSiteNum 
-- from RAMRAW join TaxonomyLevelName as t on RAMRAW.taxonomylevelnameid=t.TaxonomyLevelNameID where ConnectsToProgramNUM = @MyResourceAgencyNum and RAMRAW.TaxonomyLevelNameID  = 4   order by etlloadid

--  -- STEP 4 find out Site
--select Top 1  etlloadid , ResourceAgencyNum,publicname,t.TaxonomyLevelName , ParentAgency,Phone1Number, ParentAgencyNum,PhysicalAddress1 ,PhysicalCity, PhysicalStateProvince, ConnectsToProgramNum ,ConnectsToSiteNum 
-- from RAMRAW join TaxonomyLevelName as t on RAMRAW.taxonomylevelnameid=t.TaxonomyLevelNameID where ResourceAgencyNum = @ConnectsToSite   and  RAMRAW.TaxonomyLevelNameID=2  order by etlloadid

--  -- STEP 5 find out Agency
--select Top 1  etlloadid , ResourceAgencyNum,publicname,t.TaxonomyLevelName , ParentAgency,Phone1Number, ParentAgencyNum,PhysicalAddress1 ,PhysicalCity, PhysicalStateProvince, ConnectsToProgramNum ,ConnectsToSiteNum 
-- from RAMRAW join TaxonomyLevelName as t on RAMRAW.taxonomylevelnameid=t.TaxonomyLevelNameID where ResourceAgencyNum = @parentagencynum and RAMRAW.TaxonomyLevelNameID=1 order by etlloadid






 --==============================================================================
 --
 -- To manually inspect resource logic ,use below codes and uncomment them
 --
 --==============================================================================

--   --input etlloadid only
-- Use RAM
-- go 
----program
--declare @ETLLOADID int;  select @ETLLOADID =121116
select 'Program' as [Program],etlloadid , ResourceAgencyNum,publicname, TaxonomyLevelNameID , ParentAgency, ParentAgencyNum,Phone1Number,PhysicalAddress1 ,PhysicalCity, PhysicalStateProvince, ConnectsToProgramNum ,ConnectsToSiteNum,latitude, longitude 
		from TaxonomyRAW where ETLLOADID=@ETLLOADID
declare @resourceagencynum varchar(50);
select @resourceagencynum = resourceagencynum from TaxonomyRAW where ETLLOADID=@ETLLOADID; 
print '@resourceagencynum='+ @resourceagencynum;

declare @ParentAgencyNum varchar(50)
select @ParentAgencyNum=ParentAgencyNum  from TaxonomyRAW where ETLLOADID=@ETLLOADID; 
print '@ParentAgencyNum = '+@ParentAgencyNum;

----all @ParentAgencyNum   related records
select 'The sameParentAgencyNum' as [sameParentAgencyNum], etlloadid , ResourceAgencyNum,publicname, t.TaxonomyLevelName , ParentAgency, ParentAgencyNum,Phone1Number,PhysicalAddress1 ,PhysicalCity, PhysicalStateProvince, ConnectsToProgramNum ,ConnectsToSiteNum,latitude, longitude 
		from [dbo].[RAMRAW] as r  JOIN [dbo].[TaxonomyLevelName] as t on t.TaxonomyLevelNameID = r.TaxonomyLevelNameID  
		where ParentAgencyNum=@ParentAgencyNum

----program at site
select 'program_at_site' as [program_at_site],etlloadid , ResourceAgencyNum,publicname, t.TaxonomyLevelName  , ParentAgency, ParentAgencyNum,Phone1Number,PhysicalAddress1 ,PhysicalCity, PhysicalStateProvince, ConnectsToProgramNum ,ConnectsToSiteNum,latitude, longitude 
		from [dbo].[RAMRAW] as r  JOIN [dbo].[TaxonomyLevelName] as t on t.TaxonomyLevelNameID = r.TaxonomyLevelNameID    
		where ParentAgencyNum=@ParentAgencyNum and t.TaxonomyLevelNameID  =4 and ConnectsToProgramNum = @resourceagencynum


----site
declare @connectstositenum varchar(50)
select  @connectstositenum = connectstositenum from [dbo].[RAMRAW] where ParentAgencyNum=@ParentAgencyNum and TaxonomyLevelNameID =4 and ConnectsToProgramNum = @resourceagencynum; print '@connectstositenum='+ @connectstositenum;
select 'SITE' as [site], etlloadid , ResourceAgencyNum,publicname, t.TaxonomyLevelName  , ParentAgency, ParentAgencyNum,Phone1Number,PhysicalAddress1 ,PhysicalCity, PhysicalStateProvince, ConnectsToProgramNum ,ConnectsToSiteNum,latitude, longitude
		from [dbo].[RAMRAW] as r  JOIN [dbo].[TaxonomyLevelName] as t on t.TaxonomyLevelNameID = r.TaxonomyLevelNameID    
		where ResourceAgencyNum=@connectstositenum


----agency
select 'Agency' as [agency],etlloadid , ResourceAgencyNum,publicname, t.TaxonomyLevelName  , ParentAgency, ParentAgencyNum,Phone1Number,PhysicalAddress1 ,PhysicalCity, PhysicalStateProvince, ConnectsToProgramNum ,ConnectsToSiteNum,latitude, longitude
		from [dbo].[RAMRAW] as r  JOIN [dbo].[TaxonomyLevelName] as t on t.TaxonomyLevelNameID = r.TaxonomyLevelNameID   
		where ResourceAgencyNum = @ParentAgencyNum  and t.TaxonomyLevelNameID =1 order by etlloadid



END
