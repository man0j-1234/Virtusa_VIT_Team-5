// lib/providers/auth_provider.dart
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../services/auth_service.dart';

final _secureStorage = FlutterSecureStorage();

class AuthProvider extends ChangeNotifier {
  String? _token;
  bool _isLoading = false;

  String? get token => _token;
  bool get isLoading => _isLoading;
  bool get isAuthenticated => _token != null && _token!.isNotEmpty;

  AuthProvider() {
    _loadToken();
  }

  Future<void> _loadToken() async {
    _token = await _secureStorage.read(key: 'auth_token');
    notifyListeners();
  }

  // Save token expects a string
  Future<void> _saveTokenString(String token) async {
    _token = token;
    await _secureStorage.write(key: 'auth_token', value: token);
    notifyListeners();
  }

  // Helper to accept either a String token or a Map response
  String _extractToken(dynamic response) {
    if (response == null) return '';
    if (response is String) return response;
    if (response is Map<String, dynamic>) {
      // common key names: 'token' or 'accessToken'
      if (response.containsKey('token')) return response['token'].toString();
      if (response.containsKey('accessToken'))
        return response['accessToken'].toString();
      // fallback: if the map itself is the token string (rare)
      return response.toString();
    }
    return response.toString();
  }

  Future<void> login(String username, String password) async {
    _isLoading = true;
    notifyListeners();
    try {
      // AuthService.login returns either Map<String,dynamic> or a String (depending on impl)
      final res = await AuthService.login(username, password);
      final extracted = _extractToken(res);
      if (extracted.isEmpty) throw Exception('No token returned from login');
      await _saveTokenString(extracted);
    } catch (e) {
      rethrow; // let UI show the error
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signup(String username, String password) async {
    _isLoading = true;
    notifyListeners();
    try {
      final res = await AuthService.signup(username, password);
      final extracted = _extractToken(res);
      if (extracted.isEmpty) throw Exception('No token returned from signup');
      await _saveTokenString(extracted);
    } catch (e) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    await _secureStorage.delete(key: 'auth_token');
    _token = null;
    notifyListeners();
  }
}
