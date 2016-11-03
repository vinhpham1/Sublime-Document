INSERT INTO `tblsys_consumerKey` (`apiKey`, `clientName`, `clientLogo`, `clientLink`, `isActive`) 
SELECT CONCAT(MD5('ADR_Proregcognition2016_Staging'), MD5('MD5ADR_Proregcognition2016_Staging')), 'ADR_Proregcognition2016_Staging', NULL, 'http://proregcognition.vietnamworks.com/', 1;

select * from tblsys_consumerKey where clientName like 'ADR_Proregcognition2016_Staging%';

select * from tblsys_consumerKey where tblsys_consumerKey.apiKey like 'c1fd04ec8124b897ee9be730b933ce951337ce79241fe2c0511198add2cc5e2a%';