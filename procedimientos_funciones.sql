CREATE TABLE CLIENTE(
        nit integer not null,
        ci varchar(15),
        paterno varchar(15),
        materno varchar(15),
        nombre_RazonSocial varchar(15),
        direccion  varchar(15),
        fono Varchar(15),
primary key(nit)
);

CREATE TABLE PRODUCTO(
        codProd varchar(15) not null,
        nombre varchar(40) not null,
        precioCpra float,
        precioVta float,
primary key(codProd)
);

CREATE TABLE EMPRESA(
        cod varchar(5) not null,
        nombre varchar(15),
        ubicacion varchar(15),
        fono Varchar(15),
        primary key(cod)
);

CREATE TABLE CONTACTO(
        ci varchar(15) not null,
        codEmp varchar(5) not null,
        paterno varchar(15),
        materno varchar(15),
        nombre varchar(15),
        fono Varchar(15),
primary key(ci,codEmp),
foreign key(codEmp) references Empresa);

CREATE TABLE CARGO(
        codCar varchar(5) not null,
        nombre varchar(40) not null,
        descr varchar(200),
primary key(codCar)
);



	CREATE TABLE EMPLEADO(
        ci varchar(15) not null,
        nombre varchar(40) not null,
        paterno varchar(15),
        materno varchar(15),
        sueldo integer,
        turno varchar(15),
        codCargo varchar(5),
primary key(ci),
foreign key(codCargo) references cargo
);

CREATE TABLE COMPRA(
        nro integer not null,
        codResp varchar(15),
        codEmp varchar(5),
        monto float,
        fecha date,
 primary key(nro),
 foreign key(codResp)REFERENCES EMPLEADO, 
 foreign key(codEmP)REFERENCES EMPRESA
);

CREATE TABLE DETALLE_COMPRA(
        nro integer not null,
	    nrod integer not null,
        codPro varchar(15),
	    cantidad integer,
	    precioc float,
        primary key(nro,nrod), 
        foreign key(nro) REFERENCES COMPRA,
        foreign key(codPro) REFERENCES PRODUCTO
);

CREATE TABLE VENTA(
        nro integer not null,
	    codCaj varchar(15),
	    nit integer,
        fecha date,
        hora varchar(5),
	    monto float,
primary key(nro),
foreign key(codCaj)REFERENCES EMPLEADO, 
foreign key(nit)REFERENCES CLIENTE
);

CREATE TABLE DETALLE_VENTA(
        nro integer not null,
	    nrod integer not null,
        codPro varchar(15),
	    cantidad integer,
	    descuento integer,
primary key(nro,nrod), 
foreign key(nro) REFERENCES VENTA,
foreign key(codPro) REFERENCES PRODUCTO
);





--CLIENTE
INSERT INTO CLIENTE VALUES(111,'id1','loza','mamani','luis','Av.Sucre','F111');
INSERT INTO CLIENTE VALUES(222,'id2','Llanos','Condori','Miraflores','Marco','F222');
INSERT INTO CLIENTE VALUES(333,'id3','Peres','Copa','Ana','C.RosGutierrez','F333');
INSERT INTO CLIENTE VALUES(777,null,null,null,'UMSA','Av. Villazon','F777');
INSERT INTO CLIENTE VALUES(888,null,null,null,'CNS','El Prado','F888')
INSERT INTO CLIENTE VALUES(999,null,null,null,'MinEducacion','Av.Principal','F999');


--PRODUCTO

INSERT INTO PRODUCTO VALUES('pr1','Nescafe',20,30);
INSERT INTO PRODUCTO VALUES('pr2','Aceite Fino',50,70);
INSERT INTO PRODUCTO VALUES('pr3','Sedal',15,25);
INSERT INTO PRODUCTO VALUES('pr4','pil 1 litro',3,6);
INSERT INTO PRODUCTO VALUES('pr5','yogourt',15,25);
INSERT INTO PRODUCTO VALUES('pr6','queso',15,25);
INSERT INTO PRODUCTO VALUES('pr7','galleta',5,7);
INSERT INTO PRODUCTO VALUES('pr8','vino',15,25);

--EMPRESA
INSERT INTO EMPRESA VALUES('e001','Pil','El Alto','ff1');
INSERT INTO EMPRESA VALUES('e002','Venado','SantaCruz','ff2');
INSERT INTO EMPRESA VALUES('e003','Aceite Fino','santaCruz','ff3');
--CONTACTO

INSERT INTO CONTACTO VALUES(123,'e001','Linares','Layme','Pedro','70623123');
INSERT INTO CONTACTO VALUES(321,'e001','Sanjines','Salinas','Jaime','70623444');
INSERT INTO CONTACTO VALUES(234,'e002','Millares','Llanos','Pablo','70623555');
INSERT INTO CONTACTO VALUES(345,'e003','Laura','Altamirano','Rogelio','70623666');
--CARGO
INSERT INTO CARGO VALUES('car01','Cajero','Atencion en cajas');
INSERT INTO CARGO VALUES('car02','Contador','Administracion de cuentas');
INSERT INTO CARGO VALUES('car03','Supervisor','Control de compras y ventas');
INSERT INTO CARGO VALUES('car04','JefeCompras','Control de compras');
--EMPLEADO
INSERT INTO EMPLEADO VALUES(789,'Murillo','Mejillones','Carlos',100,'tarde','car01');
INSERT INTO EMPLEADO VALUES(897,'Terrazas','Miranda','Miriam',100,'mañana','car01');
INSERT INTO EMPLEADO VALUES(978,'Perez','Alarcon','Clara',100,'noche','car01');
INSERT INTO EMPLEADO VALUES(567,'Quiroz','Ruiz','Miguel',500,null,'car03');
--COMPRA

INSERT INTO COMPRA VALUES(1,567,'e001',156.89,'1/1/2014');
INSERT INTO COMPRA VALUES(2,567,'e002',156.89,'2/2/2014');
INSERT INTO COMPRA VALUES(3,567,'e003',156.89,'3/3/2014');

--DETALLE_COMPRA
INSERT INTO DETALLE_COMPRA VALUES(1,1,'pr4',500,5);
INSERT INTO DETALLE_COMPRA VALUES(1,2,'pr5',300,10);
INSERT INTO DETALLE_COMPRA VALUES(1,3,'pr6',150,15);
--VENTA

INSERT INTO VENTA VALUES(1,789,111,'1/1/2014','15:00',1300);
INSERT INTO VENTA VALUES(2,897,222,'1/1/2014','17:00',100);
INSERT INTO VENTA VALUES(3,978,333,'2/1/2014','18:00',320);


--DETALLE VENTA
INSERT INTO DETALLE_VENTA VALUES(1,1,'pr1',3,0);
INSERT INTO DETALLE_VENTA VALUES(1,2,'pr2',10,0);
INSERT INTO DETALLE_VENTA VALUES(1,3,'pr3',50,0);
INSERT INTO DETALLE_VENTA VALUES(1,4,'pr4',20,0);


INSERT INTO DETALLE_VENTA VALUES(2,1,'pr4',3,0);
INSERT INTO DETALLE_VENTA VALUES(2,2,'pr5',10,0);
INSERT INTO DETALLE_VENTA VALUES(2,3,'pr3',50,0);

INSERT INTO DETALLE_VENTA VALUES(3,1,'pr1',3,0);
INSERT INTO DETALLE_VENTA VALUES(3,2,'pr2',10,0);
INSERT INTO DETALLE_VENTA VALUES(3,3,'pr3',50,0);



ALTER PROCEDURE [dbo].[japTI_sp_Facebook_ConsultarColonias]
     @Buscar_Colonia   nvarchar(100) = null
AS
BEGIN
    if @Buscar_Colonia = ''
        set @Buscar_Colonia = null

    Select
      col.COLONIA_ID                 as Colonia_ID
    , col.NOMBRE                     as Colonia
     from  Cat_Cor_Colonias          as col
     where col.ESTATUS = 'ACTIVO'
     and ((@Buscar_Colonia is null) or (col.NOMBRE collate SQL_Latin1_General_CP850_CI_AI like '%' + @Buscar_Colonia + '%'))
     order by col.NOMBRE
END
CREATE PROC dbo.probar 
AS
BEGIN
    select materno
	from cliente
	where nit='111'
END
CREATE PROC dbo.mostra1
AS
BEGIN
    select *
	from cliente
END
CREATE PROC dbo.mostrar
AS
BEGIN
    select *
	from cliente
END
select * from cargo;

select * from cliente;
select * from producto;
create procedure muestraProduct(@x varchar(40),@f datetime)
as
begin
	select p.nombre , d.cantidad
	from venta v, DETALLE_VENTA d, producto p
	where v.nro=d.nro and
	d.codPro=p.codProd and 
	v.nit=@x and v.fecha=@f
	end;

	execute muestraProduct '111','1/1/2014'

	create procedure muestraProduct1(@x varchar(40),@f datetime)
as
begin

	select p.nombre , d.cantidad
	from venta v, DETALLE_VENTA d, producto p
	where v.nro=d.nro and
	d.codPro=p.codProd and 
	v.nit=@x and v.fecha=@f 

	end;

create procedure mostrar(@x varchar(40),@f datetime)
as
begin
	select p.nombre , d.cantidad
	from venta v, DETALLE_VENTA d, producto p
	where v.nro=d.nro and
	d.codPro=p.codProd and 
	v.nit=@x and v.fecha=@f
	end;

	execute muestraProduct '111','1/1/2014'
	------------------------------------------



	create procedure muestraProduct(@x varchar(40),@f datetime)
as
begin
	select p.nombre , d.cantidad
	from venta v, DETALLE_VENTA d, producto p
	where v.nro=d.nro and
	d.codPro=p.codProd and 
	v.nit=@x and v.fecha=@f
	end;
--------------CONECTAR---------------------
--PROCEDIMIENTO
		create procedure dbo.myproc(@x varchar(40),@f datetime)
as
begin
	select p.nombre , d.cantidad
	from venta v, DETALLE_VENTA d, producto p
	where v.nro=d.nro and
	d.codPro=p.codProd and 
	v.nit=@x and v.fecha=@f
	end;
	execute muestraProduct '111','1/1/2014'
--SIN DATOS
create procedure mostrar(@x varchar(40),@f datetime)
as
begin
	select p.nombre , d.cantidad
	from venta v, DETALLE_VENTA d, producto p
	where v.nro=d.nro and
	d.codPro=p.codProd and 
	v.nit=@x and v.fecha=@f
	end;

	execute muestraProduct '111','1/1/2014'

	create procedure dbo.mostrar3(@x varchar(40),@f datetime)
as
begin
	select p.nombre , d.cantidad
	from venta v, DETALLE_VENTA d, producto p
	where v.nro=d.nro and
	d.codPro=p.codProd and 
	v.nit=@x and v.fecha=@f
	end;

	execute mostrar3 '111','1/1/2014'
--VISTA
	CREATE VIEW dbo.view2
 AS SELECT*
 FROM cargo

 select * from view2
 --FUNCION
 --crear una funcion almacenamiento para tenerminar la cantidad de compradores de producto dado
 create function  dbo.QCompradore(@producto varchar(40))
 returns integer 
 as
 begin
		DECLARE @cantProd integer
		set @cantProd=(select sum(d.cantidad)
		from DETALLE_VENTA d, producto p
		where d.codPro=p.codProd and p.nombre=@producto)
		return @cantProd
 end
 ---CON DBO
  create function  dbo.QCompradore1(@producto varchar(40))
 returns integer 
 as
 begin
		DECLARE @cantProd integer
		set @cantProd=(select sum(d.cantidad)
		from DETALLE_VENTA d, producto p
		where d.codPro=p.codProd and p.nombre=@producto)
		return @cantProd
 end
 declare @qc integer
 set @qc =dbo.QCompradore1('Nescafe')
 print 'La cantidad de compradore es '+cast(@qc as varchar)