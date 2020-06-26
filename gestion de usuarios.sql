use callapa
create login quispe with password = '1'
create user quispe for login quispe
create login callapa with password = '1'
create user callapa for login callapa
create login ximena with password = '1'
create user ximea for login ximena

select sysusers from dual
create role gestion

grant select,insert,update (nombre,paterno,materno,sueldo,codc) on personal to gestion
deny delete on personal to gestion
grant select,insert,update (nroMed,fecha,mes,año,monto,codER) on pagoconsumo to gestion
deny delete on pagoconsumo to gestion

alter role gestion add member callapa
alter role gestion add member ximena

----

use BD_H2O
create login conta1 with password = '1'
create user conta1 for login conta1
create login conta2 with password = '1'
create user conta2 for login conta2

create role contable

grant select,insert,update (nombre,paterno,materno,sueldo,codc) on personal to contable 
deny delete on personal to contable
grant select,insert,update (nroMed,fecha,mes,año,monto,codER) on pagoconsumo to contable
deny delete on pagoconsumo to contable

alter role contable add member conta1
alter role contable ad
d member conta2