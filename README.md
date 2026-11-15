# SaludConecta

Prototipo móvil en Flutter basado en las pantallas de referencia. Todos los perfiles, registros clínicos y permisos son datos locales de demostración; no hay conexión a servicios ni persistencia.

## Ejecutar

```sh
flutter pub get
flutter run
```

## Estructura

- `lib/features/auth`: inicio de sesión, registro y bienvenida.
- `lib/features/home`: resumen principal.
- `lib/features/history`: historial y detalle de resultados.
- `lib/features/permissions`: permisos y revisión de solicitudes.
- `lib/features/shell`: navegación inferior.
- `lib/core`: tema, colores y widgets compartidos.
