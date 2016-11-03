##insert Dak Nong
insert into tblref_citycode 
values (73,'Dak Nong',1);

insert into tblref_city
values (73,1,1,'Đắk Nông',73,2),(73,2,1,'Dak Nong',73,2);
##insert and update Bac Kan and Dak Lak
update tblref_citycode
set citycode = case when cityid = 4 and citycode like 'Bac Can' then 'Bac Kan'
					when cityid = 18 and citycode like 'Dac Lac' then 'Dak Lak'
                    else citycode
                    end
where cityid in (4,18);

update tblref_city
set 
	cityname = case when cityid = 18 and languageid = 1 then 'Đắk Lắk'
					when cityid = 18 and languageid = 2 then 'Dak Lak'
                    when cityid = 4 and languageid = 2 then 'Bac Kan'
                    when cityid = 4 and languageid = 1 then 'Bắc Kạn'
                    else cityname
                    end
where cityid in (4,18);

##insert and update district into tblref_district

##revert tu liem
update tblref_district
set districtname = case when languageid = 1 then 'Từ Liêm'
						when languageid = 2 then 'Tu Liem'
                        else districtname
                        end
where districtid = 32;


insert into tblref_district
values 
(54,1,24,'Nam Từ Liêm',30),
(54,2,24,'South Tu Liem',30),
(55,1,17,'Liên Chiểu',1),
(56,1,17,'Thanh Khê',2),
(57,1,17,'Hải Châu',3),
(58,1,17,'Sơn Trà',4),
(59,1,17,'Ngũ Hành Sơn',5),
(60,1,17,'Cẩm Lệ',6),
(61,1,17,'Hoà Vang',7),
(62,1,17,'Hoàng Sa',8),
(55,2,17,'Lien Chieu',1),
(56,2,17,'Thanh Khe',2),
(57,2,17,'Hai Chau',3),
(58,2,17,'Son Tra',4),
(59,2,17,'Ngu Hanh Son',5),
(60,2,17,'Cam Le',6),
(61,2,17,'Hoa Vang',7),
(62,2,17,'Hoang Sa',8);

#insert bac tu liem
insert into tblref_district
values 
(63,1,24,'Bắc Từ Liêm',31),
(63,2,24,'North Tu Liem',31);

