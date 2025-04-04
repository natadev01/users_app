
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:users_app/services/api_service.dart';
import 'package:users_app/utils/cache_manager.dart';
import '../models/user.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  late Future<List<User>> _futureUsers;
  List<User> _users = [];
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _futureUsers = _loadUsers();
  }

  Future<List<User>> _loadUsers() async {
    try {
      final users = await ApiService.fetchUsers();
      for (var user in users) {
        final response = await http.get(Uri.parse(user.avatar));
        user.avatarBase64 = base64Encode(response.bodyBytes);
      }
      await CacheManager.saveUsers(jsonEncode(users.map((u) => u.toJson()).toList()));
      _users = users;
      return users;
    } catch (_) {
      final cached = await CacheManager.loadCachedUsers();
      if (cached != null) {
        final List<dynamic> cachedList = jsonDecode(cached);
        _users = cachedList.map((json) => User.fromJson(json)).toList();
        return _users;
      } else {
        throw Exception('Sin conexión y sin datos almacenados.');
      }
    }
  }

  List<User> _filteredUsers() {
    if (_searchQuery.isEmpty) return _users;
    return _users.where((u) {
      final fullName = '${u.firstName} ${u.lastName}'.toLowerCase();
      return fullName.contains(_searchQuery.toLowerCase());
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Usuarios')),
      body: FutureBuilder<List<User>>(
        future: _futureUsers,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No se encontraron usuarios.'));
          }

          final users = _filteredUsers();
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'Buscar por nombre',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                    });
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];
                    final image = user.avatarBase64 != null
                        ? MemoryImage(base64Decode(user.avatarBase64!))
                        : NetworkImage(user.avatar) as ImageProvider;

                    return Center(
                      child: Card(
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(16),
                          leading: CircleAvatar(backgroundImage: image),
                          title: Text('${user.firstName} ${user.lastName}'),
                          subtitle: Text(user.email),
                          onTap: () {
                            Navigator.pushNamed(context, '/details', arguments: user);
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
