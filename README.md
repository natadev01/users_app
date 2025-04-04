# 📱 Users App - Flutter Prueba Técnica

Esta aplicación móvil fue desarrollada como parte de una prueba técnica. Permite mostrar una lista de usuarios desde una API pública, ver los detalles de cada usuario y capturar una imagen utilizando únicamente la cámara del dispositivo. Además, funciona sin conexión gracias al uso de caché.

---

## 🚀 Funcionalidades

- ✅ Pantalla de inicio con navegación a usuarios y cámara
- 👥 Lista de usuarios desde [ReqRes API](https://reqres.in/api/users)
- 🧠 Almacenamiento en caché (incluye avatares codificados en base64)
- 📩 Detalles del usuario con visualización de imagen y datos
- 📸 Captura de imagen usando solo la cámara (sin galería)
- 🔍 Filtro en tiempo real por nombre

---

## 📦 Tecnologías usadas

- Flutter 3.x
- Dart
- `http`
- `shared_preferences`
- `image_picker`
- `flutter_launcher_icons`

---

## 📲 Instalación y uso

1. Clona el repositorio o descomprime el ZIP
2. Ejecuta:

```bash
flutter pub get
flutter run
```

3. Para generar el APK:

```bash
flutter build apk --release
```

El archivo `.apk` estará en:

```build/app/outputs/flutter-apk/app-release.apk
```

---

## 📁 Estructura del proyecto

```lib/
├── main.dart
├── models/
│   └── user.dart
├── screens/
│   ├── home_screen.dart
│   ├── user_list_screen.dart
│   ├── user_detail_screen.dart
│   └── camera_capture_screen.dart
├── services/
│   └── api_service.dart
├── utils/
│   └── cache_manager.dart
```

---

## 📷 Captura de imagen

- Solo se usa la cámara (`ImageSource.camera`)
- La foto tomada se muestra en pantalla
- No hay acceso a galería por restricciones de la prueba

---

## ✨ Créditos

Desarrollado por **Natalia Polanco**  
Contacto profesional: npolanco01@gmail.com
