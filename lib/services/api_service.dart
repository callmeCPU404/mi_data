// services/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mi_data/models/user_models.dart';


class ApiService {
  final String apiUrl = 'https://api.github.com/repositories';

  Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}