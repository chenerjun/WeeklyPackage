USE [RAM]
GO
/****** Object:  Table [yos].[ETLLOAD0312]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[ETLLOAD0312]') AND type in (N'U'))
DROP TABLE [yos].[ETLLOAD0312]
GO
/****** Object:  Table [yos].[ETLLOAD0312]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[ETLLOAD0312]') AND type in (N'U'))
BEGIN
CREATE TABLE [yos].[ETLLOAD0312](
	[ETLLoadID] [bigint] IDENTITY(1,1) NOT NULL,
	[ResourceAgencyNum] [varchar](50) NULL,
	[PublicName] [varchar](2000) NULL,
	[AlternateName] [varchar](2000) NULL,
	[OfficialName] [varchar](2000) NULL,
	[TaxonomyLevelName] [varchar](50) NULL,
	[ParentAgency] [varchar](2000) NULL,
	[ParentAgencyNum] [varchar](50) NULL,
	[RecordOwner] [varchar](50) NULL,
	[UniqueIDPriorSystem] [varchar](50) NULL,
	[MailingAttentionName] [varchar](50) NULL,
	[MailingAddress1] [varchar](2000) NULL,
	[MailingAddress2] [varchar](2000) NULL,
	[MailingCity] [varchar](50) NULL,
	[MailingStateProvince] [varchar](50) NULL,
	[MailingPostalCode] [varchar](50) NULL,
	[MailingCountry] [varchar](50) NULL,
	[MailingAddressIsPrivate] [varchar](50) NULL,
	[PhysicalAddress1] [varchar](2000) NULL,
	[PhysicalAddress2] [varchar](2000) NULL,
	[PhysicalCity] [varchar](50) NULL,
	[PhysicalCounty] [varchar](50) NULL,
	[PhysicalStateProvince] [varchar](50) NULL,
	[PhysicalPostalCode] [varchar](50) NULL,
	[PhysicalCountry] [varchar](50) NULL,
	[PhysicalAddressIsPrivate] [varchar](50) NULL,
	[OtherAddress1] [varchar](2000) NULL,
	[OtherAddress2] [varchar](2000) NULL,
	[OtherCity] [varchar](50) NULL,
	[OtherCounty] [varchar](50) NULL,
	[OtherStateProvince] [varchar](50) NULL,
	[OtherPostalCode] [varchar](50) NULL,
	[OtherCountry] [varchar](50) NULL,
	[Latitude] [numeric](18, 10) NULL,
	[Longitude] [numeric](18, 10) NULL,
	[HoursOfOperation] [varchar](2000) NULL,
	[Phone1Number] [varchar](2000) NULL,
	[Phone1Name] [varchar](2000) NULL,
	[Phone1Description] [varchar](2000) NULL,
	[Phone1IsPrivate] [bit] NULL,
	[Phone1Type] [varchar](50) NULL,
	[Phone2Number] [varchar](50) NULL,
	[Phone2Name] [varchar](50) NULL,
	[Phone2Description] [varchar](2000) NULL,
	[Phone2IsPrivate] [bit] NULL,
	[Phone2Type] [varchar](50) NULL,
	[Phone3Number] [varchar](50) NULL,
	[Phone3Name] [varchar](50) NULL,
	[Phone3Description] [varchar](2000) NULL,
	[Phone3IsPrivate] [bit] NULL,
	[Phone3Type] [varchar](50) NULL,
	[Phone4Number] [varchar](50) NULL,
	[Phone4Name] [varchar](50) NULL,
	[Phone4Description] [varchar](2000) NULL,
	[Phone4IsPrivate] [bit] NULL,
	[Phone4Type] [varchar](50) NULL,
	[Phone5Number] [varchar](50) NULL,
	[Phone5Name] [varchar](50) NULL,
	[Phone5Description] [varchar](2000) NULL,
	[Phone5IsPrivate] [bit] NULL,
	[Phone5Type] [varchar](50) NULL,
	[PhoneFax] [varchar](50) NULL,
	[PhoneFaxDescription] [varchar](2000) NULL,
	[PhoneFaxIsPrivate] [bit] NULL,
	[PhoneTTY] [varchar](50) NULL,
	[PhoneTTYDescription] [varchar](2000) NULL,
	[PhoneTTYIsPrivate] [bit] NULL,
	[PhoneTollFree] [varchar](50) NULL,
	[PhoneTollFreeDescription] [varchar](2000) NULL,
	[PhoneTollFreeIsPrivate] [bit] NULL,
	[PhoneNumberHotline] [varchar](50) NULL,
	[PhoneNumberHotlineDescription] [varchar](2000) NULL,
	[PhoneNumberHotlineIsPrivate] [bit] NULL,
	[PhoneNumberBusinessLine] [varchar](50) NULL,
	[PhoneNumberBusinessLineDescription] [varchar](2000) NULL,
	[PhoneNumberBusinessLineIsPrivate] [bit] NULL,
	[PhoneNumberOutOfArea] [varchar](50) NULL,
	[PhoneNumberOutOfAreaDescription] [varchar](2000) NULL,
	[PhoneNumberOutOfAreaIsPrivate] [bit] NULL,
	[PhoneNumberAfterHours] [varchar](50) NULL,
	[PhoneNumberAfterHoursDescription] [varchar](2000) NULL,
	[PhoneNumberAfterHoursIsPrivate] [bit] NULL,
	[EmailAddressMain] [varchar](2000) NULL,
	[WebsiteAddress] [varchar](2000) NULL,
	[AgencyStatus] [varchar](50) NULL,
	[AgencyClassification] [varchar](50) NULL,
	[AgencyDescription] [varchar](max) NULL,
	[SearchHints] [varchar](2000) NULL,
	[CoverageArea] [varchar](2000) NULL,
	[CoverageAreaText] [varchar](2000) NULL,
	[Eligibility] [varchar](2000) NULL,
	[EligibilityAdult] [bit] NULL,
	[EligibilityChild] [bit] NULL,
	[EligibilityFamily] [bit] NULL,
	[EligibilityFemale] [bit] NULL,
	[EligibilityMale] [bit] NULL,
	[EligibilityTeen] [bit] NULL,
	[SeniorWorkerName] [varchar](50) NULL,
	[SeniorWorkerTitle] [varchar](2000) NULL,
	[SeniorWorkerEmailAddress] [varchar](2000) NULL,
	[SeniorWorkerPhoneNumber] [varchar](50) NULL,
	[SeniorWorkerIsPrivate] [varchar](50) NULL,
	[MainContactName] [varchar](2000) NULL,
	[MainContactTitle] [varchar](2000) NULL,
	[MainContactEmailAddress] [varchar](2000) NULL,
	[MainContactPhoneNumber] [varchar](50) NULL,
	[MainContactType] [varchar](50) NULL,
	[MainContactIsPrivate] [varchar](50) NULL,
	[LicenseAccreditation] [varchar](50) NULL,
	[IRSStatus] [varchar](50) NULL,
	[FEIN] [varchar](50) NULL,
	[YearIncorporated] [varchar](50) NULL,
	[AnnualBudgetTotal] [varchar](50) NULL,
	[LegalStatus] [varchar](50) NULL,
	[SourceOfFunds] [varchar](50) NULL,
	[ExcludeFromWebsite] [varchar](50) NULL,
	[ExcludeFromDirectory] [varchar](50) NULL,
	[DisabilitiesAccess] [varchar](2000) NULL,
	[PhysicalLocationDescription] [varchar](2000) NULL,
	[BusServiceAccess] [varchar](2000) NULL,
	[PublicAccessTransportation] [varchar](2000) NULL,
	[FeeStructureSource] [varchar](2000) NULL,
	[ApplicationProcess] [varchar](2000) NULL,
	[ResourceInfo] [varchar](2000) NULL,
	[DocumentsRequired] [varchar](2000) NULL,
	[LanguagesOffered] [varchar](2000) NULL,
	[LanguagesOfferedList] [varchar](2000) NULL,
	[AvailabilityNumberOfTimes] [varchar](2000) NULL,
	[AvailabilityFrequency] [varchar](2000) NULL,
	[AvailabilityPeriod] [varchar](50) NULL,
	[ServiceNotAlwaysAvailability] [varchar](50) NULL,
	[CapacityType] [varchar](2000) NULL,
	[ServiceCapacity] [varchar](2000) NULL,
	[NormalWaitTime] [varchar](2000) NULL,
	[TemporaryMessage] [varchar](2000) NULL,
	[TemporaryMessageAppears] [datetime] NULL,
	[TemporaryMessageExpires] [datetime] NULL,
	[EnteredOn] [datetime] NULL,
	[UpdatedOn] [datetime] NULL,
	[MadeInactiveOn] [datetime] NULL,
	[InternalNotes] [varchar](2000) NULL,
	[InternalNotesForEditorsAndViewers] [varchar](2000) NULL,
	[HighlightedResource] [bit] NULL,
	[LastVerifiedOn] [datetime] NULL,
	[LastVerifiedByName] [varchar](50) NULL,
	[LastVerifiedByTitle] [varchar](2000) NULL,
	[LastVerifiedByPhoneNumber] [varchar](50) NULL,
	[LastVerifiedByEmailAddress] [varchar](2000) NULL,
	[LastVerificationApprovedBy] [varchar](50) NULL,
	[AvailableForDirectory] [varchar](50) NULL,
	[AvailableForReferral] [varchar](50) NULL,
	[AvailableForResearch] [varchar](50) NULL,
	[PreferredProvider] [bit] NULL,
	[ConnectsToSiteNum] [varchar](50) NULL,
	[ConnectsToProgramNum] [varchar](50) NULL,
	[LanguageOfRecord] [varchar](50) NULL,
	[CurrentWorkflowStepCode] [varchar](50) NULL,
	[VolunteerOpportunities] [varchar](50) NULL,
	[VolunteerDuties] [varchar](2000) NULL,
	[Categories] [varchar](50) NULL,
	[TaxonomyTerm] [varchar](2000) NULL,
	[TaxonomyTerms] [varchar](2000) NULL,
	[TaxonomyTermsNotDeactivated] [varchar](2000) NULL,
	[TaxonomyCodes] [varchar](2000) NULL,
	[Coverage] [varchar](max) NULL,
	[WorkHours] [varchar](2000) NULL,
	[CustomServicesToLGBTQ] [varchar](2000) NULL,
	[CustomAutomatedStatus] [varchar](2000) NULL,
	[CustomBatchID] [varchar](50) NULL,
	[CustomProgramHarmReductionService] [varchar](50) NULL,
	[CustomEligibilitybyAge] [varchar](2000) NULL,
	[CustomEligibilityByGender] [varchar](2000) NULL,
	[CustomLanguagePrefer] [varchar](2000) NULL,
	[CustomBilingualService] [varchar](2000) NULL,
	[CustomManualStatus] [varchar](50) NULL,
	[CustomMCYSAccountNumber] [varchar](2000) NULL,
	[CustomAnonymityPolicy] [varchar](max) NULL,
	[CustomSuggestKeyword] [varchar](max) NULL,
	[CustomRecordType] [varchar](50) NULL,
	[CustomSourceDatabase] [varchar](50) NULL,
	[changedDate] [datetime] NULL,
	[createdDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
