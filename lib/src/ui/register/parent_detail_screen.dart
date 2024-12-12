import 'dart:io';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:card_craft/src/core/app_assets.dart';
import 'package:card_craft/src/core/app_button.dart';
import 'package:card_craft/src/core/drop_down/drop_list_model.dart';
import 'package:card_craft/src/utility/app_util.dart';
import 'package:card_craft/src/utility/decoration_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:card_craft/src/core/app_colors.dart';
import 'package:card_craft/src/core/app_image_view.dart';
import 'package:card_craft/src/core/app_input_field.dart';
import 'package:card_craft/src/core/app_text_style.dart';
import 'package:card_craft/src/core/common_space.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:card_craft/src/core/text_view.dart';
import 'package:card_craft/src/extension/app_extension.dart';

class ParentDetailScreen extends StatefulWidget {
  final String type;

  ParentDetailScreen({super.key, required this.type});

  @override
  State<ParentDetailScreen> createState() => _ParentDetailScreenState();
}

class _ParentDetailScreenState extends State<ParentDetailScreen> {
  var nameController = TextEditingController(text: "");
  var aadharController = TextEditingController(text: "");
  var occupationList = getOccupationList();
  var qualificationList = getQualificationList();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              ImageView(
                  imageType: ImageType.asset,
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
                          border: Border.all(color: colorSecendry, width: 3.w),
                          color: colorWhite,
                          shape: BoxShape.circle),
                      child: Center(
                        child: CircleAvatar(
                          radius: 100,
                          backgroundImage: AssetImage(AppAssets.logo),
                        ),
                      ),
                    ),
                    spaceVertical(space: 10.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Column(
                        children: [
                          spaceVertical(space: 20.h),
                          CustomTextField(
                              controller: nameController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              paddingHorizontal: 20.0,
                              hasViewHight: false,
                              labelText: "${widget.type}Name",
                              hintText: "${widget.type}NameHere",
                              numberOfLines: 1,
                              hintFontWeight: FontWeight.w400,
                              hintTextColor: colorGray.withOpacity(0.6)),
                          spaceVertical(space: 20.h),
                          CustomTextField(
                              controller: aadharController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              paddingHorizontal: 20.0,
                              hasViewHight: false,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(12),
                              ],
                              labelText: "aadhaarNumber",
                              hintText: "aadhaarNumberHere",
                              numberOfLines: 1,
                              hintFontWeight: FontWeight.w400,
                              hintTextColor: colorGray.withOpacity(0.6)),
                          spaceVertical(space: 20.h),
                          CustomDropdown<DropListModel>.search(
                            hintText: tr("selectOccupation"),
                            items: occupationList,
                            decoration: customDropdownDecoration,
                            excludeSelected: false,
                            onChanged: (item) {},
                          ),
                          spaceVertical(space: 20.h),
                          CustomDropdown<DropListModel>.search(
                            hintText: tr("selectQualification"),
                            items: qualificationList,
                            decoration: customDropdownDecoration,
                            excludeSelected: false,
                            onChanged: (item) {},
                          ),
                          spaceVertical(space: 40.h),
                          Container(
                            height: 40.h,
                            width: double.infinity,
                            decoration: BoxDecoration(color: colorPrimary),
                            child: AppSimpleButton(
                              onDoneFuction: () async {
                                context.back();
                              },
                              buttonBackgroundColor: colorPrimary,
                              nameText: "submit",
                              textSize: 18.sp,
                            ),
                          )
                        ],
                      ),
                    ),
                    spaceVertical(space: 10.h),
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
                      text: "${widget.type}Detail",
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
        ],
      ),
    );
  }
}
//
