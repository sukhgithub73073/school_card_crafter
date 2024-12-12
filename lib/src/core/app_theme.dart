import 'package:card_craft/src/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static ThemeData get theme {
    ThemeData base = ThemeData.light();

    return base.copyWith(
      scaffoldBackgroundColor: colorWhite,
      cardColor: colorWhite,
      textTheme: base.textTheme.copyWith(
        bodySmall: base.textTheme.bodySmall!.copyWith(
          color: Color(0xffa80e0e),
        ),
      ),
      brightness: Brightness.dark,

      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
    );
  }

  static ThemeData get darkTheme {
    ThemeData base = ThemeData.dark();

    return base.copyWith(
      scaffoldBackgroundColor: colorBlack,
      cardColor: colorBlack,
      textTheme: base.textTheme.copyWith(
        bodySmall: base.textTheme.bodySmall!.copyWith(
          color: Color(0xffcdcdcd),
        ),
      ),
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
    );
  }
}
