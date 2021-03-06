USE [RAM]
GO
/****** Object:  StoredProcedure [dbo].[Proc_Insert_update_table_SubcategoryID_InterestTaxonomyID]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_Insert_update_table_SubcategoryID_InterestTaxonomyID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Proc_Insert_update_table_SubcategoryID_InterestTaxonomyID]
GO
/****** Object:  StoredProcedure [dbo].[Proc_Insert_update_table_SubcategoryID_InterestTaxonomyID]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_Insert_update_table_SubcategoryID_InterestTaxonomyID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Proc_Insert_update_table_SubcategoryID_InterestTaxonomyID] AS' 
END
GO
-- =============================================
-- Author:		William Chen
-- Create date: Nov.16, 2016
-- Description:	<Insert or update table SubcategoryID_InterestTaxonomyID
--
-- =============================================
ALTER PROCEDURE [dbo].[Proc_Insert_update_table_SubcategoryID_InterestTaxonomyID]
	-- Add the parameters for the stored procedure here
@taxonomyCode nvarchar(50) ,
@subcategoryid int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets FROM
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT @taxonomyCode = LTRIM(RTRIM(@taxonomyCode));

DECLARE @InterestTaxonomyID INT ;
-- check whether this taxonomy code has resource or not
SELECT 'Table ETLLOAD', ETLLOADID , ResourceAgencyNum,PublicName,[TaxonomyLevelName], TaxonomyCodes,LanguageOfRecord, [CustomRecordType]
		FROM etlload 
		WHERE ([CustomRecordType] LIKE '%RAM%'  ) AND ( taxonomyCodes like '%'+ @taxonomyCode+ '%'   );  

SELECT        @InterestTaxonomyID = InterestTaxonomyID FROM            InterestTaxonomy     
		WHERE  (  Active = 1 )   AND     (InterestTaxonomyCode = @taxonomyCode)  ;
-- see what InterestTaxonomyID is 
SELECT  'Table InterestTaxonomy',    InterestTaxonomyID,   Active,  changedDate,   createdDate FROM     InterestTaxonomy 
		WHERE        (InterestTaxonomyCode = @taxonomyCode)  ;

-- check; if SubcategoryID_InterestTaxonomyID pair exists then update or insert
IF NOT EXISTS	(
				SELECT SubcategoryID_InterestTaxonomyID  FROM [RAM].[dbo].[SubcategoryID_InterestTaxonomyID] 
					WHERE  InterestTaxonomyID = @InterestTaxonomyID   AND  SubCategoryID = @subcategoryid 
				)
	BEGIN   ---   New Taxonomy Code
		INSERT INTO [RAM].[dbo].[SubcategoryID_InterestTaxonomyID]  (SubCategoryID , InterestTaxonomyID ,  Active  , ChangedDate )  VALUES
		(@subcategoryid ,  @InterestTaxonomyID ,  1  ,  GETDATE())
	END
ELSE  -- OLD Taxonomy Code
	BEGIN
		update [RAM].[dbo].[SubcategoryID_InterestTaxonomyID] set　Active = 1,　ChangedDate = GETDATE()
		WHERE InterestTaxonomyID = @InterestTaxonomyID   AND  SubCategoryID = @subcategoryid  AND Active = 0
	END  ;

-- Review review inserted or updated result
SELECT        a.SubcategoryID_InterestTaxonomyID, a.SubCategoryID, SubCategory.SubCategory, a.InterestTaxonomyID, b.InterestTaxonomyCode, a.Active, a.ChangedDate, a.CreatedDate
FROM            SubcategoryID_InterestTaxonomyID AS a INNER JOIN
                         InterestTaxonomy AS b ON a.InterestTaxonomyID = b.InterestTaxonomyID INNER JOIN
                         SubCategory ON a.SubCategoryID = SubCategory.SubCategoryID
WHERE        (a.SubCategoryID = @subcategoryid) AND (a.Active = 1)

END

GO
