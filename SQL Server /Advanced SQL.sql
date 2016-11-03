--check cdc enable
SELECT name,is_cdc_enabled
FROM sys.databases
--check sa 
EXEC sp_changedbowner 'sa'
--enable cdc 
use AdventureWorks2008R2
go

exec sys.sp_cdc_enable_db
go
--check cdc on table
SELECT [name], is_tracked_by_cdc  
FROM sys.tables 
GO 

--create cdc on table
EXEC sys.sp_cdc_enable_table 
@source_schema = N'HumanResources', 
@source_name   = N'Shift', 
@role_name     = NULL 
GO

--insert data
INSERT INTO [HumanResources].[Shift] 
       ([Name],[StartTime],[EndTime],[ModifiedDate]) 
VALUES ('Tracked Shift',GETDATE(), GETDATE(), GETDATE()) 
GO 

--update data 
UPDATE [HumanResources].[Shift]
SET Name = 'New Name',
      ModifiedDate = GETDATE()
WHERE ShiftID = 4
GO
--delete data
DELETE 
FROM [HumanResources].[Shift] 
WHERE ShiftID = 4 
GO  


--check data
select *
from AdventureWorks2008R2.HumanResources.Shift

select *
from cdc.HumanResources_Shift_CT 

--note:
1: delete
2: insert
3: before update
4: after update
--help
EXEC sys.sp_cdc_help_change_data_capture 
GO

--disable
EXECUTE sys.sp_cdc_disable_table 
    @source_schema = N'HumanResources', 
    @source_name = N'Shift',
    @capture_instance = N'HumanResources_Shift';
GO

--cdc on column
EXEC sys.sp_cdc_enable_table 
@source_schema = N'HumanResources', 
@source_name   = N'Shift', 
@role_name     = NULL, 
@captured_column_list = '[ShiftID],[Name]' 
GO

--Retrive captured data of specific time frame
SELECT * 
FROM cdc.lsn_time_mapping 
GO 

--



