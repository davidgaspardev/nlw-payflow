import 'dart:convert';

import 'package:payflow/app/models/user_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {

  final key = "user";

  SharedPreferences? _instance;
  UserData? _currentUser;

  UserData get currentUser => _currentUser!;

  Future<bool> hasUser() async {
    if(_instance == null) _instance = await SharedPreferences.getInstance();

    if(_instance != null) {
      if(!_instance!.containsKey(key)) return false;

      _currentUser = UserData.fromMap(jsonDecode(_instance!.getString(key)!));

      return _currentUser != null;

    } else throw Exception("SharedPreferences instantiation failed");
  }

  Future<void> saveUser(UserData userData) async {
    if(_instance == null) _instance = await SharedPreferences.getInstance();

    if(_instance != null) {
      await _instance!.setString(key, userData.toString());
      // Set user
      _currentUser = userData;
    } else throw Exception("SharedPreferences instantiation failed");
  }
}