import 'package:easy_localization/easy_localization.dart';
import 'package:card_craft/src/core/app_colors.dart';
import 'package:card_craft/src/core/app_text_style.dart';
import 'package:flutter/material.dart';

enum AppTextStyleEnum { bold, medium, small, title, regular }

class TextView extends StatelessWidget {
  final String text;
  final dynamic color;

  final dynamic underlineColor;
  final AppTextStyleEnum? style;
  final bool? underline;
  final bool? strikeThrough;
  final dynamic textSize;
  final bool? capitalise;
  final int? maxlines;
  final TextAlign? textAlign;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final double? lineHeight;
  final FontStyle? fontStyle;
  final double? letterSpacing;
  final TextOverflow? overflow;

  const TextView(
      {super.key,
      required this.text,
      this.color,
      this.style,
      this.maxlines,
      this.textAlign,
      this.underline,
      this.textSize,
      this.fontFamily,
      this.fontWeight,
      this.lineHeight,
      this.fontStyle,
      this.underlineColor,
      this.strikeThrough,
      this.capitalise,
      this.letterSpacing,
      this.overflow});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Text(
      tr(text),
      maxLines: maxlines,
      overflow: maxlines != null ? TextOverflow.ellipsis : null,
      textAlign: textAlign,
      style: getStyle(color ?? colorBlack, textSize ?? getTextSize(width)),
    );
  }

  TextStyle getStyle(
    Color color,
    double textSize,
  ) {
    return TextStyle(
        overflow: overflow,
        color: color,
        letterSpacing: letterSpacing,
        fontWeight: fontWeight ?? getWeight(),
        fontSize: textSize,
        fontStyle: fontStyle ?? FontStyle.normal,
        height: lineHeight ?? 1.0,
        fontFamily: fontFamily ?? Family.regular,
        decorationColor: underlineColor ?? colorBlack,
        decorationThickness: 1,
        decoration: strikeThrough != null && strikeThrough!
            ? TextDecoration.lineThrough
            : underline != null
                ? TextDecoration.underline
                : null);
  }

  getTextSize(double width) {
    switch (style) {
      case AppTextStyleEnum.bold:
        return width * 0.08;
      case AppTextStyleEnum.title:
        return width * 0.08;
      case AppTextStyleEnum.medium:
        return width * 0.06;
      case AppTextStyleEnum.small:
        return width * 0.02;
      default:
        return width * 0.04;
    }
  }

  FontWeight getWeight() {
    switch (style) {
      case AppTextStyleEnum.bold:
        return FontWeight.w900;

      case AppTextStyleEnum.title:
        return FontWeight.w600;
      case AppTextStyleEnum.medium:
        return FontWeight.w500;
      case AppTextStyleEnum.regular:
        return FontWeight.w400;
      case AppTextStyleEnum.small:
        return FontWeight.w300;
      default:
        return FontWeight.w400;
    }
  }
}
