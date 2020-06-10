create database servicioH2_cqjj
use jhenny;
create table Cargo
(
   codc varchar(5) not null primary key,
   nombre varchar(50), 
   descr varchar(100)
);
select * from cargo;

create table Personal
(
   codp varchar(5) not null primary key,
   nombre varchar(15), 
   paterno varchar(15),
   materno varchar(15),
   sueldo float,
   codc varchar(5),
   foreign key(codc) references cargo
);

create table Medidor
(
   nroMed int,
   fechaInstalacion datetime, 
   lugar varchar(100),
   codTec varchar(5),
   primary key(nroMed),
   foreign key(codTec) references personal
);


create table Lectura
(
    nroLec int,   
    nroMed int,
    fecha date,
    consumo int, --mt3
    mes varchar(15),
    año int,
    codT varchar(5),
    primary key(nroLec),
   foreign key(nroMed) references Medidor,
   foreign key(codt) references personal
);

create table Usuario
(
   codu varchar(5) not null primary key,
   nombre varchar(15), 
   paterno varchar(15),
   materno varchar(15),
   direccion varchar(50),
   nroMed integer,
   foreign key(nroMed) references Medidor
);

create table EmpresaRec
(
   code varchar(5) not null,
   nombre varchar(15), 
   direccion varchar(50),
   primary key(code)
);


create table PagoConsumo
(
    nroPago int,   
    nroMed int,
    fecha date,
    mes varchar(15),
    año int,
    monto float,
    codER varchar(5),
    primary key(nroPago),
    foreign key(nroMed) references Medidor,
    foreign key(codER) references empresaRec
);


SELECT * FROM CARGO;
insert into cargo values('c001','contador','Se encarga de actualizar los libros contables');
insert into cargo values('c002','tecnico','Realiza instalaciones');
insert into cargo values('c003','tecnicoRec','Recoge las lecturas');

insert into personal values('p001','Carolina','Perez','Tellez',3000,'c001');
insert into personal values('p002','Pedro','Lima','Caceres',3400,'c002');
insert into personal values('p003','Carlos','Lopez','Mendoza',4000,'c003');

SELECT * FROM Personal;
insert into medidor values(1,'1/1/2000','Calle1 San Pedro','p002');
insert into medidor values(2,'2/2/2000','Av.Carrasco Miraflores','p002');
insert into medidor values(3,'3/3/1980','Av.Peru Zona Norte','p002');

select * from lectura;
insert into lectura values(1,1,'1/1/2018',300,'enero',2018,'p003') ;
insert into lectura values(2,1,'1/2/2018',600,'febrero',2018,'p003') ;
insert into lectura values(3,1,'1/3/2018',500,'marzo',2018,'p003') ;
insert into lectura values(4,1,'3/20/2018',1300,'abril',2018,'p003') ;


insert into lectura values(5,2,'1/1/2018',900,'enero',2018,'p003') ;
insert into lectura values(6,2,'1/2/2018',1600,'febrero',2018,'p003') ;
insert into lectura values(7,2,'1/3/2018',2500,'marzo',2018,'p003') ;
insert into lectura values(8,2,'3/20/2018',3300,'abril',2018,'p003') ;

insert into lectura values(9,3,'1/1/2018',967,'enero',2018,'p003') ;
insert into lectura values(10,3,'1/2/2018',530,'febrero',2018,'p003') ;
insert into lectura values(11,3,'1/3/2018',6700,'marzo',2018,'p003') ;
insert into lectura values(12,3,'3/20/2018',3660,'abril',2018,'p003') ;


insert into usuario values('u001','Milenka','Llanos','Torrico','Calle Sararia No.2',1) ;
insert into usuario values('u002','Miguel','Prado','Osuna','Calle Pichincha No.90',2) ;
insert into usuario values('u003','Tatiana','Parraga','Chavez','Av. Kollasuyu N.44',3) ;

select * from USUARIO;
insert into empresarec values('e001','Banco Sol','San Pedro') ;
insert into empresarec values('e002','Banco Mercantil','Av. Camacho') ;
insert into empresarec values('e003','Prodem','Sopocachi') ;
insert into empresarec values('e004','MutualLaPrimera','Prado') ;
insert into empresarec values('e005','Fortaleza','Av.6Agosto') ;

SELECT * FROM empresarec;
insert into pagoConsumo values(78,1,'1/11/2018','enero',2018,500,'e001');
insert into pagoConsumo values(79,2,'1/21/2018','enero',2018,700,'e004');
insert into pagoConsumo values(80,3,'1/13/2018','enero',2018,400,'e002');
insert into pagoConsumo values(81,2,'2/21/2018','febrero',2018,400,'e002');
insert into pagoConsumo values(82,1,'2/14/2018','febrero',2018,400,'e002');
insert into pagoConsumo values(83,3,'2/21/2018','febrero',2018,400,'e002');
insert into pagoConsumo values(84,1,'3/13/2018','marzo',2018,800,'e001');
insert into pagoConsumo values(85,3,'4/21/2018','abril',2018,400,'e001');
insert into pagoConsumo values(86,2,'4/11/2018','abril',2018,400,'e005');