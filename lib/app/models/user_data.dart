/// Standard package
import 'dart:convert';
/// Internal package
import 'package:payflow/app/helpers/abstraction/model.dart';

/// User data model
class UserData extends Model {

  final String name;
  final String picture;

  /// Constructor
  UserData({
    required this.name,
    required this.picture
  });

  static UserData fromMap(Map<String, String> map) {
    try {
      // Return user data model
      return UserData(name: map['name']!, picture: map['picture']!);
    } catch(e) {
      throw e;
    }
  }

  @override
  Map<String, String> toMap() {
    // Return user data map
    return {
      "name": this.name,
      "picture": this.picture
    };
  }
  
  @override
  String toString() {
    return jsonEncode(this.toMap());
  }
}