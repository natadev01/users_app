import 'package:flutter/material.dart';
import '../models/user.dart';
import 'dart:convert';

class UserDetailScreen extends StatelessWidget {
  const UserDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context)?.settings.arguments as User;

    final imageProvider = user.avatarBase64 != null
        ? MemoryImage(base64Decode(user.avatarBase64!))
        : NetworkImage(user.avatar) as ImageProvider;

    return Scaffold(
      appBar: AppBar(title: const Text('Detalle del Usuario')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: imageProvider,
              ),
              const SizedBox(height: 20),
              Text(
                '${user.firstName} ${user.lastName}',
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(user.email, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 10),
              Text('ID: ${user.id}', style: const TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }
}
