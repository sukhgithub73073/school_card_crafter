import 'package:card_craft/src/core/app_assets.dart';
import 'package:card_craft/src/core/app_colors.dart';
import 'package:card_craft/src/core/app_dialog.dart';
import 'package:card_craft/src/core/app_image_view.dart';
import 'package:card_craft/src/core/app_loader.dart';
import 'package:card_craft/src/core/app_tap_widget.dart';
import 'package:card_craft/src/core/app_text_style.dart';
import 'package:card_craft/src/core/common_space.dart';
import 'package:card_craft/src/core/dialog_widgets/failure_message_dialog.dart';
import 'package:card_craft/src/core/text_view.dart';
import 'package:card_craft/src/data/blocs/groups_bloc/groups_bloc.dart';
import 'package:card_craft/src/extension/app_extension.dart';
import 'package:card_craft/src/ui/dashboard/class_groups/create_group_screen.dart';
import 'package:card_craft/src/utility/app_data.dart';
import 'package:card_craft/src/utility/app_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GroupsScreen extends StatefulWidget {
  const GroupsScreen({super.key});

  @override
  State<GroupsScreen> createState() => _GroupsScreenState();
}

class _GroupsScreenState extends State<GroupsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GroupsBloc>().add(GetGroupsEvent(map: {

      'session': DateTime.now().year
    }));

  }
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
                    spaceVertical(space: 20.h),
                    BlocConsumer<GroupsBloc, GroupsState>(
                      listener: (context, state) {
                        printLog(
                            "GroupsBloc listener>>>>>>>>>>>${state.toString()}");

                      },
                      builder: (context, state) {
                        if (state is GroupsSuccess) {
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
                                        child: TextView(
                                          text:
                                              "${state.data[i].id}",
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
                      onTap: () {context.back();},
                      child: Icon(
                        Icons.arrow_back,
                        color: colorWhite,
                        size: 20.h,
                      ),
                    ),
                    spaceHorizontal(space: 10.w),
                    TextView(
                      text: "groups",
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
          context.pushScreen(nextScreen: CreateGroupScreen());
        },
        child: Icon(Icons.add, color: colorWhite),
        backgroundColor: colorPrimary,
      ),
    );
  }
}
