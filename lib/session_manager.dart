import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:systemapp/domain/authentication/login/login.dart';

class SessionManager {
  static const String _tokenKey = 'authToken';
  static final FlutterSecureStorage _storage = FlutterSecureStorage();

  // Save token to secure storage
  static Future<void> saveToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
  }

  // Retrieve token from secure storage
  static Future<String?> getToken() async {
    return await _storage.read(key: _tokenKey);
  }

  // Clear token from secure storage to log out
  static Future<void> clearToken() async {
    await _storage.delete(key: _tokenKey);
  }

  // Check if user is logged in
  static Future<bool> isLoggedIn() async {
    String? token = await _storage.read(key: _tokenKey);
    return token != null;
  }

  // Logout function to clear token and navigate to LoginPage
  static Future<void> logout(BuildContext context) async {
    await clearToken();
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const Loginpage()),
      (route) => false,
    );
  }
}
