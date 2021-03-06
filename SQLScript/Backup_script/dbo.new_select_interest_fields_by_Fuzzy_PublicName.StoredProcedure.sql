USE [RAM]
GO
/****** Object:  StoredProcedure [dbo].[new_select_interest_fields_by_Fuzzy_PublicName]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[new_select_interest_fields_by_Fuzzy_PublicName]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[new_select_interest_fields_by_Fuzzy_PublicName]
GO
/****** Object:  StoredProcedure [dbo].[new_select_interest_fields_by_Fuzzy_PublicName]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[new_select_interest_fields_by_Fuzzy_PublicName]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[new_select_interest_fields_by_Fuzzy_PublicName] AS' 
END
GO
-- =============================================
-- Author:		William Chen
-- Create date: Sept.15, 2015
-- Description:	Select the most interesting fields from ETLLOAD TABLE
-- =============================================
ALTER PROCEDURE  [dbo].[new_select_interest_fields_by_Fuzzy_PublicName]
@publicname nvarchar(255) = N''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT [ETLLoadID]
      ,[ResourceAgencyNum]
      ,[PublicName]
      ,[TaxonomyLevelName]
      ,[ParentAgency]
      ,[ParentAgencyNum]
      ,[MailingAttentionName]
      ,[MailingAddress1]
      ,[MailingAddress2]
      ,[MailingCity]
      ,[MailingStateProvince]
      ,[MailingPostalCode]
      ,[MailingCountry]
      ,[MailingAddressIsPrivate]
      ,[PhysicalAddress1]
      ,[PhysicalAddress2]
      ,[PhysicalCity]
      ,[PhysicalCounty]
      ,[PhysicalStateProvince]
      ,[PhysicalPostalCode]
      ,[PhysicalCountry]
      ,[PhysicalAddressIsPrivate]
      ,[OtherAddress1]
      ,[OtherAddress2]
      ,[OtherCity]
      ,[OtherCounty]
      ,[OtherStateProvince]
      ,[OtherPostalCode]
      ,[OtherCountry]
      ,[Latitude]
      ,[Longitude]
      ,[HoursOfOperation]
      ,[Phone1Number]
      ,[Phone1Name]
      ,[Phone1Description]
      ,[Phone1IsPrivate]
      ,[Phone1Type]
      ,[Phone2Number]
      ,[Phone2Name]
      ,[Phone2Description]
      ,[Phone2IsPrivate]
      ,[Phone2Type]
      ,[Phone3Number]
      ,[Phone3Name]
      ,[Phone3Description]
      ,[Phone3IsPrivate]
      ,[Phone3Type]
      ,[Phone4Number]
      ,[Phone4Name]
      ,[Phone4Description]
      ,[Phone4IsPrivate]
      ,[Phone4Type]
      ,[Phone5Number]
      ,[Phone5Name]
      ,[Phone5Description]
      ,[Phone5IsPrivate]
      ,[Phone5Type]
      ,[PhoneFax]
      ,[PhoneFaxDescription]
      ,[PhoneFaxIsPrivate]
      ,[PhoneTTY]
      ,[PhoneTTYDescription]
      ,[PhoneTTYIsPrivate]
      ,[PhoneTollFree]
      ,[PhoneTollFreeDescription]
      ,[PhoneTollFreeIsPrivate]
      ,[PhoneNumberHotline]
      ,[PhoneNumberHotlineDescription]
      ,[PhoneNumberHotlineIsPrivate]
      ,[PhoneNumberBusinessLine]
      ,[PhoneNumberBusinessLineDescription]
      ,[PhoneNumberBusinessLineIsPrivate]
      ,[PhoneNumberOutOfArea]
      ,[PhoneNumberOutOfAreaDescription]
      ,[PhoneNumberOutOfAreaIsPrivate]
      ,[PhoneNumberAfterHours]
      ,[PhoneNumberAfterHoursDescription]
      ,[PhoneNumberAfterHoursIsPrivate]
      ,[EmailAddressMain]
      ,[WebsiteAddress]
      ,[AgencyDescription]
      ,[CoverageArea]
      ,[CoverageAreaText]
      ,[FeeStructureSource]
      ,[ApplicationProcess]
      ,[ResourceInfo]
      ,[DocumentsRequired]
      ,[LanguagesOffered]
      ,[LanguagesOfferedList]
      ,[ConnectsToSiteNum]
      ,[ConnectsToProgramNum]
      ,[LanguageOfRecord]
      ,[TaxonomyTerm]
      ,[TaxonomyTerms]
      ,[TaxonomyCodes]
      ,[Coverage]
      ,[WorkHours]
      ,[CustomServicesToLGBTQ]
      ,[CustomAutomatedStatus]
      ,[CustomEligibilitybyAge]
      ,[CustomEligibilityByGender]
      ,[CustomLanguagePrefer]
      ,[CustomBilingualService]
      ,[CustomManualStatus]
      ,[CustomMCYSAccountNumber]
      ,[CustomAnonymityPolicy]
      ,[CustomSuggestKeyword]
      ,[CustomRecordType]
      ,[createdDate]
  FROM [RAM].[dbo].[ETLLoad] 
  WHERE PublicName like ''+'%'+ @publicname + '%' + ''
END

GO
