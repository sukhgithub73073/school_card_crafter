import 'package:card_craft/src/core/app_assets.dart';
import 'package:card_craft/src/core/app_button.dart';
import 'package:card_craft/src/core/app_dialog.dart';
import 'package:card_craft/src/core/app_image_view.dart';
import 'package:card_craft/src/data/blocs/language_bloc/language_bloc.dart';
import 'package:card_craft/src/data/blocs/role_bloc/role_bloc.dart';
import 'package:card_craft/src/data/models/language_model.dart';
import 'package:card_craft/src/extension/app_extension.dart';
import 'package:card_craft/src/ui/dashboard/main_screen.dart';
import 'package:card_craft/src/ui/login/login_screen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:card_craft/src/core/app_colors.dart';
import 'package:card_craft/src/core/app_tap_widget.dart';
import 'package:card_craft/src/core/app_text_style.dart';
import 'package:card_craft/src/core/common_space.dart';
import 'package:card_craft/src/core/text_view.dart';
import 'package:hive_storage/hive_storage.dart';

class ChooseLanguageScreen extends StatefulWidget {
  final String fromWhere;

  ChooseLanguageScreen({super.key, required this.fromWhere});

  @override
  State<ChooseLanguageScreen> createState() => _ChooseLanguageScreenState();
}

class _ChooseLanguageScreenState extends State<ChooseLanguageScreen> {
  var languageList = [
    LanguageModel(name: "English", locale: "en", isSelect: false),
    LanguageModel(name: "हिंदी", locale: "hi", isSelect: false),
    LanguageModel(name: "ਪੰਜਾਬੀ", locale: "pa", isSelect: false)
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      var locale = await getHiveStorage.read<String>(
          key: "CURRENT_LOCALE", defaultValue: "en");
      print(">>>>>>>>>>>>>>>>>>>>>>>>>${locale}");
      for (var item in languageList) {
        print(">>>>>>>>>>>>>>>>>>>>>>>>>${item.locale == locale}");
        item.isSelect = item.locale == locale;
      }
      setState(() {
      });
    });
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
                spaceVertical(space: 10.h),
                TextView(
                  text: "chooseLangugae",
                  color: colorPrimary,
                  textSize: 20.sp,
                  textAlign: TextAlign.center,
                  style: AppTextStyleEnum.bold,
                  fontFamily: Family.bold,
                  lineHeight: 1.3,
                ),
                spaceVertical(space: 20.h),
                GridView.builder(
                    padding: EdgeInsets.all(8.0),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20.0,
                        mainAxisSpacing: 20.0,
                        childAspectRatio: 2),
                    itemCount: languageList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return TapWidget(
                        onTap: () {
                          for (var item in languageList) {
                            item.isSelect = false;
                          }
                          languageList[index].isSelect = true;

                          // getHiveStorage.write(
                          //     key: "CURRENT_LOCALE",
                          //     value: languageList[index].locale);
                          // context.read<LanguageBloc>().add(ChangeLanguageEvent(
                          //     locale: languageList[index].locale));
                          setState(() {});
                        },
                        child: Container(
                          height: 30.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  color: languageList[index].isSelect
                                      ? colorPrimary
                                      : colorBlack)),
                          child: Center(
                            child: TextView(
                              text: languageList[index].name,
                              color: languageList[index].isSelect
                                  ? colorPrimary
                                  : colorBlack,
                              textSize: 13.sp,
                              textAlign: TextAlign.center,
                              style: AppTextStyleEnum.bold,
                              fontFamily: Family.bold,
                              lineHeight: 1.3,
                            ),
                          ),
                        ),
                      );
                    }),
              ]),
            ],
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Container(
              height: 40.h,
              child: AppSimpleButton(
                onDoneFuction: () async {
                  getHiveStorage.write(
                      key: "CURRENT_LOCALE",
                      value: languageList
                          .firstWhere((element) => element.isSelect)
                          .locale);
                  context.read<LanguageBloc>().add(ChangeLanguageEvent(
                      locale: languageList
                          .firstWhere((element) => element.isSelect)
                          .locale));
                  context.pushReplacementScreen(
                      nextScreen: widget.fromWhere == "LoginScreen"
                          ? LoginScreen()
                          : MainScreen());
                },
                buttonBackgroundColor: colorPrimary,
                nameText: "submit",
                textSize: 18.sp,
              ),
            ),
          ),
        );
      },
    );
  }
}
