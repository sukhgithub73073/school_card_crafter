import 'dart:io';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:card_craft/src/core/app_assets.dart';
import 'package:card_craft/src/core/app_dialog.dart';
import 'package:card_craft/src/core/dialog_widgets/failure_message_dialog.dart';
import 'package:card_craft/src/core/dialog_widgets/success_message_dialog.dart';
import 'package:card_craft/src/core/drop_down/drop_list_model.dart';
import 'package:card_craft/src/data/blocs/classes_bloc/classes_bloc.dart';
import 'package:card_craft/src/data/blocs/groups_bloc/groups_bloc.dart';
import 'package:card_craft/src/data/blocs/image_pick_bloc/image_pick_bloc.dart';
import 'package:card_craft/src/data/blocs/pincode_bloc/pincode_bloc.dart';
import 'package:card_craft/src/data/blocs/register_bloc/register_bloc.dart';
import 'package:card_craft/src/data/models/pincode_model.dart';
import 'package:card_craft/src/ui/register/parent_detail_screen.dart';
import 'package:card_craft/src/ui/register/student_registration/register_address_screen.dart';
import 'package:card_craft/src/ui/register/student_registration/register_gaurdian_screen.dart';
import 'package:card_craft/src/ui/register/student_registration/student_data.dart';
import 'package:card_craft/src/utility/app_util.dart';
import 'package:card_craft/src/utility/decoration_util.dart';
import 'package:card_craft/src/utility/validation_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:card_craft/src/core/app_button.dart';
import 'package:card_craft/src/core/app_colors.dart';
import 'package:card_craft/src/core/app_image_view.dart';
import 'package:card_craft/src/core/app_input_field.dart';
import 'package:card_craft/src/core/app_tap_widget.dart';
import 'package:card_craft/src/core/app_text_style.dart';
import 'package:card_craft/src/core/common_space.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:card_craft/src/core/text_view.dart';
import 'package:card_craft/src/extension/app_extension.dart';
import 'package:radio_group_v2/radio_group_v2.dart';

class RegisterParent extends StatefulWidget {
  RegisterParent({super.key});

  @override
  State<RegisterParent> createState() => _RegisterParentState();
}

class _RegisterParentState extends State<RegisterParent> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPrimary,
        leading: TapWidget(
          onTap: () {},
          child: Icon(
            Icons.arrow_back,
            color: colorWhite,
            size: 20.h,
          ),
        ),
        title: TextView(
          text: "parentDetail",
          color: colorWhite,
          textSize: 16.sp,
          textAlign: TextAlign.center,
          style: AppTextStyleEnum.medium,
          fontFamily: Family.medium,
          lineHeight: 1.3,
        ),
        actions: [],
      ),
      body: ListView(shrinkWrap: true, children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              spaceVertical(space: 10.h),


              CustomTextField(
                  controller: StudentData.nameControllerFather,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  paddingHorizontal: 20.0,
                  hasViewHight: false,
                  labelText: "fatherName",
                  hintText: "fatherNameHere",
                  numberOfLines: 1,
                  hintFontWeight: FontWeight.w400,
                  hintTextColor: colorGray.withOpacity(0.6)),
              spaceVertical(space: 20.h),
              CustomTextField(
                  controller: StudentData.aadharControllerFather,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  paddingHorizontal: 20.0,
                  hasViewHight: false,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(12),
                  ],
                  labelText: "fatherAadhaarNumber",
                  hintText: "fatherAadhaarNumberHere",
                  numberOfLines: 1,
                  hintFontWeight: FontWeight.w400,
                  hintTextColor: colorGray.withOpacity(0.6)),
              spaceVertical(space: 20.h),
              CustomDropdown<DropListModel>.search(
                hintText: tr("selectOccupation"),
                items: StudentData.occupationList,
                decoration: customDropdownDecoration,
                excludeSelected: false,
                onChanged: (item) {
                  StudentData.selectFatherOcc = item;
                },
              ),
              spaceVertical(space: 20.h),
              CustomDropdown<DropListModel>.search(
                hintText: tr("selectQualification"),
                items: StudentData.qualificationList,
                decoration: customDropdownDecoration,
                excludeSelected: false,
                onChanged: (item) {
                  StudentData.selectFatherQualification = item;
                },
              ),
              spaceVertical(space: 20.h),

              CustomTextField(
                  controller: StudentData.nameControllerMother,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  paddingHorizontal: 20.0,
                  hasViewHight: false,
                  labelText: "motherName",
                  hintText: "motherNameHere",
                  numberOfLines: 1,
                  hintFontWeight: FontWeight.w400,
                  hintTextColor: colorGray.withOpacity(0.6)),
              spaceVertical(space: 20.h),
              CustomTextField(
                  controller: StudentData.aadharControllerMother,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  paddingHorizontal: 20.0,
                  hasViewHight: false,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(12),
                  ],
                  labelText: "motherAadhaarNumber",
                  hintText: "motherAadhaarNumberHere",
                  numberOfLines: 1,
                  hintFontWeight: FontWeight.w400,
                  hintTextColor: colorGray.withOpacity(0.6)),
              spaceVertical(space: 20.h),
              CustomDropdown<DropListModel>.search(
                hintText: tr("selectOccupation"),
                items: StudentData.occupationList,
                decoration: customDropdownDecoration,
                excludeSelected: false,
                onChanged: (item) {
                  StudentData.selectMotherOcc =item ;
                },
              ),
              spaceVertical(space: 20.h),
              CustomDropdown<DropListModel>.search(
                hintText: tr("selectQualification"),
                items: StudentData.qualificationList,
                decoration: customDropdownDecoration,
                excludeSelected: false,
                onChanged: (item) {
                  StudentData.selectMotherQualification =item ;

                },
              ),


              spaceVertical(space: 30.h),
              Container(
                height: 40.h,
                width: double.infinity,
                decoration: BoxDecoration(color: colorPrimary),
                child: AppSimpleButton(
                  onDoneFuction: () async {
                    context.pushScreen(nextScreen: RegisterAddressScreen()) ;
                  },
                  buttonBackgroundColor: colorPrimary,
                  nameText: "submit",
                  textSize: 18.sp,
                ),
              ) ,
              spaceVertical(space: 10.h),
            ],
          ),
        ),
        spaceVertical(space: 10.h),
      ]),
    );
  }
}
//
