import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraCaptureScreen extends StatefulWidget {
  const CameraCaptureScreen({super.key});

  @override
  State<CameraCaptureScreen> createState() => _CameraCaptureScreenState();
}

class _CameraCaptureScreenState extends State<CameraCaptureScreen> {
  File? _image;

  Future<void> _takePicture() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Captura de Imagen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image != null
                ? Image.file(_image!, width: 200, height: 200)
                : const Icon(Icons.camera_alt, size: 100, color: Colors.grey),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _takePicture,
              icon: const Icon(Icons.camera),
              label: const Text('Tomar Foto'),
            ),
          ],
        ),
      ),
    );
  }
}
