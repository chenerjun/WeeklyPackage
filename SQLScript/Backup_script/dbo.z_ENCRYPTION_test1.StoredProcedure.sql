USE [RAM]
GO
/****** Object:  StoredProcedure [dbo].[z_ENCRYPTION_test1]    Script Date: 11/27/2016 9:37:32 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[z_ENCRYPTION_test1]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[z_ENCRYPTION_test1]
GO
