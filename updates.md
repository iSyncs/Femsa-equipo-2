# Updates

## 2026-08-11 - Arranque del repositorio

### Logrado

- Se creo la estructura inicial del repositorio `Femsa-equipo-2`.
- Se agrego el documento base de vision y alcance en `docs/`.
- Se genero una sintesis inicial del contexto del proyecto.
- Se delimito el alcance del equipo a ejecucion, cierre y seguimiento.
- Se creo un primer modelo DBML para trabajar en dbdiagram.io.
- Se propuso una estrategia inicial de versionado por releases.

### Planeado

- Revisar el video explicativo de la pagina actual cuando este disponible.
- Incorporar la imagen ER compartida por el equipo cuando este disponible en el workspace.
- Comparar el modelo inicial contra las tablas dadas por el profesor/equipo.
- Ajustar nombres de entidades y relaciones segun convenciones acordadas.
- Definir reglas de negocio por estado: auditoria, hallazgo, plan de accion y cierre.
- Definir que tablas pertenecen al alcance del equipo y cuales seran integraciones con otros equipos.
- Crear releases conforme el modelo vaya madurando.

### Decisiones iniciales

- El repositorio no incluye stack tecnologico todavia.
- La UI no se disenara en esta etapa.
- El modelo de datos se escribira primero en DBML para facilitar su uso en dbdiagram.io.
- El equipo se enfocara en datos y reglas de ejecucion, cierre y seguimiento.

## 2026-08-11 - Simplificacion del modelo inicial

### Logrado

- Se redujo el DBML inicial a 7 tablas para que sea mas manejable en esta etapa.
- Se mantuvo el enfoque en ejecucion, cierre y seguimiento.
- Se dejo `planes_accion` con campos basicos de seguimiento para evitar crear tablas extra prematuramente.
- Se actualizo el SQL inicial para reflejar el mismo modelo simple.

### Planeado

- Validar las 7 tablas contra la imagen ER original del equipo.
- Decidir en conjunto que campos debe tener cada tabla.
- Agregar relaciones o tablas nuevas solo cuando el equipo las justifique para un siguiente release.

## 2026-08-11 - Version inicial oficial

### Logrado

- Se definio el modelo simplificado actual como `v1.0.0`.
- Se dejaron las 7 tablas como punto de partida oficial del proyecto.
- Se eliminaran las versiones previas `v0.1.0` y `v0.1.1` para evitar confusion.
