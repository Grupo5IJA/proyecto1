create or replace procedure buscar_centro (
  p_cod IN CENTRO_TRABAJO.COD_CENTRO%type,
  p_nom OUT centro_trabajo.nombre_centro%type,
  p_calle OUT centro_trabajo.calle_centro%type,
  p_num OUT centro_trabajo. numero_centro%type,
  p_cod_pos OUT centro_trabajo.codigo_postal_centro%type,
  p_ciudad OUT centro_trabajo.ciudad_centro%type,
  p_provincia OUT centro_trabajo.provincia_centro%type,
  p_telf OUT centro_trabajo. telefono_centro%type
)
as 
Begin
select NOMBRE_CENTRO, 
    calle_centro,
		numero_centro,
		codigo_postal_centro,
		ciudad_centro,
		provincia_centro,
		telefono_centro
into p_nom, 
    p_calle,
		p_num,
		p_cod_pos,
		p_ciudad,
		p_provincia,
		p_telf	
from centro_trabajo
where cod_centro=p_cod;
EXCEPTION	
 when NO_DATA_FOUND
  then raise_application_error(-20001,'No existe el centro');
  
  when others 
  then raise_application_error(-20003, SQLERRM); 
END buscar_centro;

create or replace procedure buscar_todos_centros (
  p_cod OUT CENTRO_TRABAJO.COD_CENTRO%type,
  p_nom OUT centro_trabajo.nombre_centro%type,
  p_calle OUT centro_trabajo.calle_centro%type,
  p_num OUT centro_trabajo. numero_centro%type,
  p_cod_pos OUT centro_trabajo.codigo_postal_centro%type,
  p_ciudad OUT centro_trabajo.ciudad_centro%type,
  p_provincia OUT centro_trabajo.provincia_centro%type,
  p_telf OUT centro_trabajo. telefono_centro%type
)
as 
Begin
select COD_CENTRO, 
    NOMBRE_CENTRO, 
    calle_centro,
		numero_centro,
		codigo_postal_centro,
		ciudad_centro,
		provincia_centro,
		telefono_centro
into p_cod, 
    p_nom, 
    p_calle,
		p_num,
		p_cod_pos,
		p_ciudad,
		p_provincia,
		p_telf	
from centro_trabajo;

EXCEPTION	
 when NO_DATA_FOUND
  then raise_application_error(-20001,'No existe ningún centro');
  
  when others 
  then raise_application_error(-20003, SQLERRM); 
END buscar_todos_centros;


create or replace procedure buscar_trabajador (
p_dni IN trabajador.dni_trabajador%type,
p_nom OUT trabajador.nombre_trabajador%type,
p_apellido1 OUT trabajador.apellido1_trabajador%type,
p_apellido2 OUT trabajador.apellido2_trabajador%type,
p_calle OUT trabajador.calle_trabajador%type,
p_portal OUT trabajador.portal_trabajador%type,
p_piso OUT trabajador.piso_trabajador%type,
p_mano OUT trabajador.mano_trabajador%type,
p_telf_per OUT trabajador.telefono_personal_trabajador%type,
p_telf_empre OUT trabajador.telefono_empresa_trabajador%type,
p_salario OUT trabajador.salario_trabajador%type,
p_fec_naci OUT trabajador.fecha_nacimiento_trabajador%type,
p_usuario OUT trabajador.usuario%type
)
as
BEGIN
select nombre_trabajador, 
		apellido1_trabajador,
		apellido2_trabajador,
		calle_trabajador, 
		portal_trabajador,
		piso_trabajador,
		mano_trabajador,
		telefono_personal_trabajador,
		telefono_empresa_trabajador,
		salario_trabajador,
		fecha_nacimiento_trabajador,
		usuario
into p_nom,
    p_apellido1,
		p_apellido2,
		p_calle,
		p_portal,
		p_piso,
		p_mano,
		p_telf_per,
		p_telf_empre,
		p_salario,
		p_fec_naci,
		p_usuario
from trabajador	
where dni_trabajador=p_dni;

EXCEPTION
  when NO_DATA_FOUND
  then raise_application_error(-20001,'No existe el trabajador');
  
  when others 
  then raise_application_error(-20003, SQLERRM); 
END buscar_trabajador;

create or replace procedure buscar_todos_trabajadores (
p_dni OUT trabajador.dni_trabajador%type,
p_nom OUT trabajador.nombre_trabajador%type,
p_apellido1 OUT trabajador.apellido1_trabajador%type,
p_apellido2 OUT trabajador.apellido2_trabajador%type,
p_calle OUT trabajador.calle_trabajador%type,
p_portal OUT trabajador.portal_trabajador%type,
p_piso OUT trabajador.piso_trabajador%type,
p_mano OUT trabajador.mano_trabajador%type,
p_telf_per OUT trabajador.telefono_personal_trabajador%type,
p_telf_empre OUT trabajador.telefono_empresa_trabajador%type,
p_salario OUT trabajador.salario_trabajador%type,
p_fec_naci OUT trabajador.fecha_nacimiento_trabajador%type,
p_usuario OUT trabajador.usuario%type
)
as
BEGIN
select dni_trabajador,
    nombre_trabajador, 
		apellido1_trabajador,
		apellido2_trabajador,
		calle_trabajador, 
		portal_trabajador,
		piso_trabajador,
		mano_trabajador,
		telefono_personal_trabajador,
		telefono_empresa_trabajador,
		salario_trabajador,
		fecha_nacimiento_trabajador,
		usuario
into p_dni, 
    p_nom,
		p_apellido1,
		p_apellido2,
		p_calle,
		p_portal,
		p_piso,
		p_mano,
		p_telf_per,
		p_telf_empre,
		p_salario,
		p_fec_naci,
		p_usuario
		
from trabajador;	

EXCEPTION
  when NO_DATA_FOUND
  then raise_application_error(-20001,'No existe ningún trabajador');
  
  when others 
  then raise_application_error(-20003, SQLERRM); 
END buscar_todos_trabajadores;


create or replace procedure login (
p_usuario IN trabajador.usuario%type,
p_contraseña IN trabajador.contraseña%type,
p_num OUT INTEGER
)
as
BEGIN
select count(*) into p_num
from trabajador	
where USUARIO=p_usuario and CONTRASEÑA =p_contraseña;

EXCEPTION
  when NO_DATA_FOUND
  then raise_application_error(-20001,'Usuario no existe o contraseña incorrecta');
  
  when others 
  then raise_application_error(-20003, SQLERRM); 
END login;
