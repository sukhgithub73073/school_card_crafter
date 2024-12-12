import 'package:card_craft/src/core/app_assets.dart';
import 'package:card_craft/src/core/app_colors.dart';
import 'package:card_craft/src/core/app_image_view.dart';
import 'package:card_craft/src/data/blocs/language_bloc/language_bloc.dart';
import 'package:card_craft/src/data/blocs/login_bloc/login_bloc.dart';
import 'package:card_craft/src/data/blocs/role_bloc/role_bloc.dart';
import 'package:card_craft/src/enums/role_enum.dart';
import 'package:card_craft/src/extension/app_extension.dart';
import 'package:card_craft/src/ui/login/login_screen.dart';
import 'package:card_craft/src/ui/role_selection/role_selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:card_craft/src/ui/dashboard/main_screen.dart';
import 'package:card_craft/src/ui/onbording/onbording_a.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_storage/hive_storage.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(Duration(seconds: 3)).then((value) async {
        var locale = await getHiveStorage.read<String>(
            key: "CURRENT_LOCALE", defaultValue: "en");
        context
            .read<LanguageBloc>()
            .add(ChangeLanguageEvent(locale: locale ?? "en"));

        //UpdateLoginEvent
        var loginResponse = await getHiveStorage.read<String>(
            key: "LOGIN_RESPONSE", defaultValue: "");
        if (loginResponse == "") {
          context.pushReplacementScreen(nextScreen: LoginScreen());
        } else {
          var CURRENT_ROLE = await getHiveStorage.read<String>(
              key: "CURRENT_ROLE", defaultValue: "");

          context.read<RoleBloc>().add(ChangeRoleEvent(
              roleEnum: CURRENT_ROLE == "SuperAdmin"
                  ? RoleEnum.SuperAdmin
                  : CURRENT_ROLE == "PrinterVendor"
                      ? RoleEnum.PrinterVendor
                      : CURRENT_ROLE == "Organization"
                          ? RoleEnum.Organization
                          : CURRENT_ROLE == "Staff"
                              ? RoleEnum.Staff
                              : RoleEnum.student));
          context.read<LoginBloc>().add(UpdateLoginEvent());

          context.pushReplacementScreen(nextScreen: MainScreen());
        }
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                gradient: RadialGradient(colors: [
              colorSecendry,
              Colors.white,
            ], center: Alignment.topLeft, radius: 0.5.r)),
          ),
          Center(
              child: ImageView(
            height: 150.h,
            width: 150.w,
            url: AppAssets.logo,
            imageType: ImageType.asset,
          )),
        ],
      ),
    );
  }
}
