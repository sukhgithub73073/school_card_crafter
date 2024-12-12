import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:card_craft/src/core/app_assets.dart';
import 'package:card_craft/src/core/app_colors.dart';
import 'package:card_craft/src/core/app_image_view.dart';
import 'package:card_craft/src/core/app_tap_widget.dart';
import 'package:card_craft/src/core/app_text_style.dart';
import 'package:card_craft/src/core/common_space.dart';
import 'package:card_craft/src/core/drop_down/drop_list_model.dart';
import 'package:card_craft/src/core/text_view.dart';
import 'package:card_craft/src/data/blocs/classes_bloc/classes_bloc.dart';
import 'package:card_craft/src/data/blocs/groups_bloc/groups_bloc.dart';
import 'package:card_craft/src/extension/app_extension.dart';
import 'package:card_craft/src/ui/dashboard/class_groups/create_classes_screen.dart';
import 'package:card_craft/src/utility/app_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class ClassesScreen extends StatefulWidget {
  const ClassesScreen({super.key});

  @override
  State<ClassesScreen> createState() => _ClassesScreenState();
}

class _ClassesScreenState extends State<ClassesScreen> {
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

                    // BlocConsumer<GroupsBloc, GroupsState>(
                    //   listener: (context, state) {},
                    //   builder: (context, state) {
                    //     if (state is GroupsSuccess) {
                    //       printLog(
                    //           "builder >>>>>>>>>>>>>>>>>${state is GroupsSuccess}");
                    //       List<DropListModel> list = [];
                    //       state.data.forEach((element) {
                    //         list.add(DropListModel(
                    //             id: "${element.id}",
                    //             name: "${element.groupName}"));
                    //       });
                    //       return CustomDropdown<DropListModel>.search(
                    //         hintText: tr("selectGroup"),
                    //         items: list,
                    //         excludeSelected: false,
                    //         onChanged: (item) {
                    //           printLog(
                    //               "onSelectonSelect>>>>>>>>>>>>>>>>>>>>>>${item?.id}");
                    //           context
                    //               .read<ClassesBloc>()
                    //               .add(GetClassesByGroupEvent(map: {
                    //             "school_code": "GSSS19543",
                    //             "group_id": item?.id ?? "",
                    //           }));
                    //           },
                    //       );
                    //     } else {
                    //       return SizedBox.shrink();
                    //     }
                    //   },
                    // ),

                    BlocConsumer<ClassesBloc, ClassesState>(
                      listener: (context, state) {
                        if (state is ClassesGetLoading) {
                          printLog(
                              "Create listener>>>>>>>>>>>ClassesLoaderShow");
                          // appLoader(context);
                        } else if (state is ClassesGetLoadingDismiss) {
                          // context.dissmissLoading();
                        }
                      },
                      builder: (context, state) {
                        if (state is ClassesGetSuccess) {
                          return state.data.isEmpty
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
                                  itemCount: state.data.length,
                                  itemBuilder: (c, i) {
                                    return Card(
                                      elevation: 10.h,
                                      margin: EdgeInsets.all(10.r),
                                      shadowColor: colorPrimary,
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TextView(
                                              text:
                                                  "${state.data[i].className}",
                                              color: colorPrimary,
                                              textSize: 15.sp,
                                              textAlign: TextAlign.start,
                                              style: AppTextStyleEnum.medium,
                                              fontFamily: Family.medium,
                                              lineHeight: 1.3,
                                            ),
                                            spaceVertical(space: 5.h),
                                            TextView(
                                              text: "No of Student : 200",
                                              color: colorBlack,
                                              textSize: 11.sp,
                                              textAlign: TextAlign.start,
                                              style: AppTextStyleEnum.medium,
                                              fontFamily: Family.medium,
                                              lineHeight: 1.3,
                                            ),
                                            spaceVertical(space: 5.h),
                                            TextView(
                                              text: "No of Subjects : 20",
                                              color: colorBlack,
                                              textSize: 11.sp,
                                              textAlign: TextAlign.start,
                                              style: AppTextStyleEnum.medium,
                                              fontFamily: Family.medium,
                                              lineHeight: 1.3,
                                            ),
                                          ],
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
                      text: "classes",
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
          context.pushScreen(nextScreen: CreateClassesScreen());
        },
        child: Icon(Icons.add, color: colorWhite),
        backgroundColor: colorPrimary,
      ),
    );
  }
}
