--5 mediante cursores llevar a dos tablas auxiliares las ventas mayores y menores
--mayor se cataloga a las ventas por encima de Xbs menores por las ventas por debajo e

create table ventas_mayores(
  nro integer not null,
  nit integer,
  fecha datetime,
  monto float
);

create table ventas_menores(
  nro integer not null,
  nit integer,
  fecha datetime,
  monto float
);


create procedure ejercicio(@x integer)
as
begin
	declare @n integer,@i integer,@f datetime, @m float
	declare c cursor
	 for select nro, nit,fecha, monto from VENTA
	 open c
	 fetch c into @n,@i,@f,@m
	 while(@@FETCH_STATUS=0)
	 begin
	 if(@m<=@x)
	 begin
		insert into ventas_menores values(@n,@i,@f,@m)
	end
	else
		begin
		    insert into ventas_mayores values(@n,@i,@f,@m)
		end
		fetch c INTO @n,@i,@f,@m
	 end
	 close c
	 deallocate c
	 end

	 
execute ejercicio 1000


select * from ventas_mayores
select * from ventas_menores


-- dadas 2 tablas de empleados con las mismas estructuras mostras los empleados 
--que no esten los empleados que no esten en la otra tabla 

select * from EMPLEADO
create table empleado1(
  id integer not null,
  nombre varchar(10),
  cargo varchar(10)
);

create table empleado2(
  id integer not null,
  nombre varchar(10),
  cargo varchar(10)
);


create procedure diferencia(@x integer)
as
begin
	declare @n integer,@i integer,@f datetime, @m float
	declare c1 cursor
	 select * from empleado1


	 open c
	 fetch c into @n,@i,@f,@m
	 while(@@FETCH_STATUS=0)
	 begin
	 if(@m<=@x)
	 begin
		insert into ventas_menores values(@n,@i,@f,@m)
	end
	else
		begin
		    insert into ventas_mayores values(@n,@i,@f,@m)
		end
		fetch c INTO @n,@i,@f,@m
	 end
	 close c
	 deallocate c
	 end

--cursor y una consultas

select * from empleado

alter procedure emplea1
as
begin
   declare @d integer,@n varchar(20),@p varchar(20),@m varchar(20),@s varchar(20),@n varchar(20)
   declare c cursor
      for select * from empleado1 where ci not in (select ci from empleado2)
	  open c
	  fetch c into @d,@n,@m,@s,@t,@g
	  while (@@FETCH_STATUS=0)
	  begin
			print @d
			print @n
			print @p
			print @m
			print @s
			print @t
			print @g

			fetch c into @d,@n,@p,@m,@s,@t,@g
	  end
	  close c
	  deallocate c
	  declare c 
	  declare c2 cursor
	   for select * from empleado1 where ci not in (select ci from empleado2)
	  open c
	  fetch c into @d,@n,@m,@s,@t,@g
	  while (@@FETCH_STATUS=0)
	  begin
			print @d
			print @n
			print @p
			print @m
			print @s
			print @t
			print @g

			fetch c into @d,@n,@p,@m,@s,@t,@g
	  end
	  close c
	  deallocate c
--ckeck con la edad
create table Competidor(
    ci int primary key,
	nombre varchar(30) not null,
	edad int,
	check (edad>15)
)

insert into Competidor values(1,'Carlos Lopes Quintanilla',30)
insert into Competidor values (2,'Carola Lopes Quintanilla',14)

select * from Competidor
--ckeck con el numero
create table Clientes(
   ci int primary key,
   nombre varchar(30) not null,
   edad int,
   FONO VARCHAR(9),
   CHECK(EDAD>15),
   CHECK(FONO LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9][0-9]')
)

INSERT INTO Clientes VALUES(1,'Monica Perez Pinilla',44,'715-02023')
insert into Clientes values (2,'Carmelita Carrion cespedes',44,'71A-02023')
