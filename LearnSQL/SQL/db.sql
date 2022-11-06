CREATE DATABASE mariadb;
CREATE TABLE dbmario;
SHOW DATABASE mariadb;
SHOW TABLE dbmario;

SELECT mariadb FROM dbmario;

----DISTINCT su funcion es escoger resultados unicos de repetidos
SELECT DISTINCT column_name1, column_name2 FROM table_name;

--- LIMIT solo imprime hasta el limite establecido
SELECT ID, FirstName, LastName, City FROM customers LIMIT 5;

--- OFFSET imprime del numero elegido o establecido en adelante
SELECT ID, FirstName, LastName, City FROM customers OFFSET 3 LIMIT 4;