import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';

import 'dart:convert';

DropListModel dropListModelFromJson(String str) =>
    DropListModel.fromJson(json.decode(str));

String dropListModelToJson(DropListModel data) => json.encode(data.toJson());

class DropListModel with CustomDropdownListFilter {
  final String name;
  final String id;

  const DropListModel({required this.name, required this.id});

  @override
  String toString() {
    return name == "" ? name : name.toUpperCase();
  }

  @override
  bool filter(String query) {
    return name.toLowerCase().contains(query.toLowerCase());
  }

  factory DropListModel.fromJson(Map<String, dynamic> json) => DropListModel(
        name: json["name"],
        id: json["id"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
      };
}
