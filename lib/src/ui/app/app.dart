import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart';
import 'package:card_craft/src/core/app_bloc_providers.dart';
import 'package:card_craft/src/core/app_strings.dart';
import 'package:card_craft/src/core/app_theme.dart';

import 'package:card_craft/src/data/blocs/language_bloc/language_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:card_craft/src/ui/splash/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upgrader/upgrader.dart';


class MyApp extends StatelessWidget {
  final String fontFamily = "Montserrat";

  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return AppBlocProvider(
      child: BlocConsumer<LanguageBloc, LanguageState>(
        listener: (context, state) {
          if (state is LanguageChange) {
            context.setLocale(Locale(state.locale));
          }
        },
        builder: (context, state) {
          return GetMaterialApp(
            title: AppStrings.appName,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.theme,
            darkTheme: AppTheme.theme,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            home: SplashView(),
          );
        },
      ),
    );
  }
}
