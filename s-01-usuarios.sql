--@Autor:           Martínez Ortiz Saúl Axel, Padilla Herrera Carlos Ignacio
--@Fecha creación:  2021-12-08
--@Descripción:     Creación de entidades
-- mp

--conectarse como sysdba
connect sys as sysdba

-- crear o reemplazar el directorio img_dir en /tmp/img
create or replace directory img_dir as '/tmp/img';

--Prompt para la creación del usuario admin
prompt creando usuario admin

--Crear el usuario mp_proy_admin con la contraseña mp
create user mp_proy_admin identified by mp

-- dar cuota ilimitada en la tabla users
quota unlimited on users;

--Prompt para la creación del usuario invitado
prompt creando usuario invitado

-- Crear el usuario invitado con la contraseña mp
create user mp_proy_invitado identified by mp;

-- Dar quota de 1024 MB en la tabla users
-- quota 1024m on users;

-- Prompt para la creación del rol administrador
prompt Crear rol admin

-- Crear el rol admin
create role rol_admin;

-- Conceder permiso para crear una sesión al rol admin
grant create session to rol_admin;

--Conceder permisos para crear tablas, vistas, sinónimos públicos, sinónimos,
--triggers, scuencias y procedimientos al rol rol_admin
grant create table, create view, create public synonym, create synonym, create trigger,

create sequence, create procedure to rol_admin;

-- Conceder permisos de lectura y escritura en el directorio img_dir al usuario
-- mp_proy_admin
grant read, write on directory img_dir to mp_proy_admin;

-- prompt para la creación del rol invitado
prompt crear rol invitado

-- Crear el rol invitado
create role rol_invitado;

-- Conceder permiso para crear una sesión al rol_invitado
grant create session to rol_invitado;

-- Prompt para la asignación de roles
prompt asignar roles

-- Asignar el rol rol_admin al usuario mp_proy_admin
grant rol_admin to mp_proy_admin;

-- Asignar el rol invitado al usuario mp_proy_invitado
grant rol_invitado to mp_proy_invitado;

-- Prompt para el final del script s-01-usuarios.sql
prompt terminando script s-01-usuarios.sql
