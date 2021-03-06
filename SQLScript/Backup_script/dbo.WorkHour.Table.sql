USE [RAM]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WorkHour_TaxonomyRAW]') AND parent_object_id = OBJECT_ID(N'[dbo].[WorkHour]'))
ALTER TABLE [dbo].[WorkHour] DROP CONSTRAINT [FK_WorkHour_TaxonomyRAW]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WorkHour_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WorkHour] DROP CONSTRAINT [DF_WorkHour_CreateDate]
END

GO
/****** Object:  Table [dbo].[WorkHour]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WorkHour]') AND type in (N'U'))
DROP TABLE [dbo].[WorkHour]
GO
/****** Object:  Table [dbo].[WorkHour]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WorkHour]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WorkHour](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ETLLoadID] [int] NULL,
	[WorkHour] [nvarchar](100) NULL,
	[WorkHourDesc] [nvarchar](255) NULL,
	[ChangedDate] [datetime] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_WorkHour] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_WorkHour_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[WorkHour] ADD  CONSTRAINT [DF_WorkHour_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END

GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WorkHour_TaxonomyRAW]') AND parent_object_id = OBJECT_ID(N'[dbo].[WorkHour]'))
ALTER TABLE [dbo].[WorkHour]  WITH CHECK ADD  CONSTRAINT [FK_WorkHour_TaxonomyRAW] FOREIGN KEY([ETLLoadID])
REFERENCES [dbo].[TaxonomyRAW] ([ETLLoadID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WorkHour_TaxonomyRAW]') AND parent_object_id = OBJECT_ID(N'[dbo].[WorkHour]'))
ALTER TABLE [dbo].[WorkHour] CHECK CONSTRAINT [FK_WorkHour_TaxonomyRAW]
GO
