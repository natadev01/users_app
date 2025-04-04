import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/user_list_screen.dart';
import 'screens/user_detail_screen.dart';
import 'screens/camera_capture_screen.dart';

void main() {
  runApp(const UsersApp());
}

class UsersApp extends StatelessWidget {
  const UsersApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User App',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: const Color(0xFFFF6B6B),
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFF6B6B),
          brightness: Brightness.light,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFF6B6B),
          foregroundColor: Colors.white,
          elevation: 2,
          centerTitle: true,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black87),
          bodyMedium: TextStyle(color: Colors.black54),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFFF6B6B)),
          ),
        ),
        cardTheme: CardThemeData(
          color: Colors.white,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFF6B6B),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            textStyle: const TextStyle(fontWeight: FontWeight.bold),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/list': (context) => const UserListScreen(),
        '/details': (context) => const UserDetailScreen(),
        '/camera': (context) => const CameraCaptureScreen(),
      },
    );
  }
}
