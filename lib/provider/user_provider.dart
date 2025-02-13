// providers/user_provider.dart
import 'package:flutter/material.dart';
import 'package:mi_data/models/user_models.dart';
import '../services/api_service.dart';

class UserProvider with ChangeNotifier {
  List<User> _users = [];
  List<User> _localUsers = [];
  bool _isLoading = false;

  List<User> get users => _users;
  List<User> get localUsers => _localUsers;
  bool get isLoading => _isLoading;

  final ApiService _apiService = ApiService();

  Future<void> fetchUsers() async {
    _isLoading = true;
    notifyListeners();

    try {
      _users = await _apiService.fetchUsers();
    } catch (e) {
      print(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void saveLocalUser(User user) {
    _localUsers.add(user);
    notifyListeners();
  }

  void deleteLocalUser(User user) {
    _localUsers.remove(user);
    notifyListeners();
  }
}