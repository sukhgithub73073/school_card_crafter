import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:card_craft/src/core/app_colors.dart';
import 'package:card_craft/src/core/app_text_style.dart';
import 'package:card_craft/src/core/text_view.dart';
import 'package:card_craft/src/enums/snack_type_enum.dart';
import 'package:get/get.dart';

extension NavigatorContext on BuildContext {
  back() {
    Navigator.pop(this);
  }

  dissmissLoading() {
    Navigator.pop(this);
  }

  pushScreen({required Widget nextScreen}) {
    Navigator.push(this, MaterialPageRoute(builder: (context) => nextScreen));
  }

  pushReplacementScreen({required Widget nextScreen}) {
    Navigator.pushReplacement(
        this, MaterialPageRoute(builder: (context) => nextScreen));
  }

  showSnackBar(
      {required String title,
      required String message,
      required SnackTypeEnum snackTypeEnum}) {
    Get.closeAllSnackbars();
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      titleText: TextView(
        text: title,
        color: colorWhite,
        textSize: 16.sp,
        textAlign: TextAlign.start,
        style: AppTextStyleEnum.medium,
        fontFamily: Family.medium,
        lineHeight: 1.3,
      ),
      messageText: TextView(
        text: message,
        color: colorWhite,
        textSize: 14.sp,
        textAlign: TextAlign.start,
        style: AppTextStyleEnum.medium,
        fontFamily: Family.regular,
        lineHeight: 1.3,
      ),
      backgroundColor: snackTypeEnum == SnackTypeEnum.success ? colorPrimary : colorRed,
    );


  }
}
