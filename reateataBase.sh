

winpty mysql -u root  -se "create database FilRouge" ;

winpty mysql -u root  -se "use FilRouge" ;


winpty mysql -u root -D "FilRouge" -se "create table triangle(ID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,COTE_A INT NOT NULL,COTE_B INT NOT NULL,COTE_C INT NOT NULL)";



var=0;
while [ $var -lt 500 ] ; do
	winpty mysql -u root -D "FilRouge"  -se " INSERT INTO triangle( COTE_A, COTE_B, COTE_C) VALUES (ROUND(RAND()*10),ROUND(RAND()*10),ROUND(RAND()*10)) ";
	var=$(($var+1));
	echo $var
done


