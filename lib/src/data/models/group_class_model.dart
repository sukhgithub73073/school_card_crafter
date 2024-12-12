// To parse this JSON data, do
//
//     final groupClassModel = groupClassModelFromJson(jsonString);

import 'dart:convert';

GroupClassModel groupClassModelFromJson(String str) => GroupClassModel.fromJson(json.decode(str));

String groupClassModelToJson(GroupClassModel data) => json.encode(data.toJson());

class GroupClassModel {
  List<Datum> data;

  GroupClassModel({
    required this.data,
  });

  factory GroupClassModel.fromJson(Map<String, dynamic> json) => GroupClassModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  int id;
  // String session;
  // int collegeId;
  // String? groupName;
  // Status status;
  // DateTime createdAt;
  // DateTime updatedAt;
  // dynamic deletedAt;
   List<Datum>? classes;
  // int? classGroupId;
  String? className;

  Datum({
    required this.id,
    // required this.session,
    // required this.collegeId,
    // this.groupName,
    // required this.status,
    // required this.createdAt,
    // required this.updatedAt,
    // required this.deletedAt,
     this.classes,
    // this.classGroupId,
    this.className,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    // session: json["session"],
    // collegeId: json["college_id"],
    // groupName: json["group_name"],
    // status: statusValues.map[json["status"]]!,
    // createdAt: DateTime.parse(json["created_at"]),
    // updatedAt: DateTime.parse(json["updated_at"]),
    // deletedAt: json["deleted_at"],
     classes: json["classes"] == null ? [] : List<Datum>.from(json["classes"]!.map((x) => Datum.fromJson(x))),
    // classGroupId: json["class_group_id"],
    className: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    // "session": session,
    // "college_id": collegeId,
    // "group_name": groupName,
    // "status": statusValues.reverse[status],
    // "created_at": createdAt.toIso8601String(),
    // "updated_at": updatedAt.toIso8601String(),
    // "deleted_at": deletedAt,
     "classes": classes == null ? [] : List<dynamic>.from(classes!.map((x) => x.toJson())),
    // "class_group_id": classGroupId,
    "class_name": className,
  };
}

enum Status {
  ACTIVE
}

final statusValues = EnumValues({
  "active": Status.ACTIVE
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
