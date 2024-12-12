import 'package:card_craft/src/core/app_assets.dart';
import 'package:card_craft/src/core/app_dialog.dart';
import 'package:card_craft/src/core/app_strings.dart';
import 'package:card_craft/src/core/dialog_widgets/failure_message_dialog.dart';
import 'package:card_craft/src/core/dialog_widgets/success_message_dialog.dart';
import 'package:card_craft/src/data/blocs/pincode_bloc/pincode_bloc.dart';
import 'package:card_craft/src/data/blocs/register_bloc/register_bloc.dart';
import 'package:card_craft/src/data/models/pincode_model.dart';
import 'package:card_craft/src/ui/dashboard/main_screen.dart';
import 'package:card_craft/src/utility/app_util.dart';
import 'package:card_craft/src/utility/validation_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:card_craft/src/core/app_button.dart';
import 'package:card_craft/src/core/app_colors.dart';
import 'package:card_craft/src/core/app_image_view.dart';
import 'package:card_craft/src/core/app_input_field.dart';
import 'package:card_craft/src/core/app_tap_widget.dart';
import 'package:card_craft/src/core/app_text_style.dart';
import 'package:card_craft/src/core/common_space.dart';
import 'dart:math';

import 'package:card_craft/src/core/custom_clipper.dart';
import 'package:card_craft/src/core/text_view.dart';
import 'package:card_craft/src/extension/app_extension.dart';

class SchoolRegisterScreen extends StatefulWidget {
  SchoolRegisterScreen({super.key});

  @override
  State<SchoolRegisterScreen> createState() => _SchoolRegisterScreenState();
}

class _SchoolRegisterScreenState extends State<SchoolRegisterScreen> {
  var nameController = TextEditingController(text: "");
  var emailController = TextEditingController(text: "");
  var pincodeController = TextEditingController(text: "");
  var addressController = TextEditingController(text: "");
  var passwordController = TextEditingController(text: "");
  var selectedPostOffice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
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
                          border: Border.all(color: colorSecendry, width: 3.w),
                          color: colorWhite,
                          shape: BoxShape.circle),
                      child: Center(
                        child: ImageView(
                          margin: EdgeInsets.all(20.w),
                          url: AppAssets.logo,
                          imageType: ImageType.asset,
                        ),
                      ),
                    ),
                    spaceVertical(space: 10.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Column(
                        children: [
                          CustomTextField(
                              controller: nameController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              paddingHorizontal: 20.0,
                              hasViewHight: false,
                              labelText: "Name",
                              hintText: "Name Here",
                              numberOfLines: 1,
                              hintFontWeight: FontWeight.w400,
                              hintTextColor: colorGray.withOpacity(0.6)),
                          spaceVertical(space: 20.h),
                          CustomTextField(
                              controller: emailController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              paddingHorizontal: 20.0,
                              hasViewHight: false,
                              labelText: "Email",
                              hintText: "Email Here",
                              numberOfLines: 1,
                              hintFontWeight: FontWeight.w400,
                              hintTextColor: colorGray.withOpacity(0.6)),
                          spaceVertical(space: 20.h),
                          CustomTextField(
                              controller: passwordController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              paddingHorizontal: 20.0,
                              hasViewHight: false,
                              labelText: "Password",
                              hintText: "***********",
                              numberOfLines: 1,
                              borderColor: colorInputBorder,
                              hintFontWeight: FontWeight.w400,
                              hintTextColor: colorInputBorder.withOpacity(0.6)),
                          spaceVertical(space: 20.h),
                          BlocConsumer<PincodeBloc, PincodeState>(
                            listener: (context, state) {
                              if (state is PincodeError) {
                                appDialog(
                                    context: context,
                                    child: ErrorDailog(
                                      title: "Invalid Pincode",
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
                                      controller: pincodeController,
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.number,
                                      paddingHorizontal: 20.0,
                                      hasViewHight: false,
                                      labelText: "Pincode",
                                      hintText: "Pincode Here",
                                      numberOfLines: 1,
                                      hintFontWeight: FontWeight.w400,
                                      onChanged: (e) {
                                        if (pincodeController.text.length ==
                                            6) {
                                          context.read<PincodeBloc>().add(
                                              GetInfoPincodeEvent(
                                                  pincode:
                                                      pincodeController.text));
                                        }
                                      },
                                      hintTextColor:
                                          colorGray.withOpacity(0.6)),
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
                                return Column(
                                  children: [
                                    spaceVertical(space: 20.h),
                                    FormField<String>(
                                      builder: (FormFieldState<String> s) {
                                        return InputDecorator(
                                          decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.fromLTRB(
                                                      12, 10, 20, 20),
                                              errorStyle: TextStyle(
                                                  color: Colors.redAccent,
                                                  fontSize: 16.0),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0))),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton<PostOffice>(
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey,
                                              ),
                                              hint: Text(
                                                "Select City",
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              items: state.responseModel.data[0]
                                                  .postOffice
                                                  .map<
                                                          DropdownMenuItem<
                                                              PostOffice>>(
                                                      (PostOffice value) {
                                                return DropdownMenuItem(
                                                  value: value,
                                                  child: Row(
                                                    children: [
                                                      TextView(
                                                        text: "${value.name}",
                                                        color: colorGray,
                                                        textSize: 12.sp,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: AppTextStyleEnum
                                                            .medium,
                                                        fontFamily:
                                                            Family.medium,
                                                        lineHeight: 1.3,
                                                      )
                                                    ],
                                                  ),
                                                );
                                              }).toList(),
                                              isExpanded: true,
                                              isDense: true,
                                              onChanged: (selectedItem) {
                                                setState(() {
                                                  selectedPostOffice =
                                                      selectedItem;
                                                });
                                              },
                                              value: selectedPostOffice,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                );
                              } else {
                                return SizedBox.shrink();
                              }
                            },
                          ),
                          spaceVertical(space: 20.h),
                          CustomTextField(
                              controller: addressController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              paddingHorizontal: 20.0,
                              hasViewHight: false,
                              labelText: "Address",
                              hintText: "Address Here",
                              numberOfLines: 1,
                              hintFontWeight: FontWeight.w400,
                              hintTextColor: colorGray.withOpacity(0.6)),
                          spaceVertical(space: 30.h),
                          BlocConsumer<RegisterBloc, RegisterState>(
                            listener: (context, state) {
                              if (state is RegisterSuccess) {
                                appDialog(
                                    context: context,
                                    child: SuccessDailog(
                                      title: "Successfully",
                                      onTap: () {
                                        context.back();
                                      },
                                      message: "${state.userModel.message}",
                                    ));
                              } else if (state is RegisterError) {
                                appDialog(
                                    context: context,
                                    child: ErrorDailog(
                                      title: "Error",
                                      onTap: () {
                                        context.back();
                                      },
                                      message: "${state.error}",
                                    ));
                              }
                            },
                            builder: (context, state) {
                              return Container(
                                height: 40.h,
                                width: double.infinity,
                                decoration: BoxDecoration(color: colorPrimary),
                                child: AppSimpleButton(
                                  onDoneFuction: () async {
                                    if (!ValidationUtil.emailValidation(
                                        email: emailController.text)) {
                                    } else if (!ValidationUtil
                                        .passwordValidation(
                                            password:
                                                passwordController.text)) {
                                    } else {
                                      var school_code = getRandomId(
                                          text: nameController.text);
                                      var map = {
                                        "school_code": school_code,
                                        "role_type": "School",
                                        "email": emailController.text,
                                        "password": passwordController.text,
                                        "name": nameController.text,
                                        "pincode": pincodeController.text,
                                        "district": selectedPostOffice.district,
                                        "city": selectedPostOffice.name,
                                        "address": addressController.text
                                      };
                                      context
                                          .read<RegisterBloc>()
                                          .add(DoRegisterEvent(map: map));
                                    }
                                  },
                                  buttonBackgroundColor: colorPrimary,
                                  nameText: "Register",
                                  textSize: 18.sp,
                                ),
                              );
                            },
                          ),
                          spaceVertical(space: 10.h),
                          TapWidget(
                            onTap: () {},
                            child: TextView(
                              text: "Have an account ? Login",
                              color: colorGray,
                              textSize: 12.sp,
                              textAlign: TextAlign.center,
                              style: AppTextStyleEnum.medium,
                              fontFamily: Family.medium,
                              lineHeight: 1.3,
                            ),
                          )
                        ],
                      ),
                    )
                  ]),
            ],
          ),
        ],
      ),
    );
  }
}
//
