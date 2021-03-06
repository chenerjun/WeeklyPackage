USE [RAM]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ASPStateT__Flags__21E0EDE6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ASPStateTempSessions] DROP CONSTRAINT [DF__ASPStateT__Flags__21E0EDE6]
END

GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ASPStateT__Creat__20ECC9AD]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ASPStateTempSessions] DROP CONSTRAINT [DF__ASPStateT__Creat__20ECC9AD]
END

GO
/****** Object:  Index [Index_Expires]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ASPStateTempSessions]') AND name = N'Index_Expires')
DROP INDEX [Index_Expires] ON [dbo].[ASPStateTempSessions]
GO
/****** Object:  Table [dbo].[ASPStateTempSessions]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ASPStateTempSessions]') AND type in (N'U'))
DROP TABLE [dbo].[ASPStateTempSessions]
GO
/****** Object:  Table [dbo].[ASPStateTempSessions]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ASPStateTempSessions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ASPStateTempSessions](
	[SessionId] [nvarchar](88) NOT NULL,
	[Created] [datetime] NOT NULL,
	[Expires] [datetime] NOT NULL,
	[LockDate] [datetime] NOT NULL,
	[LockDateLocal] [datetime] NOT NULL,
	[LockCookie] [int] NOT NULL,
	[Timeout] [int] NOT NULL,
	[Locked] [bit] NOT NULL,
	[SessionItemShort] [varbinary](7000) NULL,
	[SessionItemLong] [image] NULL,
	[Flags] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SessionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Index [Index_Expires]    Script Date: 12/8/2016 9:19:28 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ASPStateTempSessions]') AND name = N'Index_Expires')
CREATE NONCLUSTERED INDEX [Index_Expires] ON [dbo].[ASPStateTempSessions]
(
	[Expires] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ASPStateT__Creat__20ECC9AD]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ASPStateTempSessions] ADD  DEFAULT (getutcdate()) FOR [Created]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ASPStateT__Flags__21E0EDE6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ASPStateTempSessions] ADD  DEFAULT ((0)) FOR [Flags]
END

GO
