--Mostrar los nombres de las empresas en las que pago el usuario x.
create function ejercicio4(@x varchar(30))
returns table
as 
begin
      declare @nom varchar(30)
	  set @nom=(select distinct e.nombre
	  from empresaRec e , PagoConsumo p,medidor m , usuario u
	  where e.code=p.coder and p.nroMed=m.nroMed and m.nroMed=u.nroMed and u.nombre=@x
	  
	  )
	  return @nom
end

select dbo.ejercicio4('Milenka');

select * from dbo.ejercicio4('Milenka');

declare @qc integer

set @qc =dbo.ejercicio4('Milenka')
print 'Las empresas son'+cast(@qc as varchar)


select * from empresaRec;
select * from PagoConsumo;
select * from  medidor;
select * from usuario;

select distinct e.nombre
	  from empresaRec e , PagoConsumo p,medidor m , usuario u
	  where e.code=p.coder and p.nroMed=m.nroMed and m.nroMed=u.nroMed and u.nombre='Milenka';


--Mostrar los meses en que mas pago el usuario x.
select * from empresaRec;
select * from PagoConsumo;
select * from  medidor;
select * from usuario;


create function ejercicio5(@x varchar (30))
returns varchar
as
begin
     declare @mes varchar(30)
	 --declare @may int=0;
	set @mes=(select p.monto
	from  PagoConsumo p,medidor m , usuario u
	where  p.nroMed=m.nroMed and m.nroMed=u.nroMed and u.nombre=@x
	)

	return @mes

end;
select * from  dbo.ejercicio5('Milenka');
--Mostrar los nombres de las empresas en las que pago el usuario x.
create function ejercicio41(@x varchar(30))
returns table
as 

return
      (select distinct e.nombre
	  from empresaRec e , PagoConsumo p,medidor m , usuario u
	  where e.code=p.coder and p.nroMed=m.nroMed and m.nroMed=u.nroMed and u.nombre=@x
	  )


select * from  dbo.ejercicio41('Milenka');



select * from empresaRec;
select * from PagoConsumo;
select * from  medidor;
select * from usuario;

--Mostrar los meses en que mas pago el usuario x.
create function ejercicio53(@x varchar (30))
returns table
as
return 

     (select p.mes
	from  PagoConsumo p,medidor m , usuario u
	where  p.nroMed=m.nroMed and m.nroMed=u.nroMed and u.nombre=@x
	)


     

select * from  dbo.ejercicio53('Milenka');




--Mostrar el monto por pagar del mex x del usuario y

create proc ejercicio9(@x varchar(30), @y varchar(30))
as
  select l.consumo
    from usuario u, medidor m , lectura l
	where l.nroMed=m.nroMed and m.nroMed=u.nroMed and l.mes=@x and u.nombre=@y


execute ejercicio9 enero , 'Milenka'
