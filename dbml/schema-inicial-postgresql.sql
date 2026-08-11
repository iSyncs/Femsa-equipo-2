-- FEMSA Auditoria - Equipo 2
-- Alcance: ejecucion, cierre y seguimiento
-- SQL inicial derivado del modelo DBML.

create type auditoria_estado as enum ('programada', 'en_ejecucion', 'en_revision', 'en_cierre', 'cerrada', 'cancelada');
create type evaluacion_resultado as enum ('efectivo', 'parcialmente_efectivo', 'no_efectivo', 'no_aplica');
create type hallazgo_severidad as enum ('baja', 'media', 'alta', 'critica');
create type hallazgo_estado as enum ('identificado', 'en_validacion', 'confirmado', 'descartado', 'con_plan', 'en_seguimiento', 'remediado', 'cerrado');
create type plan_estado as enum ('propuesto', 'en_revision', 'aprobado', 'rechazado', 'en_progreso', 'vencido', 'implementado', 'validado', 'cerrado');
create type aprobacion_estado as enum ('pendiente', 'aprobado', 'rechazado', 'devuelto');
create type solicitud_cambio_estado as enum ('pendiente', 'aprobada', 'rechazada', 'cancelada');
create type evidencia_tipo as enum ('documento', 'hoja_calculo', 'imagen', 'correo', 'enlace', 'otro');

create table unidades_negocio (
  id uuid primary key,
  nombre varchar(150) not null unique,
  pais varchar(80),
  activa boolean not null default true,
  created_at timestamp not null,
  updated_at timestamp not null
);

create table procesos (
  id uuid primary key,
  unidad_negocio_id uuid not null references unidades_negocio(id),
  nombre varchar(180) not null,
  descripcion text,
  activo boolean not null default true,
  created_at timestamp not null,
  updated_at timestamp not null,
  unique (unidad_negocio_id, nombre)
);

create table usuarios (
  id uuid primary key,
  nombre varchar(160) not null,
  email varchar(180) not null unique,
  puesto varchar(120),
  unidad_negocio_id uuid references unidades_negocio(id),
  activo boolean not null default true,
  created_at timestamp not null,
  updated_at timestamp not null
);

create table roles (
  id uuid primary key,
  nombre varchar(80) not null unique,
  descripcion text
);

create table usuario_roles (
  usuario_id uuid not null references usuarios(id),
  rol_id uuid not null references roles(id),
  created_at timestamp not null,
  primary key (usuario_id, rol_id)
);

create table auditorias (
  id uuid primary key,
  codigo varchar(50) not null unique,
  titulo varchar(220) not null,
  unidad_negocio_id uuid not null references unidades_negocio(id),
  proceso_id uuid references procesos(id),
  responsable_auditoria_id uuid not null references usuarios(id),
  estado auditoria_estado not null default 'programada',
  objetivo text,
  alcance text,
  fecha_inicio_plan date,
  fecha_fin_plan date,
  fecha_inicio_real date,
  fecha_fin_real date,
  created_at timestamp not null,
  updated_at timestamp not null
);

create table auditoria_auditores (
  id uuid primary key,
  auditoria_id uuid not null references auditorias(id),
  usuario_id uuid not null references usuarios(id),
  rol_en_auditoria varchar(100) not null,
  horas_presupuestadas numeric(10,2),
  horas_registradas numeric(10,2) not null default 0,
  asignado_at timestamp not null,
  unique (auditoria_id, usuario_id)
);

create table riesgos (
  id uuid primary key,
  codigo varchar(50) not null unique,
  nombre varchar(220) not null,
  descripcion text,
  categoria varchar(120),
  nivel_inherente varchar(50),
  activo boolean not null default true,
  created_at timestamp not null,
  updated_at timestamp not null
);

create table controles (
  id uuid primary key,
  codigo varchar(50) not null unique,
  riesgo_id uuid not null references riesgos(id),
  proceso_id uuid references procesos(id),
  nombre varchar(220) not null,
  descripcion text,
  frecuencia varchar(80),
  propietario_id uuid references usuarios(id),
  activo boolean not null default true,
  created_at timestamp not null,
  updated_at timestamp not null
);

create table auditoria_controles (
  id uuid primary key,
  auditoria_id uuid not null references auditorias(id),
  control_id uuid not null references controles(id),
  auditor_asignado_id uuid references usuarios(id),
  incluido_en_alcance boolean not null default true,
  notas_alcance text,
  created_at timestamp not null,
  updated_at timestamp not null,
  unique (auditoria_id, control_id)
);

create table evaluaciones_control (
  id uuid primary key,
  auditoria_control_id uuid not null references auditoria_controles(id),
  evaluador_id uuid not null references usuarios(id),
  resultado_diseno evaluacion_resultado,
  resultado_efectividad evaluacion_resultado,
  modelo_madurez varchar(120),
  calificacion_madurez numeric(5,2),
  metodologia_muestreo text,
  conclusion text,
  evaluado_at timestamp,
  created_at timestamp not null,
  updated_at timestamp not null
);

create table hallazgos (
  id uuid primary key,
  auditoria_id uuid not null references auditorias(id),
  auditoria_control_id uuid references auditoria_controles(id),
  evaluacion_control_id uuid references evaluaciones_control(id),
  codigo varchar(50) not null unique,
  titulo varchar(220) not null,
  descripcion text not null,
  tipologia varchar(120),
  severidad hallazgo_severidad not null,
  vulnerabilidad varchar(120),
  riesgo_residual varchar(80),
  estado hallazgo_estado not null default 'identificado',
  identificado_por_id uuid not null references usuarios(id),
  responsable_negocio_id uuid references usuarios(id),
  fecha_identificacion date not null,
  created_at timestamp not null,
  updated_at timestamp not null
);

create table planes_accion (
  id uuid primary key,
  hallazgo_id uuid not null references hallazgos(id),
  titulo varchar(220) not null,
  descripcion text not null,
  responsable_id uuid not null references usuarios(id),
  aprobador_auditoria_id uuid references usuarios(id),
  estado plan_estado not null default 'propuesto',
  fecha_compromiso date not null,
  fecha_inicio date,
  fecha_implementacion date,
  porcentaje_avance int not null default 0,
  impacto_riesgo_residual text,
  created_at timestamp not null,
  updated_at timestamp not null,
  check (porcentaje_avance between 0 and 100)
);

create table evidencias (
  id uuid primary key,
  auditoria_id uuid not null references auditorias(id),
  auditoria_control_id uuid references auditoria_controles(id),
  evaluacion_control_id uuid references evaluaciones_control(id),
  hallazgo_id uuid references hallazgos(id),
  plan_accion_id uuid references planes_accion(id),
  cargado_por_id uuid not null references usuarios(id),
  tipo evidencia_tipo not null,
  nombre_archivo varchar(255) not null,
  uri_almacenamiento text not null,
  tamano_bytes bigint,
  hash_archivo varchar(128),
  es_confidencial boolean not null default false,
  version int not null default 1,
  descripcion text,
  created_at timestamp not null
);

create table seguimiento_planes (
  id uuid primary key,
  plan_accion_id uuid not null references planes_accion(id),
  registrado_por_id uuid not null references usuarios(id),
  estado_plan plan_estado not null,
  porcentaje_avance int not null,
  comentario text,
  fecha_reporte date not null,
  created_at timestamp not null,
  check (porcentaje_avance between 0 and 100)
);

create table solicitudes_cambio (
  id uuid primary key,
  plan_accion_id uuid references planes_accion(id),
  hallazgo_id uuid references hallazgos(id),
  solicitado_por_id uuid not null references usuarios(id),
  revisado_por_id uuid references usuarios(id),
  tipo_cambio varchar(80) not null,
  justificacion text not null,
  valor_anterior text,
  valor_solicitado text,
  estado solicitud_cambio_estado not null default 'pendiente',
  respuesta text,
  solicitado_at timestamp not null,
  revisado_at timestamp
);

create table aprobaciones (
  id uuid primary key,
  entidad_tipo varchar(80) not null,
  entidad_id uuid not null,
  nivel int not null,
  aprobador_id uuid not null references usuarios(id),
  estado aprobacion_estado not null default 'pendiente',
  comentario text,
  decidido_at timestamp,
  created_at timestamp not null
);

create index aprobaciones_entidad_idx on aprobaciones (entidad_tipo, entidad_id, nivel, aprobador_id);

create table criterios_cierre (
  id uuid primary key,
  auditoria_id uuid not null references auditorias(id),
  nombre varchar(180) not null,
  descripcion text,
  cumplido boolean not null default false,
  validado_por_id uuid references usuarios(id),
  validado_at timestamp,
  created_at timestamp not null,
  updated_at timestamp not null
);

create table informes_auditoria (
  id uuid primary key,
  auditoria_id uuid not null references auditorias(id),
  generado_por_id uuid not null references usuarios(id),
  titulo varchar(220) not null,
  version int not null default 1,
  uri_documento text,
  resumen_ejecutivo text,
  generado_at timestamp not null
);

create table notificaciones (
  id uuid primary key,
  usuario_id uuid not null references usuarios(id),
  entidad_tipo varchar(80),
  entidad_id uuid,
  titulo varchar(180) not null,
  mensaje text not null,
  leida boolean not null default false,
  enviada_at timestamp not null,
  leida_at timestamp
);

create table bitacora_auditoria (
  id uuid primary key,
  usuario_id uuid references usuarios(id),
  entidad_tipo varchar(80) not null,
  entidad_id uuid not null,
  accion varchar(120) not null,
  detalle jsonb,
  ip_origen varchar(80),
  user_agent text,
  created_at timestamp not null
);

