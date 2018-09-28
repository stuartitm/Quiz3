CREATE TABLESPACE quiz_manana
DATAFILE 'quiz1.dbf' size 30M,
'quiz2.dbf' size 30M,
'quiz3.dbf' size 30M;

CREATE PROFILE estudiante_quiz LIMIT 
IDLE_TIME                        15;

CREATE USER carlos_2
IDENTIFIED BY carlos_2
DEFAULT TABLESPACE quiz_manana
QUOTA UNLIMITED ON quiz_manana
PROFILE estudiante_quiz; 

GRANT CONNECT, CREATE TABLE TO carlos_2;

CREATE USER user2
IDENTIFIED BY user2
DEFAULT TABLESPACE quiz_manana
QUOTA UNLIMITED ON quiz_manana
PROFILE estudiante_quiz; 

GRANT CONNECT TO user2;

create table icfes (
	tipo_documento 	varchar2(255),
	nacionalidad		varchar2(255),
	genero					varchar2(255),
	fecha_nacimiento	date,
	periodo					varchar2(255),
	consecutivo			varchar2(255),
	departamento_residencia	varchar2(255),
	codigo_departamento_residencia	integer,
	municipio_residencia		varchar2(255),
	codigo_municipio_residencia	varchar2(255),
	estrato					varchar2(255),
	educacion_padre	varchar2(255),
	educacion_madre	varchar2(255),
	tiene_internet	varchar2(255),
	tiene_tv				varchar2(255),
	tiene_lavadora	varchar2(255),
	tiene_horno_micro_o_gas	varchar2(255),
	tiene_automovil	varchar2(255),
	tiene_motocicleta	varchar2(255),
	tiene_consola_videojuegos	varchar2(255),
	colegio_codigo_icfes	varchar2(255),
	colegio_codigo_dane		varchar2(255),
	colegio_nombre				varchar2(255),
	puntaje_lectura_critica	integer,
	puntaje_matematicas		integer,
	puntaje_ciencias_naturales	integer,
	puntaje_sociales			integer,
	puntaje_ingles				integer,
	desempeno_ingles			varchar2(255),
	puntaje_global				integer
);

GRANT SELECT ON icfes TO user2;

SELECT genero, fecha_nacimiento, consecutivo, municipio_residencia, puntaje_global 
  FROM (SELECT genero, fecha_nacimiento, consecutivo, municipio_residencia, puntaje_global 
          FROM ICFES   
          ORDER BY fecha_nacimiento ASC
        ) 
  WHERE rownum = 1;
  
SELECT genero, fecha_nacimiento, consecutivo, municipio_residencia, puntaje_global 
  FROM ICFES WHERE desempeno_ingles = 'B1';
  
SELECT colegio_nombre, COUNT(*) AS Cantidad_estudiantes FROM ICFES GROUP BY colegio_nombre;

SELECT municipio_residencia, COUNT(*) as Cantidad_estudiantes 
  FROM ICFES 
  WHERE municipio_residencia = 'PASTO'
  GROUP BY municipio_residencia;


