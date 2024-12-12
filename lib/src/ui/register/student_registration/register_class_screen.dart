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
import 'package:card_craft/src/ui/register/student_registration/register_bank_screen.dart';
import 'package:card_craft/src/ui/register/student_registration/register_gaurdian_screen.dart';
import 'package:card_craft/src/ui/register/student_registration/student_data.dart';
import 'package:card_craft/src/utility/app_data.dart';
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

class RegisterClassScreen extends StatefulWidget {
  RegisterClassScreen({super.key});

  @override
  State<RegisterClassScreen> createState() => _RegisterClassScreenState();
}

class _RegisterClassScreenState extends State<RegisterClassScreen> {
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
          text: "classDetail",
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

              // BlocConsumer<GroupsBloc, GroupsState>(
              //   listener: (context, state) {},
              //   builder: (context, state) {
              //     if (state is GroupsSuccess) {
              //       printLog(
              //           "builder >>>>>>>>>>>>>>>>>${state is GroupsSuccess}");
              //       List<DropListModel> list = [];
              //       state.data.forEach((element) {
              //         list.add(DropListModel(
              //             id: "${element.id}", name: "${element.groupName}"));
              //       });
              //       return CustomDropdown<DropListModel>.search(
              //         hintText: tr("selectGroup"),
              //         items: list,
              //         excludeSelected: false,
              //         decoration: customDropdownDecoration,
              //         onChanged: (item) {
              //           StudentData.selectedPreviosGroup = item;
              //           context.read<ClassesBloc>().add(GetClassesByGroupEvent(
              //                   map: {
              //                     'college_id':
              //                     '${AppData.userModel.data?.data.college.id ?? ""}',
              //                 'session': DateTime.now().year,
              //                     'class_group_id': '${item?.id ?? ""}'
              //                   }));
              //         },
              //       );
              //     } else {
              //       return SizedBox.shrink();
              //     }
              //   },
              // ),
              // spaceVertical(space: 10.h),
              // BlocConsumer<ClassesBloc, ClassesState>(
              //   listener: (context, state) {},
              //   builder: (context, state) {
              //     if (state is ClassesGetSuccess) {
              //       printLog(
              //           "builder >>>>>>>>>>>>>>>>>${state is GroupsSuccess}");
              //       List<DropListModel> list = [];
              //       state.data.forEach((element) {
              //         list.add(DropListModel(
              //             id: "${element.id}",
              //             name: "${element.className}"));
              //       });
              //       return CustomDropdown<DropListModel>.search(
              //         hintText: tr("selectClass"),
              //         items: list,
              //         decoration: customDropdownDecoration,
              //         excludeSelected: false,
              //         onChanged: (item) {
              //           StudentData.selectedPreviosClass = item;
              //         },
              //       );
              //     } else {
              //       return SizedBox.shrink();
              //     }
              //   },
              // ),
              // spaceVertical(space: 20.h),

              CustomTextField(
                  controller: StudentData.previosSchoolCtrl,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  paddingHorizontal: 20.0,
                  hasViewHight: false,
                  labelText: "previousSchoolName",
                  hintText: "previousSchoolName",
                  numberOfLines: 1,
                  hintFontWeight: FontWeight.w400,
                  hintTextColor: colorGray.withOpacity(0.6)),
              spaceVertical(space: 20.h),

              CustomTextField(
                  controller: StudentData.timeCtrl,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  paddingHorizontal: 20.0,
                  hasViewHight: false,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(12),
                  ],
                  labelText: "timePeriodOfResidenceInState",
                  hintText: "timePeriodOfResidenceInState",
                  numberOfLines: 1,
                  hintFontWeight: FontWeight.w400,
                  hintTextColor: colorGray.withOpacity(0.6)),
              spaceVertical(space: 20.h),
              Container(
                height: 40.h,
                width: double.infinity,
                decoration: BoxDecoration(color: colorPrimary),
                child: AppSimpleButton(
                  onDoneFuction: () async {
                    context.pushScreen(nextScreen: RegisterBankScreen());
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
