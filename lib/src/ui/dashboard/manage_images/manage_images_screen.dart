import 'package:flutter/material.dart';
import 'package:card_craft/src/core/app_assets.dart';
import 'package:card_craft/src/core/app_image_view.dart';

import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:card_craft/src/core/app_button.dart';
import 'package:card_craft/src/core/app_colors.dart';
import 'package:card_craft/src/core/app_input_field.dart';
import 'package:card_craft/src/core/app_text_style.dart';
import 'package:card_craft/src/core/common_space.dart';
import 'package:card_craft/src/core/text_view.dart';
import 'package:card_craft/src/extension/app_extension.dart';
import 'package:card_craft/src/ui/dashboard/manage_images/image_capture_screen.dart';

class ManageImagesScreen extends StatefulWidget {
  const ManageImagesScreen({super.key});

  @override
  State<ManageImagesScreen> createState() => _ManageImagesScreenState();
}

class _ManageImagesScreenState extends State<ManageImagesScreen> {
  var classController = TextEditingController(text: "");
  bool autoSerial = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Form(
            child: Stack(
              children: [
                ImageView(
                    url: AppAssets.topRound,
                    width: double.maxFinite,
                    height: 150.h,
                    fit: BoxFit.fill),
                ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 100),
                        height: 150.h,
                        width: 150.w,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: colorSecendry, width: 3.w),
                            color: colorWhite,
                            shape: BoxShape.circle),
                        child: Center(
                          child: Stack(
                            children: [
                              CircleAvatar(
                                radius: 100,
                                backgroundImage: AssetImage(AppAssets.logo),
                              ),
                            ],
                          ),
                        ),
                      ),
                      spaceVertical(space: 10.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Column(
                          children: [
                            CustomTextField(
                                controller: classController,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.text,
                                paddingHorizontal: 20.0,
                                hasViewHight: false,
                                labelText: "class",
                                hintText: "classHere",
                                numberOfLines: 1,
                                hintFontWeight: FontWeight.w400,
                                hintTextColor: colorGray.withOpacity(0.6)),
                            spaceVertical(space: 20.h),
                            Row(
                              children: [
                                Checkbox(
                                  value: autoSerial,
                                  onChanged: (e) {
                                    setState(() {
                                      autoSerial = e!;
                                    });
                                  },
                                ),
                                TextView(
                                  text: "autoSerialNumber",
                                  color: colorBlack,
                                  textSize: 15.sp,
                                  textAlign: TextAlign.center,
                                  style: AppTextStyleEnum.medium,
                                  fontFamily: Family.medium,
                                  lineHeight: 1.3,
                                )
                              ],
                            ),
                            spaceVertical(space: 30.h),
                            Container(
                              height: 40.h,
                              width: double.infinity,
                              decoration: BoxDecoration(color: colorPrimary),
                              child: AppSimpleButton(
                                onDoneFuction: () async {
                                  context.pushScreen(nextScreen: ImageCaptureScreen());
                                },
                                buttonBackgroundColor: colorPrimary,
                                nameText: "submit",
                                textSize: 18.sp,
                              ),
                            ),
                            spaceVertical(space: 10.h),
                          ],
                        ),
                      )
                    ]),
                Positioned(
                  top: 5.h,
                  left: 5.w,
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(color: colorWhite, Icons.arrow_back),
                        onPressed: () {
                          context.back();
                        },
                      ),
                      TextView(
                        text: "manageImages",
                        color: colorWhite,
                        textSize: 16.sp,
                        textAlign: TextAlign.center,
                        style: AppTextStyleEnum.medium,
                        fontFamily: Family.medium,
                        lineHeight: 1.3,
                      )
                    ],
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
