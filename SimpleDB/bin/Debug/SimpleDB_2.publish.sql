﻿/*
Скрипт развертывания для SimpleDB

Этот код был создан программным средством.
Изменения, внесенные в этот файл, могут привести к неверному выполнению кода и будут потеряны
в случае его повторного формирования.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "SimpleDB"
:setvar DefaultFilePrefix "SimpleDB"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\"

GO
:on error exit
GO
/*
Проверьте режим SQLCMD и отключите выполнение скрипта, если режим SQLCMD не поддерживается.
Чтобы повторно включить скрипт после включения режима SQLCMD выполните следующую инструкцию:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'Для успешного выполнения этого скрипта должен быть включен режим SQLCMD.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Выполняется изменение [dbo].[Tasks]...';


GO
ALTER TABLE [dbo].[Tasks] ALTER COLUMN [DeadLine] DATETIME2 (0) NOT NULL;

ALTER TABLE [dbo].[Tasks] ALTER COLUMN [Start] DATETIME2 (0) NOT NULL;


GO
PRINT N'Выполняется обновление [dbo].[vUserTask]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[vUserTask]';


GO
PRINT N'Выполняется обновление [dbo].[DeleteTaskById]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[DeleteTaskById]';


GO
PRINT N'Обновление завершено.';


GO
