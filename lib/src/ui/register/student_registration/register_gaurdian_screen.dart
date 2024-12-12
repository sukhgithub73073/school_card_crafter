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
import 'package:card_craft/src/ui/register/student_registration/register_class_screen.dart';
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

class RegisterGaurdianScreen extends StatefulWidget {
  RegisterGaurdianScreen({super.key});

  @override
  State<RegisterGaurdianScreen> createState() => _RegisterGaurdianScreenState();
}

class _RegisterGaurdianScreenState extends State<RegisterGaurdianScreen> {


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
          text: "gaurdianDetail",
          color: colorWhite,
          textSize: 16.sp,
          textAlign: TextAlign.center,
          style: AppTextStyleEnum.medium,
          fontFamily: Family.medium,
          lineHeight: 1.3,
        ),
        actions: [
          TapWidget(
            onTap: (){
              context.pushScreen(nextScreen: RegisterClassScreen());
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: TextView(
                text: "skip",
                color: colorWhite,
                textSize: 14.sp,
                textAlign: TextAlign.center,
                style: AppTextStyleEnum.medium,
                fontFamily: Family.medium,
                lineHeight: 1.3,
              ),
            ),
          )
        ],
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
                  controller: StudentData.nameGaurdianCtrl,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  paddingHorizontal: 20.0,
                  hasViewHight: false,
                  labelText: "gaurdianName",
                  hintText: "gaurdianNameHere",
                  numberOfLines: 1,
                  hintFontWeight: FontWeight.w400,
                  hintTextColor: colorGray.withOpacity(0.6)),
              spaceVertical(space: 20.h),
              CustomTextField(
                  controller: StudentData.relationshipGaurdianCtrl,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  paddingHorizontal: 20.0,
                  hasViewHight: false,
                  labelText: "relationshipWithStudent",
                  hintText: "relationshipWithStudent",
                  numberOfLines: 1,
                  hintFontWeight: FontWeight.w400,
                  hintTextColor: colorGray.withOpacity(0.6)),
              spaceVertical(space: 20.h),
              CustomTextField(
                  controller: StudentData.mobileGaurdianCtrl,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  paddingHorizontal: 20.0,
                  hasViewHight: false,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10),
                  ],
                  labelText: "mobileNumber",
                  hintText: "mobileNumber",
                  numberOfLines: 1,
                  hintFontWeight: FontWeight.w400,
                  hintTextColor: colorGray.withOpacity(0.6)),
              spaceVertical(space: 20.h),
              BlocConsumer<PincodeBloc, PincodeState>(
                listener: (context, state) {
                  if (state is PincodeError) {
                    appDialog(
                        context: context,
                        child: ErrorDailog(
                          title: "invalidPincode",
                          onTap: () {
                            context.back();
                          },
                          message: "${state.error}",
                        ));
                  }
                },
                builder: (context, state) {
                  return Stack(
                    children: [
                      CustomTextField(
                          controller: StudentData.pincodeGaurdianCtrl,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          paddingHorizontal: 20.0,
                          hasViewHight: false,
                          labelText: "pincode",
                          hintText: "pincodeHere",
                          numberOfLines: 1,
                          hintFontWeight: FontWeight.w400,
                          onChanged: (e) {
                            if (StudentData.pincodeGaurdianCtrl.text.length == 6) {
                              context.read<PincodeBloc>().add(
                                  GetInfoPincodeEvent(
                                      pincode: StudentData.pincodeGaurdianCtrl.text));
                            }
                          },
                          hintTextColor: colorGray.withOpacity(0.6)),
                      state is PincodeLoading
                          ? Positioned(
                        bottom: 10,
                        top: 10,
                        right: 10,
                        child: SizedBox(
                          width: 25.0.w,
                          height: 30.0.h,
                          child: CircularProgressIndicator(
                            strokeWidth: 3.0,
                            color: colorPrimary,
                          ),
                        ),
                      )
                          : SizedBox.shrink(),
                    ],
                  );
                },
              ),
              BlocBuilder<PincodeBloc, PincodeState>(
                builder: (context, state) {
                  if (state is PincodeSuccess) {
                    PostOffice postOffice = state.responseModel.data[0].postOffice[0] ;
                    print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>") ;
                    StudentData.stateGaurdianCtrl.text = postOffice.state ;
                    StudentData.districtGaurdianCtrl.text = postOffice.district ;
                    return Column(
                      children: [
                        spaceVertical(space: 20.h),
                        CustomTextField(
                            controller: StudentData.stateGaurdianCtrl,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,
                            paddingHorizontal: 20.0,
                            hasViewHight: false,
                            readOnly: true,
                            labelText: "state",
                            hintText: "state",
                            numberOfLines: 1,
                            hintFontWeight: FontWeight.w400,
                            hintTextColor: colorGray.withOpacity(0.6)),
                        spaceVertical(space: 20.h),

                        CustomTextField(
                            controller: StudentData.districtGaurdianCtrl,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,
                            paddingHorizontal: 20.0,
                            hasViewHight: false,
                            readOnly: true,
                            labelText: "district",
                            hintText: "district",
                            numberOfLines: 1,
                            hintFontWeight: FontWeight.w400,
                            hintTextColor: colorGray.withOpacity(0.6)),
                        spaceVertical(space: 20.h),



                        CustomTextField(
                            controller: StudentData.tehsilGaurdianCtrl,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,
                            paddingHorizontal: 20.0,
                            hasViewHight: false,
                            labelText: "tehsil",
                            hintText: "tehsilHere",
                            numberOfLines: 1,
                            hintFontWeight: FontWeight.w400,
                            hintTextColor: colorGray.withOpacity(0.6)),
                      ],
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                },
              ),
              spaceVertical(space: 20.h),
              CustomTextField(
                  controller: StudentData.villageMohalaGaurdianCtrl,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  paddingHorizontal: 20.0,
                  hasViewHight: false,
                  labelText: "villMohalla",
                  hintText: "villMohalla",
                  numberOfLines: 1,
                  hintFontWeight: FontWeight.w400,
                  hintTextColor: colorGray.withOpacity(0.6)),
              spaceVertical(space: 30.h),



              spaceVertical(space: 30.h),
              Container(
                height: 40.h,
                width: double.infinity,
                decoration: BoxDecoration(color: colorPrimary),
                child: AppSimpleButton(
                  onDoneFuction: () async {
                    context.pushScreen(nextScreen: RegisterClassScreen());
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
