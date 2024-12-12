// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {

  DataItem data;

  UserModel({

    required this.data,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(

    data: DataItem.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {

    "data": data.toJson(),
  };
}

class DataItem {
  String name;
  String className;
  String email;
  int id;
  int projectId;
  String role;
  int roleId;
  String token;

  DataItem({
    required this.name,
    required this.className,
    required this.email,
    required this.id,
    required this.projectId,
    required this.role,
    required this.roleId,
    required this.token,
  });

  factory DataItem.fromJson(Map<String, dynamic> json) => DataItem(
    name: json["name"],
    className: json["className"]??"",
    email: json["email"],
    id: json["id"],
    projectId: json["projectId"],
    role: json["role"],
    roleId: json["roleId"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "className": className,
    "email": email,
    "id": id,
    "projectId": projectId,
    "role": role,
    "roleId": roleId,
    "token": token,
  };
}
