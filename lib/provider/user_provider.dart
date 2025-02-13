import 'package:flutter/material.dart';
import 'package:mi_data/models/user_models.dart';
import 'package:mi_data/services/db_helper.dart';
import '../services/api_service.dart';


class UserProvider with ChangeNotifier {
  List<User> _users = [];
  List<User> _localUsers = [];
  bool _isLoading = false;

  List<User> get users => _users;
  List<User> get localUsers => _localUsers;
  bool get isLoading => _isLoading;

  final ApiService _apiService = ApiService();
  final DatabaseHelper _dbHelper = DatabaseHelper();

  /// Fetch users from API
  Future<void> fetchUsers() async {
    _isLoading = true;
    notifyListeners();
    print("Fetching users from API...");

    try {
      _users = await _apiService.fetchUsers();
      print("Fetched ${_users.length} users.");
    } catch (e) {
      print("Error fetching users: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Load saved users from SQLite
  Future<void> loadLocalUsers() async {
    _localUsers = await _dbHelper.getUsers();
    notifyListeners();
    print("Loaded ${_localUsers.length} users from local database.");
  }

  /// Save user to local database
  Future<void> saveLocalUser(User user) async {
    await _dbHelper.insertUser(user);
    await loadLocalUsers();
  }

  /// Delete user from local database
  Future<void> deleteLocalUser(User user) async {
    await _dbHelper.deleteUser(user.login);
    await loadLocalUsers();
  }
}
