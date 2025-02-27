import 'dart:convert';

import 'package:api_with_provider/models/todo_model.dart';
import 'package:api_with_provider/models/user_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  final String _baseUrl = "https://jsonplaceholder.typicode.com/";

  Future<List<UserModel>> fetchUsers() async {
    final response = await http.get(Uri.parse(_baseUrl + "users"));

    try {
      if (response.statusCode == 200) {
        List<dynamic> jsonReponse = json.decode(response.body);
        return jsonReponse.map((user) => UserModel.fromJson(user)).toList();
      } else {
        throw Exception("Failed to Load users");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // todo api call
  Future<List<TodoModel>> fetchTodo() async {
    final response = await http.get(Uri.parse(_baseUrl + "todos"));

    try {
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);
        return jsonResponse.map((todo) => TodoModel.fromJson(todo)).toList();
      } else {
        throw Exception("Failed to Load Todos");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
