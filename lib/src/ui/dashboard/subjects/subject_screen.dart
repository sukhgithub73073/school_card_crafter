import 'package:card_craft/src/core/app_assets.dart';
import 'package:card_craft/src/core/app_colors.dart';
import 'package:card_craft/src/core/app_dialog.dart';
import 'package:card_craft/src/core/app_image_view.dart';
import 'package:card_craft/src/core/app_loader.dart';
import 'package:card_craft/src/core/app_tap_widget.dart';
import 'package:card_craft/src/core/app_text_style.dart';
import 'package:card_craft/src/core/common_space.dart';
import 'package:card_craft/src/core/text_view.dart';

import 'package:card_craft/src/data/blocs/groups_bloc/groups_bloc.dart';
import 'package:card_craft/src/data/blocs/subject_bloc/subject_bloc.dart';
import 'package:card_craft/src/extension/app_extension.dart';
import 'package:card_craft/src/ui/dashboard/subjects/create_subject_screen.dart';

import 'package:card_craft/src/utility/app_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubjectScreen extends StatefulWidget {
  const SubjectScreen({super.key});

  @override
  State<SubjectScreen> createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
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
                  padding: EdgeInsets.symmetric(horizontal: 10),
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
                    spaceVertical(space: 20.h),

                    BlocConsumer<SubjectBloc, SubjectState>(
                      listener: (context, state) {
                        if (state is SubjectGetLoading) {
                          printLog(
                              "Create listener>>>>>>>>>>>SubjectLoaderShow");
                          // appLoader(context);
                        } else if (state is SubjectGetLoadingDismiss) {
                          // context.dissmissLoading();
                        }
                      },
                      builder: (context, state) {
                        if (state is SubjectGetSuccess) {
                          return state.responseModel.data.isEmpty
                              ? Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 40),
                                  child: TextView(
                                    text: "noRecordsFound",
                                    color: colorBlack,
                                    textSize: 12.sp,
                                    textAlign: TextAlign.center,
                                    style: AppTextStyleEnum.medium,
                                    fontFamily: Family.medium,
                                    lineHeight: 1.3,
                                  ),
                                )
                              : ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: state.responseModel.data.length,
                                  itemBuilder: (c, i) {
                                    return Card(
                                      elevation: 10.h,
                                      margin: EdgeInsets.all(10.r),
                                      shadowColor: colorPrimary,
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: TextView(
                                          text:
                                              "${state.responseModel.data[i]["subject_name"]}",
                                          color: colorPrimary,
                                          textSize: 15.sp,
                                          textAlign: TextAlign.start,
                                          style: AppTextStyleEnum.medium,
                                          fontFamily: Family.medium,
                                          lineHeight: 1.3,
                                        ),
                                      ),
                                    );
                                  });
                        }
                        return SizedBox.shrink();
                      },
                    ),
                  ]),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
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
                      text: "subject",
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
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushScreen(nextScreen: CreateSubjectScreen());
        },
        child: Icon(Icons.add, color: colorWhite),
        backgroundColor: colorPrimary,
      ),
    );
  }
}
