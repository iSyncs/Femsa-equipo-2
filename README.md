# FEMSA Auditoria - Equipo 2

Repositorio inicial para documentar y versionar el analisis, alcance y modelo de datos del proyecto de gestion de Auditoria Interna de FEMSA.

## Enfoque del equipo

El equipo se enfocara unicamente en las etapas de:

- Ejecucion de auditorias
- Cierre de auditorias
- Seguimiento de hallazgos y planes de accion

Quedan fuera del alcance inicial del equipo, salvo integraciones o dependencias necesarias:

- Planeacion anual
- Planeacion periodica/trimestral
- Administracion completa de plataforma
- Diseno de interfaz grafica
- Seleccion final de stack tecnologico

## Contexto del proyecto

La Direccion de Auditoria Interna busca evolucionar desde Archer IRM hacia una plataforma mas robusta, escalable y orientada a datos. La solucion esperada debe soportar el ciclo end-to-end de auditoria, mejorar la colaboracion con unidades de negocio, centralizar evidencia, fortalecer trazabilidad y habilitar analitica/reportes.

El documento base se encuentra en:

- [docs/vision-y-alcance-sistema-auditoria.pdf](docs/vision-y-alcance-sistema-auditoria.pdf)

La sintesis de contexto viva esta en:

- [context/contexto-proyecto.md](context/contexto-proyecto.md)

## Modelo de datos inicial

El modelo DBML inicial para trabajar en dbdiagram.io esta en:

- [dbml/femsa-auditoria-ejecucion-cierre-seguimiento.dbml](dbml/femsa-auditoria-ejecucion-cierre-seguimiento.dbml)

Por ahora se mantiene una version simplificada con 7 tablas:

- `usuarios`
- `auditorias`
- `controles`
- `auditoria_controles`
- `evidencias`
- `hallazgos`
- `planes_accion`

El objetivo es validar primero la estructura general. En futuros releases se podran separar tablas como roles, unidades de negocio, seguimientos, aprobaciones o bitacora si el alcance lo requiere.

Convencion inicial:

- Las llaves primarias usan `integer [primary key]`.
- Las llaves foraneas usan `integer`.
- Esta convencion se adopta para mantener consistencia con los modelos iniciales del resto del equipo.

## Versionado

El proyecto se manejara por versiones/releases. Version inicial:

- `v1.0.0`: version inicial con documentacion base, PDF, contexto y modelo DBML simplificado de 7 tablas

Proximas versiones:

- `v1.1.0`: ajustes posteriores al video explicativo y a la imagen ER del equipo
- `v1.2.0`: refinamiento de campos, relaciones y reglas de negocio

El detalle de versiones se mantendra en:

- [RELEASES.md](RELEASES.md)

## Avances

El registro de avances, decisiones y pendientes se mantendra en:

- [updates.md](updates.md)
