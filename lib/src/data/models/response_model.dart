import 'dart:convert';

ResponseModel responseModelFromJson(String str) => ResponseModel.fromJson(json.decode(str));

String responseModelToJson(ResponseModel data) => json.encode(data.toJson());

class ResponseModel {
  bool success;
  dynamic data;
  String message;
  dynamic errors;

  ResponseModel({
    required this.success,
    required this.data,
    required this.message,
    required this.errors,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
    success: json["success"]??false,
    data: json["data"],
    message: json["message"],
    errors: json["errors"],
  );

  Map<String, dynamic> toJson() => {
    "status": success,
    "data": data,
    "message": message,
    "errors": errors,
  };
}
