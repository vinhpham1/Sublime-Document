-- Check for Used Log Space
DBCC SQLPERF(LOGSPACE)
GO

-- Check to see if there is any open transaction
USE AdventureWorks2008R2
DBCC OPENTRAN
GO

-- Check to make sure CDC is disabled.
use master
SELECT name, is_cdc_enabled
FROM sys.databases
WHERE name = 'AdventureWorks2008R2' and is_cdc_enabled = 1

go

/* ===========================================================================*/
--  Check any CDC related objects exists
/* ===========================================================================*/

-- 
use AdventureWorks2008R2
go
-- Check CDC Tables
SELECT  *
FROM    sys.tables t
        JOIN sys.schemas s ON t.schema_id = s.schema_id
WHERE   s.name = 'cdc'
    
    
-- Check CDC procs
SELECT  QUOTENAME(pr.name) AS name
FROM    sys.procedures pr
        JOIN sys.schemas s ON pr.schema_id = s.schema_id
WHERE   s.name = 'cdc'

-- Check any CDC functions, triggers, etc.
SELECT  QUOTENAME(fn.name) AS name
FROM    sys.objects fn
        JOIN sys.schemas s ON fn.schema_id = s.schema_id
WHERE   fn.type IN ( 'FN', 'IF', 'TF' )
        AND s.name = 'cdc'

-- Check prinipals
DECLARE @ruleName NVARCHAR(255)
SELECT  @ruleName = DP1.name
FROM    sys.database_principals AS DP1
        JOIN sys.database_principals AS DP2 ON DP1.owning_principal_id = DP2.principal_id
WHERE   DP1.type = 'R'
        AND DP2.name = 'cdc';

-- Check schemas
SELECT * FROM sys.schemas WHERE name = N'cdc'

-- Check user CDC
SELECT * FROM sys.database_principals WHERE name = N'cdc'

-- Check CDC jobs
SELECT name FROM msdb..sysjobs where name like 'cdc.%'


-- Disable CDC
exec AdventureWorks2008R2.sys.sp_cdc_disable_db


-- Enable
exec AdventureWorks2008R2.sys.sp_cdc_disable_db