USE [RAM]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomEligibilitybyAge_TaxonomyRAW]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomEligibilitybyAge]'))
ALTER TABLE [dbo].[CustomEligibilitybyAge] DROP CONSTRAINT [FK_CustomEligibilitybyAge_TaxonomyRAW]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomEligibilitybyAge_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomEligibilitybyAge] DROP CONSTRAINT [DF_CustomEligibilitybyAge_CreateDate]
END

GO
/****** Object:  Table [dbo].[CustomEligibilitybyAge]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CustomEligibilitybyAge]') AND type in (N'U'))
DROP TABLE [dbo].[CustomEligibilitybyAge]
GO
/****** Object:  Table [dbo].[CustomEligibilitybyAge]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CustomEligibilitybyAge]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CustomEligibilitybyAge](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ETLLoadID] [int] NULL,
	[CustomEligibilitybyAge] [nvarchar](50) NULL,
	[CustomEligibilitybyAgeDesc] [nvarchar](255) NULL,
	[ChangedDate] [datetime] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_CustomEligibilitybyAge] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomEligibilitybyAge_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomEligibilitybyAge] ADD  CONSTRAINT [DF_CustomEligibilitybyAge_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END

GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomEligibilitybyAge_TaxonomyRAW]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomEligibilitybyAge]'))
ALTER TABLE [dbo].[CustomEligibilitybyAge]  WITH CHECK ADD  CONSTRAINT [FK_CustomEligibilitybyAge_TaxonomyRAW] FOREIGN KEY([ETLLoadID])
REFERENCES [dbo].[TaxonomyRAW] ([ETLLoadID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomEligibilitybyAge_TaxonomyRAW]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomEligibilitybyAge]'))
ALTER TABLE [dbo].[CustomEligibilitybyAge] CHECK CONSTRAINT [FK_CustomEligibilitybyAge_TaxonomyRAW]
GO
