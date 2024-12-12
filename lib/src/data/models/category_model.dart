class CategoryModel {
  int id;
  String icon;
  String name;

  CategoryModel({
    required this.id,
    required this.icon,
    required this.name,
  });
  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        icon: json["icon"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "icon": icon,
        "name": name,
      };
}
