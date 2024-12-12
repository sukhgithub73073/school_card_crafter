import 'dart:convert';
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

class RegisterAddressScreen extends StatefulWidget {
  RegisterAddressScreen({super.key});

  @override
  State<RegisterAddressScreen> createState() => _RegisterAddressScreenState();
}

class _RegisterAddressScreenState extends State<RegisterAddressScreen> {


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
          text: "addressDetail",
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
              context.pushScreen(nextScreen: RegisterGaurdianScreen());
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
                          controller: StudentData.pincodeAddressController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          paddingHorizontal: 20.0,
                          hasViewHight: false,
                          labelText: "pincode",
                          hintText: "pincodeHere",
                          numberOfLines: 1,
                          hintFontWeight: FontWeight.w400,
                          onChanged: (e) {
                            if (StudentData.pincodeAddressController.text.length == 6) {
                              context.read<PincodeBloc>().add(
                                  GetInfoPincodeEvent(
                                      pincode: StudentData.pincodeAddressController.text));
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
                    StudentData.stateController.text = postOffice.state ;
                    StudentData.districtController.text = postOffice.district ;
                    return Column(
                      children: [
                        spaceVertical(space: 20.h),
                        CustomTextField(
                            controller: StudentData.stateController,
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
                            controller: StudentData.districtController,
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
                            controller: StudentData.tehsilController,
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
                  controller: StudentData.villMohallaController,
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



              Container(
                height: 40.h,
                width: double.infinity,
                decoration: BoxDecoration(color: colorPrimary),
                child: AppSimpleButton(
                  onDoneFuction: () async {
                    context.pushScreen(nextScreen: RegisterGaurdianScreen());
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
