Membres du Groupe: 

Yacine HAMMAOUI
Marc-Vincent SEUANES PEREIRA
Elhadj THIAM


DESCRIPTION: 
Nous génerons une base de données avec 500 triangles de façon aléatoire (random) en utilisant un ScriptShell. 
Ce script lit les données et analyse la proportion de triangles Isocèles, Equilatérales, et Scalènes. Il nous
affiche le résultat sous forme de pourcentage pour chaque type de triangle. 
	

------------------------------------------------------------------------------------------------
INDISPENSABLES:
	*les scripts ne marchent que sur windows, vu que la commande wintpy nous a été recommendée.
	*Nous avons Xampp,
	*Nous avons une variable d'environement ou nous devons exécuter le script depuis le \bin du Xampp.

------------------------------------------------------------------------------------------------
Vous trouverez trois scripts shell: 
	-le premier "createataBase" permet de créer la base de données et d'y insérér les 500 triangles. L'execution de ce 
	script peut prend environ 3 minutes car nous n'avons pas eu le temps de trouver une manière permettant d'insérer des 
	éléments sans se reconnecter pour chaque insertions( Je pense qu'on aurait pu utiliser des procédures SQL mais nous ne 
	les connaissons pas).
	-le second détermine la proportion de chaque type de triangle (isocèle, équilatéral et scalène). 
	-le dernier permet d'effacer la base de donnée si vous souhaitez refaire la manipulation. 

------------------------------------------------------------------------------------------------
MISE EN OEUVRE (comment nous avons procédé):

Pour la création de la tables nous avons procédé de deux méthodes différentes:
	b) sur le phpmyadmin, un membre du groupe a utiliser la base de données pour tester l'insertion et les différentes requêtes de l'analyse de proportion des différents triangles.
	a) sur l'invite de commande windows un autre membre du groupe a procédé à la création de la table afin de tester les différentes commandes qui seront par la suite implémentées dans
shell.

	ci-dessous la structure de la base de donnée
+--------+------------------+------+-----+---------+----------------+
| Field  | Type             | Null | Key | Default | Extra          |
+--------+------------------+------+-----+---------+----------------+
| ID     | int(10) unsigned | NO   | PRI | NULL    | auto_increment |
| COTE_A | int(11)          | NO   |     | NULL    |                |
| COTE_B | int(11)          | NO   |     | NULL    |                |
| COTE_C | int(11)          | NO   |     | NULL    |                |
+--------+------------------+------+-----+---------+----------------+

	c) un troisième membre du groupe a fait les scripts shell.

Requetes utilisées: 
		a) insertion des triangles:
		INSERT INTO triangle( COTE_A, COTE_B, COTE_C) VALUES (ROUND(RAND()*10),ROUND(RAND()*10),ROUND(RAND()*10))

		b)création des 500 triangles:
                Nous avons utilisée une boucle while
		
		C)détermination des proportions (équilatérale): nous avons utilisé des requêtes imbriquées.

		SELECT (COUNT()/ (SELECT COUNT() FROM triangle))*100 as Pourcentage FROM triangle WHERE (COTE_A = COTE_B AND COTE_B = COTE_C)

----------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------
ANNEXE: 

Ci-dessous, la procédure pour créer une table 'triangle' dans la base de données 'filrouge' dans l'invite de commande windows.

1- lancer l'invite de commande sous windows.
   puis entrez les commandes suivantes:
	cd ..
	cd c:\xampp\mysql\bin
	mysql.exe -u root -p (il vous demandera un password, faites entrez et vous vous retrouverez dans la base de données 'Mariadb'

2- Une fois que c'est fait créons notre nouvelle base de donnée 'filrouge'
	puis entrez les commandes suivantes:
		create database filrouge;

3- Utilisation de la base de données crées.
	puis entrez les commandes suivantes:
		use filrouge;

4-Créons maintenant notre table client:
	puis entrez les commandes suivantes:

		create table triangle(
			ID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
			COTE_A INT NOT NULL, 
			COTE_B INT NOT NULL,
			COTE_C INT NOT NULL);

5-Pour vérifier ce qu'il y a dedans, nous ferons: 
	
	describe triangle;

6-Pour voir ce qu'il y a dedans, nous ferons: 
	
	Select * from triangle;
--------------------------------------------------------------------------------------------------------------------------------------------------