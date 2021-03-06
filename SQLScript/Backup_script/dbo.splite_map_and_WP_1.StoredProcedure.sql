USE [RAM]
GO
/****** Object:  StoredProcedure [dbo].[splite_map_and_WP_1]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[splite_map_and_WP_1]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[splite_map_and_WP_1]
GO
/****** Object:  StoredProcedure [dbo].[splite_map_and_WP_1]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[splite_map_and_WP_1]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[splite_map_and_WP_1] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE  [dbo].[splite_map_and_WP_1]
 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
SET NOCOUNT ON;
Create table #find (eid int); 

 declare mycursor cursor for select etlloadid  ,  ParentAgencyNum from TaxonomyRAW
 open mycursor

 
 declare @eid int
 declare @ParentAgencyNum varchar(50)
 
 fetch next from mycursor into   @eid,   @ParentAgencyNum 

 while @@FETCH_STATUS =0
 begin 

 if not exists 
		 (
			select   etlloadid  from RAMRAW join TaxonomyLevelName as t on RAMRAW.taxonomylevelnameid=t.TaxonomyLevelNameID where parentagencynum = @ParentAgencyNum and RAMRAW.taxonomylevelnameid in (2,4)
		 )
 begin
 insert into #find	select etlloadid from  TaxonomyRAW   where etlloadid = @eid
 end 

 fetch next from mycursor into  @eid,  @ParentAgencyNum 
 end

 close mycursor
 deallocate mycursor


 select * from  #find


 select etlloadid, resourceagencynum,TaxonomyLevelNameID, ParentAgencyNum from TaxonomyRAW where etlloadid in ( select eid from  #find)
 select  eid, * from NewRam left join #find on eid = etlloadid  where eid is not null




END

GO
