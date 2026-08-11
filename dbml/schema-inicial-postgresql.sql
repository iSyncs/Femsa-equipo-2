-- FEMSA Auditoria - Equipo 2
-- Alcance inicial: ejecucion, cierre y seguimiento
-- SQL simple derivado del DBML inicial de 7 tablas.

create type auditoria_estado as enum ('pendiente', 'en_ejecucion', 'en_cierre', 'cerrada');
create type hallazgo_estado as enum ('abierto', 'en_plan_accion', 'en_seguimiento', 'cerrado');
create type plan_estado as enum ('pendiente', 'en_progreso', 'vencido', 'completado', 'validado');

create table usuarios (
  id uuid primary key,
  nombre varchar(150) not null,
  correo varchar(180) not null unique,
  rol varchar(80) not null,
  area varchar(150),
  activo boolean not null default true
);

create table auditorias (
  id uuid primary key,
  codigo varchar(50) not null unique,
  nombre varchar(200) not null,
  unidad_negocio varchar(150),
  proceso varchar(150),
  responsable_id uuid not null references usuarios(id),
  estado auditoria_estado not null default 'pendiente',
  fecha_inicio date,
  fecha_fin date
);

create table controles (
  id uuid primary key,
  codigo varchar(50) not null unique,
  nombre varchar(200) not null,
  descripcion text,
  riesgo_asociado varchar(200),
  responsable_id uuid references usuarios(id)
);

create table auditoria_controles (
  id uuid primary key,
  auditoria_id uuid not null references auditorias(id),
  control_id uuid not null references controles(id),
  auditor_id uuid references usuarios(id),
  resultado_diseno varchar(80),
  resultado_efectividad varchar(80),
  conclusion text
);

create table hallazgos (
  id uuid primary key,
  auditoria_id uuid not null references auditorias(id),
  control_id uuid references controles(id),
  titulo varchar(200) not null,
  descripcion text not null,
  severidad varchar(50),
  estado hallazgo_estado not null default 'abierto',
  responsable_id uuid references usuarios(id),
  fecha_identificacion date
);

create table evidencias (
  id uuid primary key,
  auditoria_id uuid not null references auditorias(id),
  control_id uuid references controles(id),
  hallazgo_id uuid references hallazgos(id),
  nombre_archivo varchar(255) not null,
  url_archivo text,
  cargado_por_id uuid not null references usuarios(id),
  fecha_carga timestamp not null
);

create table planes_accion (
  id uuid primary key,
  hallazgo_id uuid not null references hallazgos(id),
  descripcion text not null,
  responsable_id uuid not null references usuarios(id),
  estado plan_estado not null default 'pendiente',
  fecha_compromiso date,
  avance_porcentaje int not null default 0,
  comentario_seguimiento text,
  fecha_ultimo_seguimiento date,
  check (avance_porcentaje between 0 and 100)
);

