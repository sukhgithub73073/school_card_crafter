// To parse this JSON data, do
//
//     final teachersModel = teachersModelFromJson(jsonString);

import 'dart:convert';

TeachersModel teachersModelFromJson(String str) =>
    TeachersModel.fromJson(json.decode(str));

String teachersModelToJson(TeachersModel data) => json.encode(data.toJson());

class TeachersModel {
  List<Datum> data;

  TeachersModel({
    required this.data,
  });

  TeachersModel copyWith({
    List<Datum>? data,
  }) =>
      TeachersModel(
        data: data ?? this.data,
      );

  factory TeachersModel.fromJson(Map<String, dynamic> json) => TeachersModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  String className;
  String name;
  String image;
  String emailId;
  String mobileNo;
  int id;

  Datum({
    required this.className,
    required this.name,
    required this.image,
    required this.emailId,
    required this.mobileNo,
    required this.id,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    className: json["className"],
    name: json["name"],
    image: json["image"]??"",
    emailId: json["emailId"],
    mobileNo: json["mobileNo"],
    id: json["id"],
      );

  Map<String, dynamic> toJson() => {
    "className": className,
    "name": name,
    "image": image,
    "emailId": emailId,
    "mobileNo": mobileNo,
    "id": id,
      };
}

class CasteClass {
  int id;
  String name;
  String createdAt;
  String updatedAt;
  int? casteId;

  CasteClass({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    this.casteId,
  });

  factory CasteClass.fromJson(Map<String, dynamic> json) => CasteClass(
        id: json["id"],
        name: json["name"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        casteId: json["caste_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "caste_id": casteId,
      };
}

class User {
  int id;
  String name;
  String uniqueId;
  String mobileNumber;
  String mobileVerifiedAt;
  String accessType;
  String parentUserId;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  String deletedAt;

  User({
    required this.id,
    required this.name,
    required this.uniqueId,
    required this.mobileNumber,
    required this.mobileVerifiedAt,
    required this.accessType,
    required this.parentUserId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        uniqueId: json["unique_id"],
        mobileNumber: json["mobile_number"],
        mobileVerifiedAt: json["mobile_verified_at"],
        accessType: json["access_type"],
        parentUserId: json["parent_user_id"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "unique_id": uniqueId,
        "mobile_number": mobileNumber,
        "mobile_verified_at": mobileVerifiedAt,
        "access_type": accessType,
        "parent_user_id": parentUserId,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
      };
}
