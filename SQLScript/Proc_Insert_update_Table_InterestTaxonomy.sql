USE [RAM]
GO
/****** Object:  StoredProcedure [dbo].[Proc_Insert_update_Table_InterestTaxonomy]    Script Date: 11/17/2016 12:20:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================================
-- Author:		William Chen
-- Create date: Nov.17, 2016
-- Description:	To add new Taxonomy Code on to RAM, 
--				Insert or update Table [dbo].[InterestTaxonomy]
-- ================================================================
ALTER PROCEDURE [dbo].[Proc_Insert_update_Table_InterestTaxonomy]
	-- Add the parameters for the stored procedure here
@InterestTaxonomyID INT,
@InterestTaxonomyDelivery NVARCHAR(50) = 'Mapped',
@InterestTaxonomyCode NVARCHAR(50),
@InterestTaxonomyTerms  NVARCHAR(50)  = '',
@InterestTaxonomyDesc  NVARCHAR(50)  = '',
@Active  BIT  = 1,
@Phase INT = 1 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

IF EXISTS (SELECT [InterestTaxonomyID] FROM [RAM].[dbo].[InterestTaxonomy] WHERE [InterestTaxonomyCode] = 'Some [InterestTaxonomyCode]')
	BEGIN
		UPDATE [RAM].[dbo].[InterestTaxonomy] SET
			[Active] = 1,
			[changedDate] = GETDATE()
		WHERE [InterestTaxonomyCode] = @InterestTaxonomyCode
	END
ELSE
	BEGIN
		INSERT INTO [RAM].[dbo].[InterestTaxonomy]
		([InterestTaxonomyID],[InterestTaxonomyDelivery],[InterestTaxonomyCode],[InterestTaxonomyTerms],[InterestTaxonomyDesc],[Active],[Phase],[changedDate])
		VALUES 
		(@InterestTaxonomyID, @InterestTaxonomyDelivery,@InterestTaxonomyCode,@InterestTaxonomyTerms, @InterestTaxonomyDesc,  1  ,  @Phase , getdate())
	END

END
