# Contexto del proyecto

## Fuente principal

Documento: `Vision y Alcance Sistema Auditoria.pdf`

Datos relevantes del documento:

- Categoria: Consultoria de TI
- Proyecto: Ecosistema de Gestion de Datos e Insights para Auditoria Interna
- Area responsable: FEMSA
- Unidad de negocio: FEMSA Servicios
- Fecha de inicio estimada: mayo 2026
- Fecha de termino estimada: diciembre 2027
- Tipo: sistema primario
- Usuarios actuales impactados: aproximadamente 100 usuarios de Auditoria Interna y 1000 usuarios de unidades de negocio

## Vision general

FEMSA busca evolucionar su modelo operativo de Auditoria Interna mediante una plataforma tecnologica integral que sustituya o supere las capacidades actuales de Archer IRM. La plataforma debe soportar el ciclo de auditoria de extremo a extremo: planeacion, ejecucion, reporteo y seguimiento.

El objetivo principal es lograr una auditoria mas agil, confiable, trazable, colaborativa y orientada al riesgo, cumpliendo con las Normas Globales de Auditoria Interna (GIAS) y mejores practicas internacionales.

## Problemas actuales

- Archer IRM presenta limitaciones de capacidad, desempeno y escalabilidad.
- Existen riesgos operativos por inconsistencias y dependencia del proveedor.
- Hay procesos manuales y apoyo en hojas de calculo fuera de la plataforma.
- La trazabilidad entre riesgos, controles, evidencias, hallazgos y planes de accion es limitada.
- La explotacion analitica de la informacion no es suficiente para generar insights accionables.
- La expansion a mas unidades de negocio implicaria costos y riesgos adicionales con la solucion actual.

## Alcance funcional global

La solucion completa contempla:

- Planeacion anual y periodica de auditorias.
- Ejecucion de auditorias.
- Evaluacion de controles.
- Gestion de evidencias y papeles de trabajo.
- Identificacion y clasificacion de hallazgos.
- Definicion, aprobacion y seguimiento de planes de accion.
- Cierre de auditorias con aprobaciones multinivel.
- Reportes operativos y ejecutivos.
- Gestion de riesgos, controles y catalogos.
- Colaboracion con areas auditadas.
- Bitacora, seguridad, roles, integraciones y analitica.

## Alcance del equipo

El equipo se concentrara en ejecucion, cierre y seguimiento.

### Ejecucion

La etapa de ejecucion debe permitir:

- Documentar el entendimiento de procesos.
- Asignar controles a auditores.
- Evaluar controles en diseno y efectividad.
- Administrar evidencias y documentacion soporte, incluyendo archivos grandes.
- Mantener trazabilidad entre auditoria, control, riesgo, evidencia y hallazgo.
- Identificar hallazgos con tipologia, vulnerabilidad, riesgo residual y evidencia relacionada.
- Validar o rechazar planes de accion propuestos.

### Cierre

La etapa de cierre debe permitir:

- Validar criterios minimos antes de cerrar una auditoria.
- Ejecutar flujos de aprobacion multinivel.
- Registrar aprobaciones, rechazos, comentarios y posicion actual del flujo.
- Emitir informes de auditoria basados en informacion registrada.
- Bloquear o controlar cambios despues del cierre segun reglas de negocio.

### Seguimiento

La etapa de seguimiento debe permitir:

- Gestionar planes de accion derivados de hallazgos.
- Asignar responsables y fechas compromiso.
- Registrar avances, evidencias de remediacion y comentarios.
- Solicitar cambios de fecha, responsable o alcance.
- Monitorear estatus de implementacion.
- Actualizar riesgo residual cuando aplique.
- Generar alertas, notificaciones y reportes de avance.

## Requerimientos no funcionales relevantes

- Plataforma web-based.
- Soporte para al menos 300 usuarios concurrentes.
- Tiempos de respuesta menores a 300 ms en operaciones criticas bajo condiciones normales.
- Carga de pantallas principales menor a 2 segundos.
- Soporte para archivos grandes y multiples formatos.
- Autenticacion robusta, preferentemente SSO.
- Autorizacion basada en roles y segregacion de funciones.
- Cifrado en transito y en reposo.
- Bitacora auditable de accesos, cambios y acciones relevantes.
- Disponibilidad minima de 99.9% en horario laboral.
- APIs para integracion con sistemas internos y herramientas de analitica.
- Compatibilidad con Chrome, Edge y Safari.
- Soporte multi-idioma: espanol, ingles y portugues.

## Entidades clave para el modelo del equipo

- Auditoria
- Unidad de negocio
- Proceso auditado
- Usuario
- Rol
- Auditor asignado
- Riesgo
- Control
- Evaluacion de control
- Evidencia
- Hallazgo
- Plan de accion
- Actividad de seguimiento
- Solicitud de cambio
- Aprobacion
- Criterio de cierre
- Informe
- Notificacion
- Bitacora

## Opinion tecnica inicial

Para la parte de ejecucion, cierre y seguimiento, conviene modelar el sistema alrededor de trazabilidad y estados. El valor principal no esta solo en guardar auditorias, sino en poder contestar preguntas como:

- Que riesgo origino este control?
- Que evidencia soporta esta evaluacion?
- Que hallazgo salio de que control?
- Que plan de accion atiende ese hallazgo?
- Quien aprobo, rechazo o modifico cada paso?
- Que queda pendiente para cerrar una auditoria?

La base de datos debe evitar mezclar todo en una sola tabla de auditoria. Es mejor separar auditoria, asignaciones, controles, evaluaciones, evidencias, hallazgos, planes de accion y aprobaciones. Esto permite reporteo, auditoria de cambios, permisos por rol y crecimiento futuro sin rehacer el modelo.

