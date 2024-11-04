import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoggedIn = false;
  String? _accessToken;
  String? _refreshToken;

  bool get isLoggedIn => _isLoggedIn;
  String? get accessToken => _accessToken;
  String? get refreshToken => _refreshToken;

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('https://g2g4yrx34c.execute-api.us-east-1.amazonaws.com/dev/user/login'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      final responseData = json.decode(response.body);

      if (responseData['status'] == 200) {
        final tokenData = responseData['data'];
        _accessToken = tokenData['accessToken'];
        _refreshToken = tokenData['refreshToken'];
        _isLoggedIn = true;
        
        // Save to SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('accessToken', _accessToken!);
        await prefs.setString('refreshToken', _refreshToken!);
        
        notifyListeners();
        return {
          'success': true,
          'message': responseData['MESSAGE_KEY'] ?? 'Login successful'
        };
      } else {
        return {
          'success': false,
          'message': responseData['MESSAGE_KEY'] ?? 'Login failed'
        };
      }
    } catch (e) {
      print('Login error: $e');
      return {
        'success': false,
        'message': 'Network error occurred. Please try again.'
      };
    }
  }

  Future<void> logout() async {
    _isLoggedIn = false;
    _accessToken = null;
    _refreshToken = null;
    
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    
    notifyListeners();
  }

  // Check if user is already logged in
  Future<void> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    _accessToken = prefs.getString('accessToken');
    _refreshToken = prefs.getString('refreshToken');
    _isLoggedIn = _accessToken != null;
    notifyListeners();
  }

  // Method to get current access token
  String? getAccessToken() {
    return _accessToken;
  }

  // Method to handle token refresh
  Future<bool> refreshTokens() async {
    if (_refreshToken == null) return false;
    
    try {
      // Implement your refresh token API call here
      // For now, just return false to trigger a new login
      return false;
    } catch (e) {
      print('Token refresh error: $e');
      return false;
    }
  }
}