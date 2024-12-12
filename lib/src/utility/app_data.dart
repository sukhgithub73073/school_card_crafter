import 'package:camera/camera.dart';
import 'package:card_craft/src/data/models/cast_model.dart';
import 'package:card_craft/src/data/models/students_model.dart';

import '../data/models/user_model.dart';

class AppData {
  static Map<String, dynamic> studentMap = {};

  static String authToken = "";
  static List<Datum> studentList = [];

  static List<Caste> subCastList = [];
  static UserModel userModel = UserModel(

      data: DataItem(
          className: "",
          name: "",
          email: "",
          token: "",
          id: 1,
          projectId: 1,
          role: "",
          roleId: 1));

  static bool loadMore = true;
}
