CREATE USER 'user_name'@'localhost' IDENTIFIED BY 'daDS5@$@';

GRANT ALL PRIVILEGES ON *.* TO 'user_name'@'localhost' WITH GRANT OPTION;


drop user 'user_name1'@'localhost', 'user_name'@'localhost'