import 'dart:convert';

class UserModel {

  final String name;
  final String? picture;

  UserModel({ required this.name, this.picture });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(name: map['name'], picture: map['picture']);
  }

  factory UserModel.fromJson(String json) {
    return UserModel.fromMap(jsonDecode(json));
  }

  Map<String, dynamic> toMap() => {
    "name": this.name,
    "picture": this.picture
  };

  String toJson() => jsonEncode(this.toMap());
}