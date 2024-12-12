import 'package:card_craft/src/core/app_assets.dart';
import 'package:card_craft/src/core/app_button.dart';
import 'package:card_craft/src/core/app_colors.dart';
import 'package:card_craft/src/core/app_image_view.dart';
import 'package:card_craft/src/core/app_input_field.dart';
import 'package:card_craft/src/core/app_strings.dart';
import 'package:card_craft/src/core/app_tap_widget.dart';
import 'package:card_craft/src/core/app_text_style.dart';
import 'package:card_craft/src/core/common_space.dart';
import 'package:card_craft/src/core/text_view.dart';
import 'package:card_craft/src/data/blocs/detail_bloc/detail_bloc.dart';
import 'package:card_craft/src/data/blocs/login_bloc/login_bloc.dart';
import 'package:card_craft/src/data/blocs/role_bloc/role_bloc.dart';
import 'package:card_craft/src/extension/app_extension.dart';
import 'package:card_craft/src/ui/dashboard/main_screen.dart';
import 'package:card_craft/src/ui/register/register_screen.dart';
import 'package:card_craft/src/ui/register/staff_registration/staff_register_screen.dart';
import 'package:card_craft/src/utility/validation_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SchoolCodeScreen extends StatefulWidget {
  const SchoolCodeScreen({super.key});

  @override
  State<SchoolCodeScreen> createState() => _SchoolCodeScreenState();
}

class _SchoolCodeScreenState extends State<SchoolCodeScreen> {
  var codeController = TextEditingController(text: "sukhmander@gmail.com");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ImageView(
              url: AppAssets.topRound,
              width: double.maxFinite,
              height: 150.h,
              fit: BoxFit.fill),
          ListView(children: [
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
            TextView(
              text: AppStrings.schoolVerification,
              color: colorPrimary,
              textSize: 20.sp,
              textAlign: TextAlign.center,
              style: AppTextStyleEnum.bold,
              fontFamily: Family.bold,
              lineHeight: 1.3,
            ),
            spaceVertical(space: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                children: [
                  CustomTextField(
                      controller: codeController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      paddingHorizontal: 20.0,
                      hasViewHight: false,
                      labelText: AppStrings.code,
                      hintText: "",
                      numberOfLines: 1,
                      hintFontWeight: FontWeight.w400,
                      hintTextColor: colorGray.withOpacity(0.6)),
                  spaceVertical(space: 30.h),
                  BlocConsumer<RoleBloc, RoleState>(
                    listener: (context, roleState) {},
                    builder: (context, roleState) {
                      return BlocConsumer<DetailBloc, DetailState>(
                        listener: (context, state) {
                          if (state is DetailSuccess) {
                            context.pushReplacementScreen(
                                nextScreen: roleState is RoleStaff
                                    ? StaffRegisterScreen()
                                    : RegisterScreen());
                          }
                        },
                        builder: (context, state) {
                          return Container(
                            height: 40.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: colorPrimary,
                                borderRadius: BorderRadius.circular(5.r)),
                            child: AppSimpleButton(
                              onDoneFuction: () async {
                                if (!ValidationUtil.emailValidation(
                                    email: codeController.text)) {
                                } else {
                                  context
                                      .read<DetailBloc>()
                                      .add(VerifyDetailEvent(map: {}));
                                }
                              },
                              buttonBackgroundColor: colorPrimary,
                              nameText: "Verify",
                              textSize: 18.sp,
                            ),
                          );
                        },
                      );
                    },
                  ),
                  spaceVertical(space: 10.h),
                  TapWidget(
                    onTap: () {},
                    child: TextView(
                      text:
                          "School codes typically refer to alphanumeric identifiers assigned to educational institutions or specific elements within them, such as institutional codes for standardized testing or course codes for individual classes.",
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
          Positioned(
            top: 35.h,
            left: 10.w,
            child: IconButton(
              icon: Icon(color: colorWhite, Icons.arrow_back),
              onPressed: () {context.back();},
            ),
          ),
        ],
      ),
    );
  }
}
