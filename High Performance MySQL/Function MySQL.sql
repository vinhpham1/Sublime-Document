New function

create table table_name(column_name enum([values,...]) not null)
create table table_name(column_name set([values,...]) not null)
--set can store more than one value
--find_in_set('',col), filed(col,'')

date_diff(date1,date2)
timstampdiff(hour,time1,time2)

SET SQL_SAFE_UPDATES = 0; 
update table1
inner join table2
on ...
set...
where

select concat(left(time,14),'00:00')-interval 23 hour

DROP TABLE IF EXISTS my_summary_new, my_summary_old;
CREATE TABLE my_summary_new LIKE my_summary;
RENAME TABLE my_summary TO my_summary_old, my_summary_new TO my_summary;

TO_DAYS(CURRENT_DATE)


