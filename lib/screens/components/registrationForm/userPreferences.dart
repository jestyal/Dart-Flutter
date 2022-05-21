import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static SharedPreferences? _preferences;

  final _keyUsername = 'username';
  final _keyPassword = 'password';
  final _keyIsLogin = 'isLogin';

  Future init() async => _preferences = await SharedPreferences.getInstance();

  //username
  Future setUsername(String username) async =>
      await _preferences?.setString(_keyUsername, username);

  String? getUsername() => _preferences?.getString(_keyUsername);

  Future<bool>? deleteUsername() => _preferences?.remove(_keyUsername);


  //password
  Future setPassword(String password) async =>
      await _preferences?.setString(_keyPassword, password);

  String? getPassword() => _preferences?.getString(_keyPassword);

  Future<bool>? deletePassword() => _preferences?.remove(_keyPassword);


  //isLogin
  Future setIsLogin(isLogin) async =>
      await _preferences?.setBool(_keyIsLogin, false);

  bool? getIsLogin() => _preferences?.getBool(_keyIsLogin);

  Future<bool>? deleteIsLogin() => _preferences?.remove(_keyIsLogin);
}
