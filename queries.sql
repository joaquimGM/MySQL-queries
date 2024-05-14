SELECT apellido1, apellido2, nombre FROM persona ORDER BY apellido1, apellido2, nombre;
SELECT nombre, apellido1, apellido2 FROM persona WHERE telefono IS NULL AND tipo= "alumno";
SELECT * FROM persona WHERE fecha_nacimiento BETWEEN '1999-01-01' AND '1999-12-31' AND tipo= "alumno";
SELECT nombre FROM persona WHERE telefono IS NULL AND nif LIKE '%K'AND tipo= "profesor";
SELECT nombre FROM asignatura WHERE cuatrimestre = 1 AND id_grado = 7;
SELECT persona.apellido1, persona.apellido2, persona.nombre, departamento.nombre FROM persona JOIN profesor ON persona.id = profesor.id_profesor JOIN departamento ON profesor.id_departamento = departamento.id ORDER BY persona.apellido1, persona.apellido2, persona.nombre;
SELECT asignatura.nombre, curso_escolar.anyo_inicio, curso_escolar.anyo_fin FROM persona JOIN alumno_se_matricula_asignatura ON persona.id = alumno_se_matricula_asignatura.id_alumno JOIN asignatura ON alumno_se_matricula_asignatura.id_asignatura = asignatura.id JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id WHERE persona.nif = '26902806M';
SELECT DISTINCT departamento.nombre FROM departamento JOIN profesor ON departamento.id = profesor.id_departamento JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor JOIN grado ON asignatura.id_grado = grado.id WHERE grado.nombre = 'Grado en Ingeniería Informática (Plan 2015)';
SELECT DISTINCT persona.nombre, persona.apellido1, persona.apellido2 FROM persona Join alumno_se_matricula_asignatura ON persona.id = alumno_se_matricula_asignatura.id_alumno JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id WHERE anyo_inicio = 2018;
SELECT persona.nombre AS nombre_profesor, persona.apellido1, persona.apellido2 FROM persona LEFT JOIN profesor ON persona.id = profesor.id_profesor WHERE profesor.id_profesor IS NULL;
SELECT departamento.nombre AS nombre_departamento FROM departamento RIGHT JOIN profesor ON departamento.id = profesor.id_departamento WHERE profesor.id_departamento IS NULL;
SELECT persona.nombre, persona.apellido1, persona.apellido2 FROM persona LEFT JOIN profesor ON persona.id = profesor.id_profesor LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor WHERE asignatura.id IS NULL AND persona.tipo = 'profesor';
SELECT asignatura.nombre FROM asignatura LEFT JOIN profesor ON asignatura.id_profesor = profesor.id_profesor WHERE profesor.id_profesor IS NULL;
SELECT COUNT(*) FROM persona WHERE tipo = 'alumno';
SELECT COUNT(*) FROM persona WHERE tipo = 'alumno' AND fecha_nacimiento BETWEEN '1999-01-01' AND '1999-12-31';
SELECT departamento.nombre, COUNT(profesor.id_profesor) FROM departamento JOIN profesor ON departamento.id = profesor.id_departamento GROUP BY departamento.nombre ORDER BY COUNT(profesor.id_profesor) DESC;
SELECT g.nombre, COUNT(a.id) FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.id, g.nombre HAVING COUNT(a.id) > 40;
SELECT persona.nombre, persona.apellido1, persona.apellido2 FROM persona LEFT JOIN profesor ON persona.id = profesor.id_profesor LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor WHERE profesor.id_departamento IS NOT NULL AND asignatura.id IS NULL AND persona.tipo = 'profesor';
SELECT * FROM persona WHERE fecha_nacimiento = (SELECT MIN(fecha_nacimiento) FROM persona WHERE tipo = 'alumno');
SELECT departamento.nombre, COUNT(profesor.id_profesor)  FROM departamento  LEFT JOIN profesor ON departamento.id = profesor.id_departamento GROUP BY departamento.nombre;
SELECT nombre FROM tienda.producto;
SELECT nombre, precio FROM tienda.producto;
SELECT * FROM tienda.producto;
SELECT nombre, precio, precio * 1.07 FROM tienda.producto;
SELECT nombre AS 'Nom de producte' , precio AS Euros, FORMAT(precio * 1.07, 2) AS Dòlars FROM tienda.producto;
SELECT UPPER(nombre), precio FROM tienda.producto;
SELECT LOWER(nombre), precio FROM tienda.producto;
SELECT nombre, UPPER(LEFT(nombre, 2)) FROM tienda.fabricante;
SELECT nombre, ROUND(precio) FROM tienda.producto;
SELECT nombre, TRUNCATE(precio, 0) FROM tienda.producto;
SELECT codigo_fabricante FROM tienda.producto;
SELECT DISTINCT codigo_fabricante FROM tienda.producto;
SELECT nombre FROM tienda.fabricante ORDER BY nombre;
SELECT nombre FROM tienda.fabricante ORDER BY nombre DESC;
SELECT nombre, precio FROM tienda.producto ORDER BY nombre ASC, precio DESC;
SELECT nombre FROM tienda.fabricante LIMIT 5;
SELECT nombre FROM tienda.fabricante LIMIT 2 OFFSET 3;
SELECT nombre, precio FROM tienda.producto ORDER BY precio LIMIT 1;
SELECT nombre, precio FROM tienda.producto ORDER BY precio DESC LIMIT 1;
SELECT nombre FROM tienda.producto WHERE codigo_fabricante = 2;
SELECT producto.nombre, producto.precio, fabricante.nombre FROM tienda.producto INNER JOIN tienda.fabricante ON producto.codigo_fabricante = fabricante.codigo;
SELECT producto.nombre, producto.precio, fabricante.nombre FROM tienda.producto INNER JOIN tienda.fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY fabricante.nombre;
SELECT producto.codigo, producto.nombre, fabricante.codigo,fabricante.nombre FROM tienda.producto INNER JOIN tienda.fabricante ON producto.codigo_fabricante = fabricante.codigo;
SELECT producto.nombre, producto.precio, fabricante.nombre FROM tienda.producto INNER JOIN tienda.fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY precio LIMIT 1;
SELECT producto.nombre, producto.precio, fabricante.nombre FROM tienda.producto INNER JOIN tienda.fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY precio DESC LIMIT 1;
SELECT producto.nombre, fabricante.nombre FROM tienda.producto INNER JOIN tienda.fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Lenovo';
SELECT producto.nombre, fabricante.nombre FROM tienda.producto INNER JOIN tienda.fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Crucial' AND producto.precio > 200;
SELECT producto.nombre, fabricante.nombre FROM tienda.producto INNER JOIN tienda.fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Asus' OR fabricante.nombre = 'Hewlett-Packard' OR fabricante.nombre = 'Seagate';
SELECT producto.nombre, fabricante.nombre FROM tienda.producto INNER JOIN tienda.fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');
SELECT producto.nombre, producto.precio, fabricante.nombre FROM tienda.producto INNER JOIN tienda.fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre LIKE '%e';
SELECT producto.nombre, producto.precio, fabricante.nombre FROM tienda.producto INNER JOIN tienda.fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre LIKE '%w%';
SELECT producto.nombre, producto.precio, fabricante.nombre FROM tienda.producto INNER JOIN tienda.fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE producto.precio >= 180 ORDER BY producto.precio DESC, producto.nombre ASC;
SELECT fabricante.codigo, fabricante.nombre FROM tienda.fabricante INNER JOIN tienda.producto ON fabricante.codigo = producto.codigo_fabricante GROUP BY fabricante.codigo;
SELECT fabricante.nombre, producto.nombre FROM tienda.fabricante LEFT JOIN tienda.producto ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.codigo = producto.codigo_fabricante OR producto.codigo_fabricante IS NULL;
SELECT fabricante.nombre FROM tienda.fabricante LEFT JOIN tienda.producto ON fabricante.codigo = producto.codigo_fabricante WHERE producto.codigo_fabricante IS NULL;
SELECT producto.nombre, fabricante.nombre FROM tienda.producto, tienda.fabricante WHERE producto.codigo_fabricante = fabricante.codigo AND fabricante.nombre = 'Lenovo';
SELECT producto.* FROM tienda.producto, tienda.fabricante WHERE producto.precio = (SELECT MAX(precio) FROM tienda.producto WHERE codigo_fabricante = 2);
SELECT nombre FROM tienda.producto WHERE codigo_fabricante = 2 AND precio = (SELECT MAX(precio) FROM tienda.producto WHERE codigo_fabricante= 2);
SELECT nombre FROM tienda.producto WHERE codigo_fabricante = 3 AND precio = (SELECT MIN(precio) FROM tienda.producto WHERE codigo_fabricante= 3);
SELECT producto.nombre, producto.precio FROM tienda.producto WHERE producto.precio >= (SELECT MAX(precio) FROM tienda.producto WHERE codigo_fabricante = 2);
SELECT producto.nombre, producto.precio FROM tienda.producto WHERE codigo_fabricante = 1 AND precio > (SELECT AVG(precio) FROM tienda.producto WHERE codigo_fabricante = 1);



