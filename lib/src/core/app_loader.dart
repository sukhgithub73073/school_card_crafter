import 'package:card_craft/src/core/app_colors.dart';
import 'package:card_craft/src/core/app_text_style.dart';
import 'package:card_craft/src/core/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

appLoader(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => AlertDialog(
      backgroundColor: Colors.white,
      elevation: 50,
      shape: Border(top:BorderSide.none),
      content: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 30.h,
            width: 35.w,
            child: CircularProgressIndicator(
              color: colorPrimary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: TextView(
              text: "Loading...",
              color: Colors.black, // Set text color to black
              textSize: 18.sp,
              textAlign: TextAlign.center,
              style: AppTextStyleEnum.bold,
              fontFamily: Family.bold,
              lineHeight: 1.3,
            ),
          ),
        ],
      ),
    ),
  );
}
