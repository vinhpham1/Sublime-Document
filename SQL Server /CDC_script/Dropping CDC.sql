use AdventureWorks2008R2

go

-- Disable CDC
exec AdventureWorks2008R2.sys.sp_cdc_disable_db

-- This is only for someon who has database trigger.
-- DISABLE TRIGGER [TR_ProtectCriticalTables] ON DATABASE;
go

USE [msdb]
GO

IF  EXISTS (SELECT job_id FROM msdb.dbo.sysjobs_view WHERE name = N'cdc.AdventureWorks2008R2_capture')
EXEC msdb.dbo.sp_delete_job @job_name = N'cdc.AdventureWorks2008R2_capture', @delete_unused_schedule=1
GO

IF  EXISTS (SELECT job_id FROM msdb.dbo.sysjobs_view WHERE name = N'cdc.AdventureWorks2008R2_cleanup')
EXEC msdb.dbo.sp_delete_job @job_name = N'cdc.AdventureWorks2008R2_cleanup', @delete_unused_schedule=1
GO

use AdventureWorks2008R2
go

DECLARE @tableName NVARCHAR(100);
DECLARE CDCCleanUpCursor CURSOR FAST_FORWARD READ_ONLY
FOR
    SELECT  QUOTENAME(t.name) AS name
    FROM    sys.tables t
            JOIN sys.schemas s ON t.schema_id = s.schema_id
    WHERE   s.name = 'cdc'
OPEN CDCCleanUpCursor 
FETCH FROM CDCCleanUpCursor INTO @TableName 
WHILE ( @@Fetch_Status = 0 ) 
    BEGIN 

		-- REMOVE COMMENT THIS
        EXEC ( 'drop table cdc.' + @TableName + '; ' );
        print 'drop table cdc.' + @TableName + '; '
        FETCH NEXT FROM CDCCleanUpCursor INTO @TableName 
    END  
CLOSE CDCCleanUpCursor 
DEALLOCATE CDCCleanUpCursor;
go

DECLARE @prName NVARCHAR(100);
DECLARE CDCCleanUpCursor2 CURSOR FAST_FORWARD READ_ONLY
FOR
    SELECT  QUOTENAME(pr.name) AS name
    FROM    sys.procedures pr
            JOIN sys.schemas s ON pr.schema_id = s.schema_id
    WHERE   s.name = 'cdc'
OPEN CDCCleanUpCursor2 
FETCH FROM CDCCleanUpCursor2 INTO @prName 
WHILE ( @@Fetch_Status = 0 ) 
    BEGIN 
    	-- REMOVE COMMENT THIS
        EXEC ( 'drop procedure cdc.' + @prName + '; ' );
        print 'drop procedure cdc.' + @prName + '; '
        FETCH NEXT FROM CDCCleanUpCursor2 INTO @prName 
    END  
CLOSE CDCCleanUpCursor2
DEALLOCATE CDCCleanUpCursor2 

GO

DECLARE @fnName NVARCHAR(100);
DECLARE CDCCleanUpCursor3 CURSOR FAST_FORWARD READ_ONLY
FOR
    SELECT  QUOTENAME(fn.name) AS name
    FROM    sys.objects fn
            JOIN sys.schemas s ON fn.schema_id = s.schema_id
    WHERE   fn.type IN ( 'FN', 'IF', 'TF' )
            AND s.name = 'cdc'
OPEN CDCCleanUpCursor3 
FETCH FROM CDCCleanUpCursor3 INTO @fnName 
WHILE ( @@Fetch_Status = 0 ) 
    BEGIN 
		-- REMOVE COMMENT THIS
        EXEC ( 'drop function cdc.' + @fnName + '; ' );
        PRINT 'drop function cdc.' + @fnName + '; '
        FETCH NEXT FROM CDCCleanUpCursor3 INTO @fnName 
    END  
CLOSE CDCCleanUpCursor3
DEALLOCATE CDCCleanUpCursor3 
go

DECLARE @ruleName NVARCHAR(100);
SELECT  @ruleName = DP1.name
FROM    sys.database_principals AS DP1
        JOIN sys.database_principals AS DP2 ON DP1.owning_principal_id = DP2.principal_id
WHERE   DP1.type = 'R'
        AND DP2.name = 'cdc';

EXEC ('ALTER AUTHORIZATION ON ROLE::'+@ruleName+' TO dbo; ')
PRINT 'ALTER AUTHORIZATION ON ROLE::'+@ruleName+' TO dbo; '
go

IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'cdc')
DROP SCHEMA [cdc]
GO

IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'cdc')
DROP USER [cdc]
GO
