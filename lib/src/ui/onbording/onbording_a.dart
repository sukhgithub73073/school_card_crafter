import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:card_craft/src/core/app_assets.dart';
import 'package:card_craft/src/core/app_button.dart';
import 'package:card_craft/src/core/app_colors.dart';
import 'package:card_craft/src/core/app_image_view.dart';
import 'package:card_craft/src/core/app_text_style.dart';
import 'package:card_craft/src/core/common_space.dart';
import 'package:card_craft/src/core/text_view.dart';
import 'package:card_craft/src/extension/app_extension.dart';
import 'package:card_craft/src/ui/login/login_screen.dart';

class OnBoardongAScreen extends StatefulWidget {
  const OnBoardongAScreen({super.key});

  @override
  State<OnBoardongAScreen> createState() => _OnBoardongAScreenState();
}

class _OnBoardongAScreenState extends State<OnBoardongAScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [


          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                spaceVertical(space: 50.h),

                ImageView(
                  url: AppAssets.logo,
                  size: 100.h,
                ),

                spaceVertical(space: 30.h),

                TextView(
                  text: "Welcome  \nForEarthGardening",
                  color: colorBlack,
                  textSize: 24.sp,
                  textAlign: TextAlign.center,
                  style: AppTextStyleEnum.title,
                  fontFamily: Family.bold,
                  lineHeight: 1.3,
                ),
                spaceVertical(space: 20.h),


                TextView(
                  text: "Save the Earth by planting tree",
                  color: colorGray,
                  textSize: 16.sp,
                  textAlign: TextAlign.center,
                  style: AppTextStyleEnum.medium,
                  fontFamily: Family.medium,
                  lineHeight: 1.3,
                ),
                spaceVertical(space: 10.h),
                TextView(
                  text: "The premier flower delivery app in town for bringing you fresh, vibrant blooms daily",
                  color: colorGray,
                  textSize: 16.sp,
                  textAlign: TextAlign.center,
                  style: AppTextStyleEnum.medium,
                  fontFamily: Family.medium,
                  lineHeight: 1.3,
                ),
                spaceVertical(space: 30.h),

                Container(
                  height: 40.h,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: AppSimpleButton(
                    onDoneFuction: () async {


                    },
                    buttonBackgroundColor: colorPrimary,
                    nameText: "Shop now",
                    textSize: 18.sp,
                  ),
                ),



              ],
            ),
          ),
        ],
      ),
    );

  }
}
