import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:card_craft/src/core/app_colors.dart';
import 'package:flutter/cupertino.dart';

CustomDropdownDecoration get customDropdownDecoration =>
    CustomDropdownDecoration(closedShadow: [
      BoxShadow(
          color: colorPrimary.withOpacity(0.8),
          blurRadius: 2,

          blurStyle: BlurStyle.normal) ,

    ], closedBorder: Border.all(color: colorInputBorder.withOpacity(0.7)));

