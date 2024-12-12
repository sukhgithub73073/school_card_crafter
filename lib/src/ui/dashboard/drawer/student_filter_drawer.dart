import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:card_craft/src/core/app_button.dart';
import 'package:card_craft/src/core/app_colors.dart';
import 'package:card_craft/src/core/app_tap_widget.dart';
import 'package:card_craft/src/core/app_text_style.dart';
import 'package:card_craft/src/core/common_space.dart';
import 'package:card_craft/src/core/drop_down/drop_list_model.dart';
import 'package:card_craft/src/core/text_view.dart';
import 'package:card_craft/src/data/blocs/classes_bloc/classes_bloc.dart';
import 'package:card_craft/src/data/blocs/groups_bloc/groups_bloc.dart';
import 'package:card_craft/src/data/blocs/student_bloc/student_bloc.dart';

import 'package:card_craft/src/extension/app_extension.dart';
import 'package:card_craft/src/utility/app_data.dart';
import 'package:card_craft/src/utility/app_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:card_craft/src/utility/decoration_util.dart';

class StudentFilterDrawer extends StatefulWidget {
  const StudentFilterDrawer({super.key});

  @override
  State<StudentFilterDrawer> createState() => _StudentFilterDrawerState();
}

class _StudentFilterDrawerState extends State<StudentFilterDrawer> {
  List<DropListModel> sessionList = [
    DropListModel(name: '2020-2021', id: "1"),
  ];
  var classSingleSelectController = SingleSelectController(DropListModel(id: "",name: "")) ;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: colorDrawerBg,
        body: Stack(
          children: [
            ListView(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.w),
              children: [
                TextView(
                  text: "studentsFilter",
                  color: colorPrimary,
                  textSize: 16.sp,
                  textAlign: TextAlign.center,
                  style: AppTextStyleEnum.medium,
                  fontFamily: Family.medium,
                  lineHeight: 1.3,
                ),
                spaceVertical(space: 20.h),
                // CustomDropdown<DropListModel>.search(
                //   hintText: tr("selectSession"),
                //   items: sessionList,
                //   excludeSelected: false,
                //   onChanged: (value) {
                //     printLog('changing value to: $value');
                //   },
                // ),
                // spaceVertical(space: 20.h),
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
                //       return CustomDropdown<DropListModel>(
                //         hintText: tr("selectGroup"),
                //         items: list,
                //         excludeSelected: false,
                //
                //         decoration: customDropdownDecoration,
                //         onChanged: (item) {
                //           AppData.studentMap["class_group_id"] = item!.id;
                //
                //           var data = state.data.firstWhere(
                //             (element) => element.id.toString() == item!.id,
                //           );
                //           classSingleSelectController.clear() ;
                //           context
                //               .read<ClassesBloc>()
                //               .add(GetClassEvent(groupItem: data));
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
                //             id: "${element.id}", name: "${element.className}"));
                //       });
                //       return CustomDropdown<DropListModel>(
                //         hintText: tr("selectClass"),
                //         items: list,
                //
                //         decoration: customDropdownDecoration,
                //         excludeSelected: false,
                //         onChanged: (item) {
                //           AppData.studentMap["class_id"] = item!.id;
                //         },
                //       );
                //     } else {
                //       return SizedBox.shrink();
                //     }
                //   },
                // ),
                spaceVertical(space: 20.h),
              ],
            ),
            Positioned(
                bottom: 10,
                right: 0,
                left: 0,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppSimpleButton(
                        onDoneFuction: () {
                          AppData.studentMap["page"] = 1 ;
                          context
                              .read<StudentBloc>()
                              .add(GetStudentEvent(map: AppData.studentMap));

                          context.back();
                        },
                        buttonBackgroundColor: colorPrimary,
                        nameText: "apply",
                        textSize: 18.sp,
                      ),
                      spaceHorizontal(space: 10.w),
                      AppSimpleButton(
                        onDoneFuction: context.back,
                        buttonBackgroundColor: colorGray,
                        nameText: "cancel",
                        textSize: 18.sp,
                      ),
                    ],
                  ),
                )),
            Positioned(
                right: 10,
                top: 10,
                child: TapWidget(
                  onTap: context.back,
                  child: Icon(
                    Icons.close,
                    color: colorBlack,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
