import 'package:api_with_provider/data/api_services.dart';
import 'package:api_with_provider/models/todo_model.dart';
import 'package:flutter/cupertino.dart';

class TodoProvider extends ChangeNotifier {
  final ApiServices _apiServices = ApiServices();
  List<TodoModel> _todos = [];
  bool _isLoadoing = false;

  List<TodoModel> get todos => _todos;
  bool get isLoading => _isLoadoing;

  Future<void> fetchTodos() async {
    _isLoadoing = true;
    notifyListeners();

    try {
      _todos = await _apiServices.fetchTodo();
    } catch (e) {
      print("Error : $e");
    }

    _isLoadoing = false;
    notifyListeners();
  }
}
