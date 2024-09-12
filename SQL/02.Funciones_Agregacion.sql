/* MIN y MAX */
-- Ejercicio 1: Encontrar la duración mínima de las pistas en milisegundos.
select
	min("Milliseconds") as "duracion_min"
from "Track" t ;
-- Ejercicio 2: Encontrar la duración máxima de las pistas en milisegundos.
select
	max("Milliseconds") as "duracion_max"
from "Track" t ;

-- Ejercicio 3: Encontrar el precio mínimo de las pistas.
select min("UnitPrice") as "precio_min" 
from "Track" t ;

-- Ejercicio 4: Encontrar el precio máximo de las pistas.
select max("UnitPrice") as "precio_max" 
from "Track" t ;   

-- Ejercicio 5: Encontrar la fecha mínima de la factura.
select min("InvoiceDate") as "fecha_min_de_la_factura"
from "Invoice" i ;

-- Ejercicio 6: Encontrar la fecha máxima de la factura.
select max("InvoiceDate") as "fecha_max_de_la_factura"
from "Invoice" i ;   

/* COUNT y SUM */
-- Ejercicio 7: Contar el número total de pistas.
select count("TrackId") as "Total_pistas"
from "Track" t ;

-- Ejercicio 8: Contar el número de clientes en Brasil.
select count("CustomerId") as "Clientes_brasil"
from "Customer" c 
where "Country" = 'Brazil';

-- Ejercicio 9: Sumar la duración total de todas las pistas en milisegundos.
select sum("Milliseconds") as "duracion_total_en_milisegundos" 
from "Track" t ;

-- Ejercicio 10: Contar el número de empleados con el título 'Sales Support Agent'.
select count("Title") as "total_Sales_support_agent" 
from "Employee" e 
where "Title" = 'Sales Support Agent';

-- Ejercicio 11: Sumar el total de las cantidades en las facturas.
select sum("Total") as "total_facturacion" 
from "Invoice" i ;

/* AVG, STDDEV, VARIANCE */

-- Ejercicio 12: Calcular la duración media de las pistas en milisegundos.
select round(avg("Milliseconds"),2) as "duracion_media"
from "Track" t ;

-- Ejercicio 13: Calcular el precio medio de las pistas.
select round(avg("UnitPrice"),2) as "Precio_medio"
from "Track" t ;   

-- Ejercicio 14: Calcular la desviación estándar de la duración de las pistas.
select round(stddev("Milliseconds"),2) as "desvStandar_milliseconds"
from "Track" t ;     

-- Ejercicio 15: Calcular la varianza de la duración de las pistas.
select round(variance("Milliseconds"),2) as "varianza_milliseconds"
from "Track" t ;

-- Ejercicio 16: Calcular la desviación estándar del precio de las pistas.
select round(stddev ("UnitPrice"),2) as "Precio_desvStandar"
from "Track" t ;

/* CONCAT */
-- Ejercicio 17: Concatenar el nombre y el apellido de los clientes.
select 
	concat("FirstName", ' ', "LastName") 
from "Customer" c ;

