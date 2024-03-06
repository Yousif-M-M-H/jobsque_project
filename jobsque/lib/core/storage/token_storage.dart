import 'package:shared_preferences/shared_preferences.dart';

class TokenStorage {
  late SharedPreferences _preferences;

  Future<void> _initPrefs() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<String?> getToken() async {
    await _initPrefs();
    return _preferences.getString('token');
  }

  Future<void> saveToken(String token) async {
    await _initPrefs();
    await _preferences.setString('token', token);
  }

  Future<int?> getUserId() async {
    await _initPrefs();
    return _preferences.getInt('user_id');
  }

  Future<void> saveUserId(int userId) async {
    await _initPrefs();
    await _preferences.setInt('user_id', userId);
  }
}
