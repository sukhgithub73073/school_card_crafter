import 'package:card_craft/src/core/app_assets.dart';
import 'package:card_craft/src/core/app_colors.dart';
import 'package:card_craft/src/core/app_dialog.dart';
import 'package:card_craft/src/core/app_image_view.dart';
import 'package:card_craft/src/core/app_input_field.dart';
import 'package:card_craft/src/core/app_tap_widget.dart';
import 'package:card_craft/src/core/app_text_style.dart';
import 'package:card_craft/src/core/common_space.dart';
import 'package:card_craft/src/core/dialog_widgets/confirm_dialog.dart';
import 'package:card_craft/src/core/text_view.dart';
import 'package:card_craft/src/data/blocs/teacher_bloc/teacher_bloc.dart';
import 'package:card_craft/src/data/network/http_service.dart';
import 'package:card_craft/src/extension/app_extension.dart';
import 'package:card_craft/src/ui/register/staff_registration/staff_register_screen.dart';
import 'package:card_craft/src/ui/register/staff_registration/staff_update_screen.dart';
import 'package:card_craft/src/utility/app_data.dart';
import 'package:card_craft/src/utility/app_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:card_craft/src/utility/refresh_ctrl_view.dart';

class StaffScreen extends StatefulWidget {
  const StaffScreen({super.key});

  @override
  State<StaffScreen> createState() => _StaffScreenState();
}

class _StaffScreenState extends State<StaffScreen> {
  int page = 0;
  final refreshController = RefreshStateController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    context.read<TeacherBloc>().add(GetTeacherEvent(map: {
      "ProjectId": AppData.userModel.data.projectId,
      "start": 0,
      "next": 10,
      "SearchText": "",
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawerEnableOpenDragGesture: false,
      appBar: AppBar(
        backgroundColor: colorPrimary,
        leading: TapWidget(
          onTap: () {
            context.back();
          },
          child: Icon(
            Icons.arrow_back,
            color: colorWhite,
            size: 20.h,
          ),
        ),
        title: TextView(
          text: "staffList",
          color: colorWhite,
          textSize: 16.sp,
          textAlign: TextAlign.center,
          style: AppTextStyleEnum.medium,
          fontFamily: Family.medium,
          lineHeight: 1.3,
        ),
        actions: [],
      ),
      body: Column(children: [
        spaceVertical(space: 5.h),
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          child: Row(
            children: [
              Expanded(
                child: CustomTextField(
                    controller: TextEditingController(),
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                    paddingHorizontal: 20.0,
                    hasViewHight: false,
                    labelText: "",
                    hintText: "searchHere",
                    numberOfLines: 1,
                    preffixicon: Icon(Icons.search),
                    hintFontWeight: FontWeight.w400,
                    hintTextColor: colorGray.withOpacity(0.6)),
              ),
            ],
          ),
        ),
        BlocConsumer<TeacherBloc, TeacherState>(
          listener: (context, state) {
            printLog("Create listener>>>>>>>>>>>${state.toString()}");
          },
          builder: (context, state) {
            if (state is TeacherGetSuccess) {
              return state.teachersModel.data.isEmpty
                  ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
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
                  : Expanded(
                child: RefreshCtrlView(
                  refreshController: refreshController,
                  enableRefresh: true,
                  enableLoadMore: state.loadMore,
                  onLoading: () {
                    page = page + 1;
                    context
                        .read<TeacherBloc>()
                        .add(LoadMoreTeacherEvent(map: {
                      "ProjectId": AppData.userModel.data.projectId,
                      "start": state.teachersModel.data.length + 1,
                      "next": state.teachersModel.data.length + 10,
                      "SearchText": "",
                    }));

                    refreshController.loadComplete();
                  },
                  onRefresh: () async {
                    page = 0;
                    context.read<TeacherBloc>().add(GetTeacherEvent(map: {
                      "ProjectId": AppData.userModel.data.projectId,
                      "start": 0,
                      "next": 10,
                      "SearchText": "",
                    }));
                    refreshController.refreshCompleted();
                  },
                  child: ListView.builder(
                    // controller: scrollController,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: state.teachersModel.data.length,
                      itemBuilder: (c, i) {
                        return Card(
                          elevation: 10.h,
                          margin: EdgeInsets.all(10.r),
                          shadowColor: colorPrimary,
                          child: Stack(
                            children: [
                              true
                                  ? Positioned(
                                  right: 5,
                                  top: 5,
                                  child: Icon(
                                    Icons.verified,
                                    color: colorPrimary,
                                  ))
                                  : SizedBox.shrink(),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    false == ""
                                        ? CircleAvatar(
                                        radius: 45,
                                        backgroundColor:
                                        Colors.transparent,
                                        backgroundImage: AssetImage(
                                            AppAssets.logo))
                                        : CircleAvatar(
                                      radius: 45,
                                      backgroundColor:
                                      Colors.transparent,
                                      child: ClipOval(
                                        child: FadeInImage(
                                          image: NetworkImage(""),
                                          placeholder: AssetImage(
                                              AppAssets.logo),
                                          // Path to your placeholder image
                                          imageErrorBuilder:
                                              (context, error,
                                              stackTrace) {
                                            return Image.asset(
                                                AppAssets.logo,
                                                fit: BoxFit.cover);
                                          },
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    spaceHorizontal(space: 10.w),
                                    Expanded(
                                      child: Stack(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              TextView(
                                                text:
                                                "${state.teachersModel.data[i].name.toUpperCase()}",
                                                color: colorPrimary,
                                                textSize: 15.sp,
                                                textAlign:
                                                TextAlign.start,
                                                style:
                                                AppTextStyleEnum.bold,
                                                fontFamily: Family.medium,
                                                lineHeight: 1.3,
                                              ),
                                              spaceVertical(space: 2.h),
                                              TextView(
                                                text:
                                                "${state.teachersModel.data[i].mobileNo}",
                                                color: colorBlack
                                                    .withOpacity(0.6),
                                                textSize: 13.sp,
                                                textAlign:
                                                TextAlign.start,
                                                style: AppTextStyleEnum
                                                    .medium,
                                                fontFamily: Family.medium,
                                                lineHeight: 1.3,
                                              ),
                                              spaceVertical(space: 2.h),
                                              TextView(
                                                text:
                                                "${state.teachersModel.data[i].emailId}",
                                                color: colorBlack
                                                    .withOpacity(0.6),
                                                textSize: 13.sp,
                                                textAlign:
                                                TextAlign.start,
                                                style: AppTextStyleEnum
                                                    .medium,
                                                fontFamily: Family.medium,
                                                lineHeight: 1.3,
                                              ),
                                              TextView(
                                                text:
                                                "${state.teachersModel.data[i].id}",
                                                color: colorBlack
                                                    .withOpacity(0.6),
                                                textSize: 13.sp,
                                                textAlign:
                                                TextAlign.start,
                                                style: AppTextStyleEnum
                                                    .medium,
                                                fontFamily: Family.medium,
                                                lineHeight: 1.3,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                  right: 2,
                                  bottom: 0,
                                  child: TapWidget(
                                    onTap: () {
                                      //StaffUpdateScreen
                                      context.pushScreen(
                                          nextScreen: StaffUpdateScreen(
                                              staff: state.teachersModel
                                                  .data[i]));
                                    },
                                    child: CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.transparent,
                                      backgroundImage:
                                      AssetImage(AppAssets.editBg),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 10),
                                        child: Icon(
                                          Icons.edit,
                                          size: 15,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  )),
                              Positioned(
                                  right: 40,
                                  bottom: 0,
                                  child: TapWidget(
                                    onTap: () {
                                      appDialog(
                                          context: context,
                                          child: ConfirmDailog(
                                            title: "Confirm Delete",
                                            onTap: () {
                                              context.back();
                                            },
                                            message:
                                            "Are you want to delete this staff",
                                          ));
                                    },
                                    child: CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.transparent,
                                      backgroundImage:
                                      AssetImage(AppAssets.deleteBg),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 10),
                                        child: Icon(
                                          Icons.delete,
                                          size: 15,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        );
                      }),
                ),
              );
            }
            return SizedBox.shrink();
          },
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushScreen(nextScreen: StaffRegisterScreen());
          // context.pushScreen(nextScreen: RegisterScreen());
        },
        child: Icon(Icons.add, color: colorWhite),
        backgroundColor: colorPrimary,
      ),
    );
  }
}
