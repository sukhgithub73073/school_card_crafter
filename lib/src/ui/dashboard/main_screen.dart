import 'package:easy_localization/easy_localization.dart';
import 'package:card_craft/src/data/blocs/classes_bloc/classes_bloc.dart';
import 'package:card_craft/src/data/blocs/groups_bloc/groups_bloc.dart';
import 'package:card_craft/src/data/blocs/login_bloc/login_bloc.dart';
import 'package:card_craft/src/data/blocs/login_bloc/login_bloc.dart';
import 'package:card_craft/src/data/blocs/role_bloc/role_bloc.dart';
import 'package:card_craft/src/data/blocs/student_bloc/student_bloc.dart';
import 'package:card_craft/src/data/blocs/subject_bloc/subject_bloc.dart';
import 'package:card_craft/src/data/blocs/teacher_bloc/teacher_bloc.dart';
import 'package:card_craft/src/extension/app_extension.dart';
import 'package:card_craft/src/ui/choose_language_screen.dart';
import 'package:card_craft/src/ui/dashboard/class_groups/classes_screen.dart';
import 'package:card_craft/src/ui/dashboard/class_groups/groups_screen.dart';
import 'package:card_craft/src/ui/dashboard/staff/staff_screen.dart';
import 'package:card_craft/src/ui/dashboard/students/student_screen.dart';
import 'package:card_craft/src/core/app_assets.dart';
import 'package:card_craft/src/core/app_colors.dart';
import 'package:card_craft/src/core/app_image_view.dart';
import 'package:card_craft/src/core/app_tap_widget.dart';
import 'package:card_craft/src/core/app_text_style.dart';
import 'package:card_craft/src/core/common_space.dart';
import 'package:card_craft/src/core/text_view.dart';
import 'package:card_craft/src/data/blocs/dashboard_bloc/dashboard_bloc.dart';
import 'package:card_craft/src/ui/dashboard/drawer/drawer_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:card_craft/src/utility/app_data.dart';
import 'package:upgrader/upgrader.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  void initState() {
    super.initState();
    context.read<SubjectBloc>().add(GetSubjectEvent(map: {
          "school_code": "GSSS19543",
        }));

    context.read<TeacherBloc>().add(GetTeacherEvent(map: {
          'session': DateTime.now().year,
      "SearchText": "",
          "ProjectId": AppData.userModel.data.projectId,
        }));
    context.read<GroupsBloc>().add(GetGroupsEvent(map: {
          // 'college_id': '${AppData.userModel.data?.data.college.id ?? ""}',
          'session': DateTime.now().year
        }));
    context.read<ClassesBloc>().add(GetClassesEvent(map: {
          "school_code": "GSSS19543",
           "SearchText":""
        }));
  }

  @override
  Widget build(BuildContext context) {
    return UpgradeAlert(
      showReleaseNotes: false,
      cupertinoButtonTextStyle: TextStyle(color: colorPrimary),
      showLater: false,
      showIgnore: false,
      dialogStyle: UpgradeDialogStyle.cupertino,
      child: Scaffold(
        key: _key,
        backgroundColor: colorWhite,
        drawerEnableOpenDragGesture: true,
        drawer: Container(width: 250.w, child: DrawerScreen()),
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
                        text: "welcomeDescription",
                        color: colorWhite,
                        textSize: 13.sp,
                        textAlign: TextAlign.left,
                        style: AppTextStyleEnum.small,
                        fontFamily: Family.regular,
                        lineHeight: 1.3,
                      ),
                    ]),
              ),
              spaceVertical(space: 20.h),
              BlocConsumer<RoleBloc, RoleState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          if (state is RoleSuperAdmin ||
                              state is RolePrinterVendor ||
                              state is RoleOrganization) ...[
                            Column(
                              children: [
                                TapWidget(
                                  onTap: () {
                                    var state = context.read<RoleBloc>().state;
                                    if (state is RoleStaff) {
                                    } else {
                                      context.pushScreen(
                                          nextScreen: StaffScreen());
                                    }
                                  },
                                  child: Container(
                                    height: 90.h,
                                    width: 100.w,
                                    decoration: BoxDecoration(
                                        color: colorSecendryLight,
                                        borderRadius:
                                            BorderRadius.circular(5.r)),
                                    child: Center(
                                        child: Icon(
                                      Icons.groups,
                                      size: 50,
                                      color: colorPrimary,
                                    )),
                                  ),
                                ),
                                spaceVertical(space: 5.h),
                                BlocConsumer<TeacherBloc, TeacherState>(
                                  listener: (context, state) {},
                                  builder: (context, state) {
                                    return TextView(
                                      text: state is TeacherGetSuccess
                                          ? "${tr("staff")} (${state.teachersModel.data.length})"
                                          : "${tr("staff")} (--)",
                                      color: colorPrimary,
                                      textSize: 15.sp,
                                      textAlign: TextAlign.center,
                                      style: AppTextStyleEnum.medium,
                                      fontFamily: Family.medium,
                                      lineHeight: 1.3,
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                          Column(
                            children: [
                              TapWidget(
                                onTap: () {
                                  context.pushScreen(
                                      nextScreen: StudentScreen());
                                },
                                child: Container(
                                  height: 90.h,
                                  width: 100.w,
                                  decoration: BoxDecoration(
                                      color: colorSecendryLight,
                                      borderRadius: BorderRadius.circular(5.r)),
                                  child: Center(
                                    child: Icon(
                                      Icons.manage_accounts,
                                      size: 50,
                                      color: colorPrimary,
                                    ),
                                  ),
                                ),
                              ),
                              spaceVertical(space: 5.h),
                              BlocConsumer<StudentBloc, StudentState>(
                                listener: (context, state) {},
                                builder: (context, state) {
                                  return TextView(
                                    text: state is StudentGetSuccess
                                        ? "${tr("student")} (${state.studentsModel.data.length})"
                                        : "${tr("student")} (--)",
                                    color: colorPrimary,
                                    textSize: 15.sp,
                                    textAlign: TextAlign.center,
                                    style: AppTextStyleEnum.medium,
                                    fontFamily: Family.medium,
                                    lineHeight: 1.3,
                                  );
                                },
                              ),
                            ],
                          ),
                          if (state is RoleSuperAdmin ||
                              state is RolePrinterVendor) ...[
                            Column(
                              children: [
                                TapWidget(
                                  onTap: () {},
                                  child: Container(
                                    height: 90.h,
                                    width: 100.w,
                                    decoration: BoxDecoration(
                                        color: colorSecendryLight,
                                        borderRadius:
                                            BorderRadius.circular(5.r)),
                                    child: Center(
                                      child: Icon(
                                        Icons.group,
                                        size: 50,
                                        color: colorPrimary,
                                      ),
                                    ),
                                  ),
                                ),
                                spaceVertical(space: 5.h),
                                BlocConsumer<GroupsBloc, GroupsState>(
                                  listener: (context, groupsState) {},
                                  builder: (context, groupsState) {
                                    return TextView(
                                      text: groupsState is GroupsSuccess
                                          ? "${tr("Project")} (${groupsState.data.length})"
                                          : "${tr("Project")} (--)",
                                      color: colorPrimary,
                                      textSize: 15.sp,
                                      textAlign: TextAlign.center,
                                      style: AppTextStyleEnum.medium,
                                      fontFamily: Family.medium,
                                      lineHeight: 1.3,
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ],
                      ),
                      if (state is RoleSuperAdmin) ...[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              if (state is RoleSuperAdmin) ...[],
                              Column(
                                children: [
                                  TapWidget(
                                    onTap: () {},
                                    child: Container(
                                      height: 90.h,
                                      width: 100.w,
                                      decoration: BoxDecoration(
                                          color: colorSecendryLight,
                                          borderRadius:
                                              BorderRadius.circular(5.r)),
                                      child: Center(
                                        child: Icon(
                                          Icons.group,
                                          size: 50,
                                          color: colorPrimary,
                                        ),
                                      ),
                                    ),
                                  ),
                                  spaceVertical(space: 5.h),
                                  BlocConsumer<GroupsBloc, GroupsState>(
                                    listener: (context, groupsState) {},
                                    builder: (context, groupsState) {
                                      return TextView(
                                        text: groupsState is GroupsSuccess
                                            ? "${tr("Admin")} (${groupsState.data.length})"
                                            : "${tr("Admin")} (--)",
                                        color: colorPrimary,
                                        textSize: 15.sp,
                                        textAlign: TextAlign.center,
                                        style: AppTextStyleEnum.medium,
                                        fontFamily: Family.medium,
                                        lineHeight: 1.3,
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ],
                  );
                },
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     Column(
              //       children: [
              //         TapWidget(
              //           onTap: () {
              //             var state = context.read<RoleBloc>().state;
              //             if (state is RoleStaff) {
              //             } else {
              //               context.pushScreen(nextScreen: StaffScreen());
              //             }
              //           },
              //           child: Container(
              //             height: 90.h,
              //             width: 100.w,
              //             decoration: BoxDecoration(
              //                 color: colorSecendryLight,
              //                 borderRadius: BorderRadius.circular(5.r)),
              //             child: Center(
              //                 child: Icon(
              //               Icons.groups,
              //               size: 50,
              //               color: colorPrimary,
              //             )),
              //           ),
              //         ),
              //         spaceVertical(space: 5.h),
              //         BlocConsumer<TeacherBloc, TeacherState>(
              //           listener: (context, state) {},
              //           builder: (context, state) {
              //             return TextView(
              //               text: state is TeacherGetSuccess
              //                   ? "${tr("staff")} (${state.teachersModel.data.length})"
              //                   : "${tr("staff")} (--)",
              //               color: colorPrimary,
              //               textSize: 15.sp,
              //               textAlign: TextAlign.center,
              //               style: AppTextStyleEnum.medium,
              //               fontFamily: Family.medium,
              //               lineHeight: 1.3,
              //             );
              //           },
              //         ),
              //       ],
              //     ),
              //     Column(
              //       children: [
              //         TapWidget(
              //           onTap: () {
              //             context.pushScreen(nextScreen: StudentScreen());
              //           },
              //           child: Container(
              //             height: 90.h,
              //             width: 100.w,
              //             decoration: BoxDecoration(
              //                 color: colorSecendryLight,
              //                 borderRadius: BorderRadius.circular(5.r)),
              //             child: Center(
              //               child: Icon(
              //                 Icons.manage_accounts,
              //                 size: 50,
              //                 color: colorPrimary,
              //               ),
              //             ),
              //           ),
              //         ),
              //         spaceVertical(space: 5.h),
              //         BlocConsumer<StudentBloc, StudentState>(
              //           listener: (context, state) {},
              //           builder: (context, state) {
              //             return TextView(
              //               text: state is StudentGetSuccess
              //                   ? "${tr("student")} (${state.studentsModel.data.length})"
              //                   : "${tr("student")} (--)",
              //               color: colorPrimary,
              //               textSize: 15.sp,
              //               textAlign: TextAlign.center,
              //               style: AppTextStyleEnum.medium,
              //               fontFamily: Family.medium,
              //               lineHeight: 1.3,
              //             );
              //           },
              //         ),
              //       ],
              //     ),
              //     Column(
              //       children: [
              //         TapWidget(
              //           onTap: () {
              //             context.pushScreen(nextScreen: GroupsScreen());
              //           },
              //           child: Container(
              //             height: 90.h,
              //             width: 100.w,
              //             decoration: BoxDecoration(
              //                 color: colorSecendryLight,
              //                 borderRadius: BorderRadius.circular(5.r)),
              //             child: Center(
              //               child: Icon(
              //                 Icons.group,
              //                 size: 50,
              //                 color: colorPrimary,
              //               ),
              //             ),
              //           ),
              //         ),
              //         spaceVertical(space: 5.h),
              //         BlocConsumer<GroupsBloc, GroupsState>(
              //           listener: (context, groupsState) {},
              //           builder: (context, groupsState) {
              //             return TextView(
              //               text: groupsState is GroupsSuccess
              //                   ? "${tr("groups")} (${groupsState.data.length})"
              //                   : "${tr("groups")} (--)",
              //               color: colorPrimary,
              //               textSize: 15.sp,
              //               textAlign: TextAlign.center,
              //               style: AppTextStyleEnum.medium,
              //               fontFamily: Family.medium,
              //               lineHeight: 1.3,
              //             );
              //           },
              //         ),
              //       ],
              //     ),
              //   ],
              // ),
              // spaceVertical(space: 20.h),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     Column(
              //       children: [
              //         TapWidget(
              //           onTap: () {
              //             //context.pushScreen(nextScreen: ClassesScreen());
              //           },
              //           child: Container(
              //             height: 90.h,
              //             width: 100.w,
              //             decoration: BoxDecoration(
              //                 color: colorSecendryLight,
              //                 borderRadius: BorderRadius.circular(5.r)),
              //             child: Center(
              //                 child: Icon(
              //               Icons.calendar_month,
              //               size: 50,
              //               color: colorPrimary,
              //             )),
              //           ),
              //         ),
              //         spaceVertical(space: 5.h),
              //         BlocConsumer<ClassesBloc, ClassesState>(
              //           listener: (context, groupsState) {},
              //           builder: (context, groupsState) {
              //             return TextView(
              //               text: groupsState is ClassesGetSuccess
              //                   ? "${tr("classes")} (${groupsState.data.length})"
              //                   : "${tr("classes")} (--)",
              //               color: colorPrimary,
              //               textSize: 15.sp,
              //               textAlign: TextAlign.center,
              //               style: AppTextStyleEnum.medium,
              //               fontFamily: Family.medium,
              //               lineHeight: 1.3,
              //             );
              //           },
              //         ),
              //       ],
              //     ),
              //     Column(
              //       children: [
              //         TapWidget(
              //           onTap: () {
              //             //context.pushScreen(nextScreen: SubjectScreen());
              //           },
              //           child: Container(
              //             height: 90.h,
              //             width: 100.w,
              //             decoration: BoxDecoration(
              //                 color: colorSecendryLight,
              //                 borderRadius: BorderRadius.circular(5.r)),
              //             child: Center(
              //                 child: Icon(
              //               Icons.menu_book_sharp,
              //               size: 50,
              //               color: colorPrimary,
              //             )),
              //           ),
              //         ),
              //         spaceVertical(space: 5.h),
              //         BlocConsumer<SubjectBloc, SubjectState>(
              //           listener: (context, state) {
              //             // TODO: implement listener
              //           },
              //           builder: (context, state) {
              //             return TextView(
              //               text: state is SubjectGetSuccess
              //                   ? "${tr("subject")} (${state.responseModel.data.length})"
              //                   : "${tr("subject")} (--)",
              //               color: colorPrimary,
              //               textSize: 15.sp,
              //               textAlign: TextAlign.center,
              //               style: AppTextStyleEnum.medium,
              //               fontFamily: Family.medium,
              //               lineHeight: 1.3,
              //             );
              //           },
              //         ),
              //       ],
              //     ),
              //     Column(
              //       children: [
              //         TapWidget(
              //           onTap: () {},
              //           child: Container(
              //             height: 90.h,
              //             width: 100.w,
              //             decoration: BoxDecoration(
              //                 color: colorSecendryLight,
              //                 borderRadius: BorderRadius.circular(5.r)),
              //             child: Center(
              //                 child: Icon(
              //               Icons.family_restroom,
              //               size: 50,
              //               color: colorPrimary,
              //             )),
              //           ),
              //         ),
              //         spaceVertical(space: 5.h),
              //         TextView(
              //           text: "${tr("parents")} (--)",
              //           color: colorPrimary,
              //           textSize: 15.sp,
              //           textAlign: TextAlign.center,
              //           style: AppTextStyleEnum.medium,
              //           fontFamily: Family.medium,
              //           lineHeight: 1.3,
              //         ),
              //       ],
              //     ),
              //   ],
              // ),
            ]),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 40.0, horizontal: 10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TapWidget(
                        onTap: () {
                          _key.currentState!.openDrawer();
                        },
                        child: Icon(
                          Icons.menu,
                          color: colorWhite,
                          size: 25.h,
                        ),
                      ),
                      TapWidget(
                        onTap: () {
                          context.pushScreen(
                              nextScreen: ChooseLanguageScreen(
                                  fromWhere: "MainScreen"));
                        },
                        child: Icon(
                          Icons.g_translate,
                          color: colorWhite,
                          size: 20.h,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextView(
                      text:
                          "${AppData.userModel.data?.name}\n${AppData.userModel.data?.role}",
                      color: colorWhite,
                      textSize: 15.sp,
                      textAlign: TextAlign.center,
                      style: AppTextStyleEnum.regular,
                      fontFamily: Family.regular,
                      lineHeight: 1.3,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
