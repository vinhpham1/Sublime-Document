INSERT INTO `tblsys_consumerKey` (`apiKey`, `clientName`, `clientLogo`, `clientLink`, `isActive`) 
SELECT CONCAT(MD5('ADR_Heineken2016_Staging'), MD5('ADR_Heineken2016_Staging')), 'ADR_Heineken2016_Prod', NULL, 'http://heineken.vietnamworks.com/', 1;

select * from tblsys_consumerKey where clientName like 'ADR_Heineken2016_Staging%';

select * from tblsys_consumerKey where tblsys_consumerKey.apiKey like 'c1fd04ec8124b897ee9be730b933ce951337ce79241fe2c0511198add2cc5e2a%';



INSERT INTO `tblsys_consumerKey` (`apiKey`, `clientName`, `clientLogo`, `clientLink`, `isActive`) 
SELECT CONCAT(MD5('ADR_nmsvn2016_Prod'), MD5('ADR_nmsvn2016_Prod')), 'ADR_nmsvn2016_Prod', NULL, 'http://nmsvn.vietnamworks.com/', 1;

INSERT INTO `tblsys_consumerKey` (`apiKey`, `clientName`, `clientLogo`, `clientLink`, `isActive`) 
SELECT CONCAT(MD5('ADR_Avery2016_Prod'), MD5('ADR_Avery_Prod')), 'ADR_Avery2016_Prod', NULL, 'http://avery.vietnamworks.com/', 1;

#17877
INSERT INTO `tblsys_consumerKey` (`apiKey`, `clientName`, `clientLogo`, `clientLink`, `isActive`) 
SELECT CONCAT(MD5('ADR_Ateam-event_Staging2016'), MD5('ADR_Ateam-event_Staging2016')), 'ADR_Ateam-event_Staging2016', NULL, 'http://ateam-event.vietnamworks.com/', 1;