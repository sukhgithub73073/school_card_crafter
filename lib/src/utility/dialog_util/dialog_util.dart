import 'package:card_craft/src/core/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogUtils {
  static DialogUtils _instance = new DialogUtils.internal();

  DialogUtils.internal();

  factory DialogUtils() => _instance;

  static void showCustomDialog(BuildContext context,
      {required String title,
      String okBtnText = "Ok",
      String cancelBtnText = "Cancel",
      required Function okBtnFunction}) {
    showDialog(
        context: context,
        builder: (_) {
          return CupertinoAlertDialog(
            title: Text("Success"),
            actions: [
              CupertinoDialogAction(onPressed: () {}, child: Text("Back")),
              CupertinoDialogAction(onPressed: () {}, child: Text("Next")),
            ],
            content: Text("Saved successfully"),
          );
        });
  }
}
