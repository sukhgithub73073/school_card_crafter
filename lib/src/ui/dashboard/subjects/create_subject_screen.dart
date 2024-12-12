import 'package:card_craft/src/core/app_assets.dart';
import 'package:card_craft/src/core/app_dialog.dart';
import 'package:card_craft/src/core/app_image_view.dart';
import 'package:card_craft/src/core/app_loader.dart';
import 'package:card_craft/src/core/dialog_widgets/failure_message_dialog.dart';
import 'package:card_craft/src/core/dialog_widgets/success_message_dialog.dart';

import 'package:card_craft/src/data/blocs/role_bloc/role_bloc.dart';
import 'package:card_craft/src/data/blocs/subject_bloc/subject_bloc.dart';
import 'package:card_craft/src/utility/app_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:card_craft/src/core/app_button.dart';
import 'package:card_craft/src/core/app_colors.dart';
import 'package:card_craft/src/core/app_input_field.dart';
import 'package:card_craft/src/core/app_tap_widget.dart';
import 'package:card_craft/src/core/app_text_style.dart';
import 'package:card_craft/src/core/common_space.dart';
import 'package:card_craft/src/core/text_view.dart';
import 'package:card_craft/src/extension/app_extension.dart';

class CreateSubjectScreen extends StatefulWidget {
  CreateSubjectScreen({super.key});

  @override
  State<CreateSubjectScreen> createState() => _CreateSubjectScreenState();
}

class _CreateSubjectScreenState extends State<CreateSubjectScreen> {
  var nameController = TextEditingController(text: "Middle");


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RoleBloc, RoleState>(
      listener: (context, state) {},
      builder: (context, roleState) {
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
                spaceVertical(space: 20.h),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  padding: EdgeInsets.all(20.r),
                  decoration: BoxDecoration(
                      color: colorPrimary,
                      borderRadius: BorderRadius.circular(15.r)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            TextView(
                              text: "welcomeMessage",
                              color: colorWhite,
                              textSize: 15.sp,
                              textAlign: TextAlign.left,
                              style: AppTextStyleEnum.regular,
                              fontFamily: Family.regular,
                              lineHeight: 1.3,
                            ),
                            spaceHorizontal(space: 10.w),
                            Icon(
                              Icons.arrow_forward,
                              color: colorWhite,
                            )
                          ],
                        ),
                        spaceVertical(space: 10.h),
                        TextView(
                          text:
                              "welcomeDescription",
                          color: colorWhite,
                          textSize: 13.sp,
                          textAlign: TextAlign.left,
                          style: AppTextStyleEnum.small,
                          fontFamily: Family.regular,
                          lineHeight: 1.3,
                        ),
                      ]),
                ),
                spaceVertical(space: 30.h),
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
                          labelText: "subjectName",
                          hintText: "subjectNameHere",
                          numberOfLines: 1,
                          hintFontWeight: FontWeight.w400,
                          hintTextColor: colorGray.withOpacity(0.6)),
                      spaceVertical(space: 20.h),
                      spaceVertical(space: 30.h),
                      BlocConsumer<SubjectBloc, SubjectState>(
                        listener: (context, state) {
                          if (state is SubjectCreateLoading) {
                            printLog("listener>>>>>>>>>>>SubjectCreateLoading");
                            appLoader(context);
                          } else if (state is SubjectCreateLoadingDismiss) {
                            printLog(
                                "listener>>>>>>>>>>>SubjectCreateLoadingDismiss");
                            context.dissmissLoading();
                          } else if (state is SubjectCreateSuccess) {
                            printLog("listener>>>>>>>>>>>SubjectSuccess");

                            appDialog(
                                context: context,
                                child: SuccessDailog(
                                  title: "successfully",
                                  onTap: () {
                                    context.back();
                                    context.back();
                                  },
                                  message: "${state.responseModel.message}",
                                ));
                          } else if (state is SubjectCreateError) {
                            printLog("listener>>>>>>>>>>>SubjectError");

                            appDialog(
                                context: context,
                                child: ErrorDailog(
                                  title: "error",
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
                                {
                                  context
                                      .read<SubjectBloc>()
                                      .add(CreateSubjectEvent(map: {
                                        "school_code": "GSSS19543",
                                        "subject_name": nameController.text,
                                        "subject_id": getRandomId(
                                            text: nameController.text),
                                      }));
                                }
                              },
                              buttonBackgroundColor: colorPrimary,
                              nameText: "create",
                              textSize: 18.sp,
                            ),
                          );
                        },
                      ),
                      spaceVertical(space: 10.h),
                    ],
                  ),
                )
              ]),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 50.0, horizontal: 10.0),
                child: Row(
                  children: [
                    TapWidget(
                      onTap: () {},
                      child: Icon(
                        Icons.arrow_back,
                        color: colorWhite,
                        size: 20.h,
                      ),
                    ),
                    spaceHorizontal(space: 10.w),
                    TextView(
                      text: "createSubject",
                      color: colorWhite,
                      textSize: 16.sp,
                      textAlign: TextAlign.center,
                      style: AppTextStyleEnum.medium,
                      fontFamily: Family.medium,
                      lineHeight: 1.3,
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
