import 'package:api_with_provider/data/api_services.dart';
import 'package:api_with_provider/models/user_model.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  final ApiServices _apiServices = ApiServices();
  bool _isLoading = false;
  List<UserModel> _users = [];

  List<UserModel> get Users => _users;
  bool get isLoading => _isLoading;

  Future<void> fetchUser() async {
    _isLoading = true;
    notifyListeners();

    try {
      _users = await _apiServices.fetchUsers();
    } catch (e) {
      print("Error : $e");
    }

    _isLoading = false;
    notifyListeners();
  }
}
