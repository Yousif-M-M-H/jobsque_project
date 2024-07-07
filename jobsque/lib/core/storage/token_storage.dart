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

  // New method to save job ID applied by the user
  Future<void> saveAppliedJobId(int jobId) async {
    await _initPrefs();
    List<String> appliedJobs = _preferences.getStringList('applied_jobs') ?? [];
    if (!appliedJobs.contains(jobId.toString())) {
      appliedJobs.add(jobId.toString());
      await _preferences.setStringList('applied_jobs', appliedJobs);
    }
  }

  Future<List<int>> getAppliedJobIds() async {
    await _initPrefs();
    List<String>? jobsList = _preferences.getStringList('applied_jobs');
    return jobsList?.map(int.parse).toList() ?? [];
  }

  Future<void> saveRememberMeFlag(bool value) async {
    await _initPrefs();
    await _preferences.setBool('remember_me', value);
  }

  Future<bool> getRememberMeFlag() async {
    await _initPrefs();
    return _preferences.getBool('remember_me') ?? false;
  }
}
