create or replace PACKAGE read_centros 
AS 
  PROCEDURE buscar_centro (
  	p_cod IN CENTRO_TRABAJO.COD_CENTRO%type,
  	p_nom OUT centro_trabajo.nombre_centro%type,
  	p_calle OUT centro_trabajo.calle_centro%type,
 	p_num OUT centro_trabajo. numero_centro%type,
  	p_cod_pos OUT centro_trabajo.codigo_postal_centro%type,
  	p_ciudad OUT centro_trabajo.ciudad_centro%type,
  	p_provincia OUT centro_trabajo.provincia_centro%type,
  	p_telf OUT centro_trabajo. telefono_centro%type
	);
  PROCEDURE buscar_todos_centros (
  	p_cod OUT CENTRO_TRABAJO.COD_CENTRO%type,
  	p_nom OUT centro_trabajo.nombre_centro%type,
  	p_calle OUT centro_trabajo.calle_centro%type,
  	p_num OUT centro_trabajo. numero_centro%type,
  	p_cod_pos OUT centro_trabajo.codigo_postal_centro%type,
  	p_ciudad OUT centro_trabajo.ciudad_centro%type,
  	p_provincia OUT centro_trabajo.provincia_centro%type,
  	p_telf OUT centro_trabajo. telefono_centro%type,
	p_recordset OUT SYS_REFCURSOR
	);
END read_centros;
/    
create or replace PACKAGE BODY read_centros 
AS 
  PROCEDURE buscar_centro (
  	p_cod IN CENTRO_TRABAJO.COD_CENTRO%type,
  	p_nom OUT centro_trabajo.nombre_centro%type,
  	p_calle OUT centro_trabajo.calle_centro%type,
  	p_num OUT centro_trabajo. numero_centro%type,
  	p_cod_pos OUT centro_trabajo.codigo_postal_centro%type,
  	p_ciudad OUT centro_trabajo.ciudad_centro%type,
  	p_provincia OUT centro_trabajo.provincia_centro%type,
  	p_telf OUT centro_trabajo. telefono_centro%type
	)
  is 
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
  END buscar_centro;

  PROCEDURE buscar_todos_centros (
  	p_cod OUT CENTRO_TRABAJO.COD_CENTRO%type,
  	p_nom OUT centro_trabajo.nombre_centro%type,
  	p_calle OUT centro_trabajo.calle_centro%type,
  	p_num OUT centro_trabajo. numero_centro%type,
  	p_cod_pos OUT centro_trabajo.codigo_postal_centro%type,
  	p_ciudad OUT centro_trabajo.ciudad_centro%type,
  	p_provincia OUT centro_trabajo.provincia_centro%type,
  	p_telf OUT centro_trabajo. telefono_centro%type,
  	p_recordset OUT SYS_REFCURSOR
	)
  is 
  Begin
  OPEN p_recordset FOR
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
  END buscar_todos_centros;
END read_centros;
/
create or replace PACKAGE read_trabajadores 
AS 
  PROCEDURE buscar_trabajador (
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
	p_usuario OUT trabajador.usuario%type,
	p_contraseña OUT trabajador.contraseña%type,
	p_codcentro OUT trabajador.centro_trabajo_cod_centro%type,
	p_codcategoria OUT trabajador.categoria_codigo_categoria%type
	);
  PROCEDURE buscar_dni_trabajador (
	p_usuario IN trabajador.usuario%type,
	p_dni OUT trabajador.dni_trabajador%type
	);
  PROCEDURE buscar_todos_trabajadores (
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
	p_usuario OUT trabajador.usuario%type,
	p_contraseña OUT trabajador.contraseña%type,
	p_codcentro OUT trabajador.centro_trabajo_cod_centro%type,
	p_codcategoria OUT trabajador.categoria_codigo_categoria%type,
	p_recordset OUT SYS_REFCURSOR
	);
  PROCEDURE login (
	p_usuario IN trabajador.usuario%type,
	p_contraseña IN trabajador.contraseña%type,
	p_categoria OUT trabajador.categoria_codigo_categoria%type
	);
END read_trabajadores;
/
create or replace PACKAGE BODY read_trabajadores
AS
  PROCEDURE buscar_trabajador (
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
	p_usuario OUT trabajador.usuario%type,
	p_contraseña OUT trabajador.contraseña%type,
	p_codcentro OUT trabajador.centro_trabajo_cod_centro%type,
	p_codcategoria OUT trabajador.categoria_codigo_categoria%type
	)
  is 
  Begin
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
	usuario,
	contraseña,
	centro_trabajo_cod_centro,
	categoria_codigo_categoria
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
	p_usuario,
	p_contraseña,
	p_codcentro,
	p_codcategoria
  from trabajador	
  where dni_trabajador=p_dni;
  END buscar_trabajador;

  PROCEDURE buscar_dni_trabajador (
	p_usuario IN trabajador.usuario%type,
	p_dni OUT trabajador.dni_trabajador%type
	)
  is 
  Begin
  select dni_trabajador
  into p_dni
  from trabajador	
  where usuario=p_usuario;
  END buscar_dni_trabajador;

  PROCEDURE buscar_todos_trabajadores (
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
	p_usuario OUT trabajador.usuario%type,
	p_contraseña OUT trabajador.contraseña%type,
	p_codcentro OUT trabajador.centro_trabajo_cod_centro%type,
	p_codcategoria OUT trabajador.categoria_codigo_categoria%type,
	p_recordset OUT SYS_REFCURSOR
	)
  is 
  Begin
  OPEN p_recordset FOR
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
	usuario,
	contraseña,
	centro_trabajo_cod_centro,
	categoria_codigo_categoria
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
	p_usuario,
	p_contraseña,
	p_codcentro,
	p_codcategoria		
  from trabajador;	
  END buscar_todos_trabajadores;


  PROCEDURE login (
	p_usuario IN trabajador.usuario%type,
	p_contraseña IN trabajador.contraseña%type,
	p_categoria OUT trabajador.categoria_codigo_categoria%type
	)
  is 
  Begin
  select categoria_codigo_categoria into p_categoria
  from trabajador	
  where USUARIO=p_usuario and CONTRASEÑA =p_contraseña;
  END login;
END read_trabajadores;