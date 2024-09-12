-- Ejercicio  1: Encuentra el nombre de las pistas y los títulos de los álbumes a los que pertenecen.
select 
	t."Name" as "nombre_pista",
	a."Title" 
from "Track" t
inner join "Album" a on t."AlbumId"=a."AlbumId"

-- Ejercicio 2: Lista los nombres de los artistas y los títulos de sus álbumes. Ordena los resultados por artista.
select
	a2."Name",
	a."Title"
from 
	"Artist"as a2 
inner join 
	"Album" as a on a."ArtistId"= a2."ArtistId"
order by a2."Name";

-- Ejercicio 3: Encuentra los nombres de los clientes y los totales de sus facturas. Extrae solo los 5 clientes con mayor total. 
select
	c."FirstName",
	c."LastName",
	sum(i."Total") as "total_factura" 
from "Customer" c 
inner join "Invoice" as i
	on c."CustomerId" = i."CustomerId"
group by
	"FirstName" , "LastName" 
order by "total_factura" desc 
limit 5;

-- Ejercicio 4: Lista los nombres de los empleados y los nombres de los clientes que les han sido asignados.
select
	concat(e."FirstName", ' ', e."LastName") as "nombre_empleado", 
	concat(c."FirstName", ' ', c."LastName") as "nombre_cliente" 
from "Employee" as e
inner join "Customer" as c 
	on c."SupportRepId" = e."EmployeeId"
order by "nombre_empleado"
-- Ejercicio 5: Muestra los ID de las facturas y los nombres de las pistas incluidas en esas facturas.
select 
	il."InvoiceId",
	t."Name"
from "InvoiceLine" il 
inner join "Track" t 
	on t."TrackId" = il."TrackId"

-- Ejercicio 6: Encuentra los nombres de los artistas y los géneros de sus pistas.
select 
	a."Name" as "artista",
	t."Name" as "Cancion",
	g."Name" as "Genero"
from "Track" t 
inner join "Genre" g
	on t."GenreId" = g."GenreId"
inner join "Album" a2
	on t."AlbumId" = a2."AlbumId"
inner join "Artist" a 
	on a2."ArtistId" = a."ArtistId" 

--  Ejercicio 7: Muestra los nombres de las pistas y el tipo de medio en el que están disponibles.
select
	t."Name" as "cancion",
	mt."Name" as "tipo_medio"
from "Track" t 
inner join "MediaType" mt ON t."MediaTypeId" = mt."MediaTypeId" 

-- Ejercicio 8: Encuentra todas las pistas y, si existen, muestra los nombres de los géneros a los que pertenecen. Incluye también las pistas que no tienen un género asignado.**
select 
	t."Name" as "cancion",
	g."Name" as "genero"
from "Track" t 
left join "Genre" g 
	on t."GenreId" = g."GenreId"
order by g."Name" desc;

-- Ejercicio 9: Muestra todos los clientes y, si existen, muestra las facturas que han realizado. Incluye también los clientes que no tienen ninguna factura.
select
	concat(c."FirstName", ' ', c."LastName") as "nombre_cliente",
	i."InvoiceId" as "factura"
from "Customer" c 
left join "Invoice" i on c."CustomerId" = i."CustomerId" 


-- Ejercico 10: Encuentra todos los álbumes y, si existen, muestra los nombres de los artistas que los crearon. Incluye también los álbumes que no tienen un artista asignado (aunque en este caso en la base de datos de Chinook, todos los álbumes tienen un artista asignado).
select 
	a."Title" as "nombre_albun",
	a2."Name" as "nombre_artista"
from  "Album" a 
left join "Artist" a2 ON a."ArtistId" = a2."ArtistId" 


-- Ejercicio 11: Cuenta cuántas pistas hay en cada género. Ordena los generos en función del número de canciones de mayor a menor. 
select 
	count(t."TrackId") as "cantidad_canciones",
	g."Name"
from "Genre" g 
inner join "Track" t on g."GenreId" = t."GenreId" 
group by g."Name"
order by "cantidad_canciones" desc 

--  Ejercicio 12: Muestra los títulos de los álbumes y la duración total de todas las pistas en cada álbum.
select 
	a."Title" as "album",
	sum(t."Milliseconds"/60000) as "cantidad_minutos"
from "Album" a 
left join "Track" t ON a."AlbumId" = t."AlbumId" 
group by a."Title"
order by "cantidad_minutos" desc 

-- Ejercicio 14: Encuentra los nombres de los clientes y el total gastado por cada uno.
select
	concat(c."FirstName", ' ', c."LastName") as "nombre_cliente",
	sum (i."Total") as "total_factura"
from "Customer" as c 
left join "Invoice" as i ON c."CustomerId" = i."CustomerId" 
group by "nombre_cliente"

-- Ejercicio 15: Encuentra todos los empleados y, si existen, muestra los nombres de los clientes que tienen asignados. Incluye también los empleados que no tienen clientes asignados.
select 
	concat(e."FirstName", ' ', e."LastName") as "nombre_empleado", 
	concat(c."FirstName", ' ', c."LastName") as "nombre_cliente" 
from "Employee" e 
left join "Customer" c ON "SupportRepId" = "EmployeeId" 
order by "nombre_empleado"