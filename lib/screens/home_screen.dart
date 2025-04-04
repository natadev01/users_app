import 'package:flutter/material.dart';
import 'user_list_screen.dart';
import 'camera_capture_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Ver usuarios'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const UserListScreen()),
                );
              },
            ),
            const SizedBox(height: 20),

            // ✅ BOTÓN NUEVO PARA CÁMARA
            ElevatedButton.icon(
              icon: const Icon(Icons.camera_alt),
              label: const Text('Tomar Foto'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const CameraCaptureScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
