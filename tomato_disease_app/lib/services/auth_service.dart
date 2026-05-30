import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String _usersKey = 'users';
  static const String _loggedInKey = 'logged_in_user';

  // Register a new user
  static Future<Map<String, dynamic>> register({
    required String name,
    required String phone,
    required String password,
    required String village,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    final usersJson = prefs.getString(_usersKey);
    Map<String, dynamic> users = usersJson != null ? jsonDecode(usersJson) : {};

    if (users.containsKey(phone)) {
      return {'success': false, 'message': 'Phone number already registered!'};
    }

    users[phone] = {
      'name': name,
      'phone': phone,
      'password': password,
      'village': village,
      'createdAt': DateTime.now().toIso8601String(),
    };

    await prefs.setString(_usersKey, jsonEncode(users));
    return {'success': true, 'message': 'Registration successful!'};
  }

  // Login user
  static Future<Map<String, dynamic>> login({
    required String phone,
    required String password,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    final usersJson = prefs.getString(_usersKey);
    if (usersJson == null) {
      return {'success': false, 'message': 'No account found. Please register first.'};
    }

    Map<String, dynamic> users = jsonDecode(usersJson);

    if (!users.containsKey(phone)) {
      return {'success': false, 'message': 'Phone number not registered!'};
    }

    final user = users[phone];
    if (user['password'] != password) {
      return {'success': false, 'message': 'Incorrect password!'};
    }

    await prefs.setString(_loggedInKey, jsonEncode(user));
    return {'success': true, 'message': 'Login successful!', 'user': user};
  }

  // Get currently logged in user
  static Future<Map<String, dynamic>?> getLoggedInUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString(_loggedInKey);
    if (userJson == null) return null;
    return jsonDecode(userJson);
  }

  // Logout
  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_loggedInKey);
  }

  // Check if user is logged in
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(_loggedInKey);
  }

  // getCurrentUser alias
  static Future<Map<String, dynamic>?> getCurrentUser() async {
    return await getLoggedInUser();
  }

} // ✅ THIS closing brace was missing!