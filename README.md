# How use MYSQL

SELECT FirstName FROM customers 

"Muestra solo la columna de nombres"

---

#### MULTIPLES CONSULTAS

* SELECT FirstName FROM customers;
* SELECT City FROM customers; 

"Muestra la columna de nombres y tambien aparte la de ciudad"

---

SELECT FirstName, LastName, City 
FROM customers; 

"Muestra multiples columnas de la tabla CLIENTES"

---

SELECT * FROM customers; 

"El " * " en SQL significa todas/os, en este caso se esta seleccionando todas las columnas de la tabla CLIENTES"

---

SELECT DISTINCT City FROM customers; 

""DISTINCT" se utiliza para eliminar todos los registros duplicados de la columna y retornar solo los registros unicos"

---

LA PALABRA CLAVE "LIMIT"

SELECT ID, FirstName, LastName, City
FROM customers LIMIT 5;

"Podemos recuperar los primeros 5 registros de la tabla CLIENTES"

---

SELECT ID, FirstName, LastName, City
FROM customers OFFSET 3 LIMIT 4;

""OFFSET"Comienza mostrando desde la posicion 3 = 0, entoces muestra la posicion 4 hasta LIMIT 4"

---

SELECT City FROM customers;

SELECT customers.City FROM customers;

"Esta forma de escribir es especialmente util cuando se trabaja con multiples tablas que pueden compartir el mismo nombre de columnas"

---            
"ORDER BY"

SELECT * FROM customers
ORDER BY FirstName; 

"Ordena alfabeticamente los nombres dados, tambien se pueden seleccionar VARIAS COLUMNAS"

---

SELECT * FROM customers 
ORDER BY LastName, Age;

"Cuando se repiten dos apellidos iguales se los ordena conforme su edad"

---

WHERE

SELECT * FROM customers
WHERE ID = 7; "Llamo a toda la fila"

---

SELECT * FROM customers
WHERE ID != 5;. "Muestro la tabla sin la fila 5"

---


SELECT * FROM customers 
WHERE ID BETWEEN 3 AND 7; "Muestro solo las tablas de los ID dados"

---


SELECT ID, FirstName, LastName, City 
FROM customers
WHERE City = 'New York'; 

"Muestra todas las columnas con aquel nombre"

---

OPERADORES LOGICOS

AND

SELECT ID, FirstName, LastName, Age
FROM customers
WHERE Age >= 30 AND Age <= 40; "Muestro la tabla solo con la condicion dada"

---

"Escribe una consulta para generar los nombres de todas las películas que fueron producidas por los estudios Marvel en 2010 o más tarde, clasificadas por la columna 'name'. "

SELECT Name FROM Films
WHERE Year >= 2010 AND Production = 'Marvel Studios'
ORDER BY Name;

---

OR

SELECT * FROM customers 
WHERE City = 'New York' OR City = 'Chicago';

---

"Escribe una consulta para obtener toda la información sobre todos los coches con un motor eléctrico o los fabricados después de 2018. "

SELECT * FROM Cars
WHERE Engine = 'Electric' OR Year >=2018;

---

COMBINANDO AND Y OR

SELECT * FROM customers
WHERE City = 'New York'
AND (Age=30 OR Age=35);

---

"Estás manejando una oficina de entrega y necesita priorizar tus pedidos.
Los pedidos en los que el total de la compra supera los $400 y (and) la edad del cliente es mayor de 40 años, o (or) donde la distancia de la oficina al punto de entrega es inferior a 10 millas, se consideran pedidos de alta prioridad. 
Escribe una consulta para generar todos los pedidos de alta prioridad, ordenados por la columna de 'precio'. "

SELECT * FROM Orders
WHERE Price >= 400 AND (Age >=40 OR Distance <= 10)
ORDER BY Price;

---

EL OPERADOR 'IN'

SELECT * FROM customers 
WHERE City IN ('New York', 'Los Angeles', 'Chicago'); 

"Se optimizar el codigo con 'IN' en lugar de usar 'OR''"

=======================================÷=

"Escribe una consulta para obtener los nombres de los equipos y los países de todos los equipos que han jugado en la Liga (España), la Premier League (Inglaterra) y la Bundesliga (Alemania)․"

SELECT Teamname, Country FROM Teams
WHERE Country IN ('Spain', 'England', 'Germany');

=======================================÷=

"Escribe una consulta para generar los nombres de todos los proveedores que no están en Londres o París."

SELECT * FROM suppliers
WHERE City NOT IN ('London', 'Paris');

"Excluye las ciudades de las columnas dadas"

---

LA FUNCION CONCAT

SELECT CONCAT(FirstName, ', ' , City) FROM customers;

"CONCAT se usa para concatenar una cadena de texto"

---

AS

SELECT CONCAT(FirstName,', ', City) AS new_column  " 'AS' Añade un nuevo nombre a la columna"
FROM customers;

---

OPERADORES LOGICOS

SELECT ID, FirstName, LastName, Salary+500 AS Salary. "Se le asigna un incremento de $ 500 a todos los empleados"
FROM employees;

---

SELECT ID, FirstName, LastName, Salary+500 AS Salary
FROM employees;

"Sumamos $500 a los empleados y creamos una nueva columna llamada SALARY"

---

"Cada empleado recibe un bono una vez al año. El bono para cada empleado es igual a sus años de experiencia multiplicado por 500.
Escribe una consulta para generar las columnas firstname y lastname en una columna llamada fullname separados por espacio, y el salario anual total de cada empleado teniendo en cuenta los bonos nombrados total, ordenados por el columna ‘total’."

SELECT CONCAT( FirstName, ' ', LastName)
AS fullname, (Salary*12) + (Experience*500) AS total FROM  Staff
ORDER BY Total;

---

UPPER Y LOWER

SELECT FirstName, UPPER(LastName) AS LastName 
FROM employees;

"La funcion 'UPPER' convierte toda la columna dada en mayuscula".

"La funcion 'LOWER' la convierte en minuscula"

---

"Escribe una consulta para generar las columnas firstname y lastname en una columna llamada uppercasename separada por un espacio y convertida en mayúsculas."

SELECT UPPER (CONCAT(FirstName, ' ', LastName)) 
AS Uppercasename FROM staff;

---

SQRT "Retorna la raiz cuadrada de una cantidad"

SELECT Salary, SQRT(Salary) 
FROM employees;

---

AVG "Retorna el valor promedio de una columna"

SELECT AVG(Salary) FROM employees;

====================≠=====================

"SUBCONSULTAS"

"Primero sacamos el promedio de la columna SALARY" 

SELECT AVG(Salary) FROM employees

"Despues..." 

SELECT FirstName, Salary FROM employees 
WHERE  Salary > 3100
ORDER BY Salary DESC;

"DESC: Significa ordenar en forma descente y 'ASC': Significa ascendente"

===================≠=====================

"Una forma mas optima y sencilla para obtener el mismo resultado"

SELECT FirstName, Salary FROM employees 
WHERE  Salary > (SELECT AVG(Salary) FROM employees) 
ORDER BY Salary DESC;

===================≠=====================

"Ayuda a Mónica a perder peso escribiendo una consulta para elegir los alimentos cuyos porcentajes de grasa son menores que el promedio de la tabla "Foods" . Entonces muestra la tabla resultante."

SELECT * FROM Foods
WHERE Fatpercentage < (SELECT AVG(Fatpercentage) FROM Foods);

==================≠=====================


SELECT * FROM employees 
WHERE FirstName LIKE 'A%';

"'LIKE'es útil cuando especificas una condición de búsqueda dentro de tu cláusula WHERE. "

"A%: Mostrar las columnas que comienzan con A"
"%A: las que terminan en A"

---

SELECT MIN(Salary) AS Salary FROM employees;

"MIN se utiliza para conocer el salario minimo de una tabla"

---

"Escribe una consulta para obtener los apartamentos cuyos precios son mayores que el promedio y además no están alquilados, ordenados por la columna 'Price'."

SELECT * FROM Apartments
WHERE Price > (SELECT AVG(Price) FROM Apartments) AND Status IN ('Not rented')
ORDER BY Price;

---

"Columnas personalizadas"

"306 abrebio las columnas y les asifno otro nombre"

SELECT pl.flight_ID, pl.FullName, fl.Landing_Country, fl.Duration
FROM pilots AS pl, flights AS fl
WHERE fl.ID=pl.flight_ID;

---

========================================

"Ayudemos a los pilotos a encontrar los detalles de sus vuelos.
Se te dan las siguientes tablas llamadas pilots y flights:

Pilots
Flights

Escribe una consulta para obtener la identificación del vuelo, el nombre completo del piloto responsable del vuelo, el país donde el vuelo aterrizará y la duración del mismo (id_vuelo, nombre completo, país de aterrizaje, duración)."

SELECT pl.flight_ID, pl.FullName, fl.Landing_Country, fl.Duration
FROM pilots AS pl, flights AS fl
WHERE fl.ID=pl.flight_ID;

========================================

"LEFT JOIN"

"Trabajas en una librería y tienes las siguientes tablas:

authors:
books:

Escribe una consulta para generar todos los autores y los libros que escribieron, en una tabla (authorname-bookname)."

SELECT authors.AuthorName, books.BookName 
FROM authors LEFT OUTER JOIN books 
ON authors.ID=books.authorid;

========================================

"RIGHT JOIN"

"La combinación RIGHT JOIN retorna todas las filas de la tabla derecha, así no haya coincidencias en la tabla izquierda."

SELECT customers.Name, items.Name FROM customers
RIGHT JOIN items ON customers.ID=items.Seller_id;

========================================

"Diriges una agencia de reparto y tienes las siguientes tablas:

customers:
orders:

Quieres ver el informe de entrega semanal. Escribe una consulta para generar todos los clientes y sus pedidos en una tabla (fullname - age - address - amount)."

SELECT customers.FullName, customers.Age, customers.Address, orders.amount FROM orders
RIGHT OUTER JOIN customers 
ON customers.ID=orders.Customerid;

========================================

"UNION"

"Para unir dos columnas deben tener el mismo tipo de dato y las columnas deben estar en el mismo orden"

SELECT ID, FirstName, LastName, City FROM First
UNION
SELECT ID, FirstName, LastName, City FROM Second;

"En caso que alguna columna no coincida se utiliza NULL es ese espacio"

========================================

"FIDE quiere celebrar un gran torneo de ajedrez y ha decidido incluir a jugadores de los torneos Norway Chess y Tata Steel.

Tabla NorwayChess:
Tabla TataSteel:

Escribe una consulta para fusionar las tablas 'NorwayChess' y 'TataSteel'. Después ordena la tabla fusionada por 'Rating' en orden descendente y muestra la tabla final de participantes.
"

SELECT Player, Country, Birthyear, Rating FROM NorwayChess
UNION
SELECT Player, Country, Birthyear, Rating FROM TataSteel
ORDER BY Rating DESC;

========================================
