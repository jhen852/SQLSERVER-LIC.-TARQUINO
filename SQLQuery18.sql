create procedure muestraProducto(@x varchar(40), @f datetime)
as
begin 
     select p.nombre, d.cantidad
	 from venta v, detalle_venta d,producto p
	 where v.nit=c.nit and d.codPro= p.codProd and 
	 v.nit=@x and v.fecha=@f
end

execute muestraProducto '111', '1/1/2014'

select * from venta
select * from detalle_venta
create procedure muestraProduct(@x varchar(40), @f datetime)
as
begin 
     select p.nombre, d.cantidad
	 from venta v, detalle_venta d,producto p
	 where v.nro = d.nro and 
	 d.codPro= p.codProd and 
	 v.nit=@x and v.fecha=@f
end

execute muestraProduct '111', '1/1/2014'

select * from venta
select * from detalle_venta

--crear un procediento almacenado para mostrar las ventas del mes  mes x
create procedure solucion(@x varchar(40))
as 
begin 
    select *
	from venta v
	where Month(fecha)=@x
end

execute solucion 1
--crear una funcion almacenada para determinar la cantidad de compradores de producto dado
create function QCompradore(@producto varchar(40))
returns integer
as
begin 
	declare @cantProd integer
	set @cantProd = (select sum(d.cantidad)
	from DETALLE_VENTA d, producto p
	where  d.codPro=p.codProd and p.nombre= @producto
	)
	return @cantProd

end


declare @qc integer

set @qc =dbo.QCompradore('Nescafe')
print 'La cantidad de compradores es '+cast(@qc as varchar)

--Mostrar la cantidad de empleados
create procedure cantida
as 
begin
   select count(*)
   from empleado
end
execute cantida
print 'La cantidad es '+cantid

select * from empleado;