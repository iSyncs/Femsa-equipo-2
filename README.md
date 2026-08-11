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

## Modelo de datos

El primer modelo DBML para trabajar en dbdiagram.io esta en:

- [dbml/femsa-auditoria-ejecucion-cierre-seguimiento.dbml](dbml/femsa-auditoria-ejecucion-cierre-seguimiento.dbml)

## Versionado

El proyecto se manejara por versiones/releases. Propuesta inicial:

- `v0.1.0`: documentacion base, alcance y modelo inicial
- `v0.2.0`: ajustes posteriores al video explicativo y retroalimentacion del equipo
- `v0.3.0`: refinamiento del modelo ER y reglas de negocio
- `v1.0.0`: version estable del alcance de ejecucion, cierre y seguimiento

El detalle de versiones se mantendra en:

- [RELEASES.md](RELEASES.md)

## Avances

El registro de avances, decisiones y pendientes se mantendra en:

- [updates.md](updates.md)
