import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class ApiService {
  static const String baseUrl = 'https://reqres.in/api/users?page=1';

  static Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> usersJson = data['data'];
      return usersJson.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar usuarios');
    }
  }
}
