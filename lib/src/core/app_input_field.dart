import 'package:easy_localization/easy_localization.dart';
import 'package:card_craft/src/core/app_colors.dart';
import 'package:card_craft/src/core/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef StringToVoidFunc = void Function(String);

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final int? lines;
  final bool? obsecureText;
  final Color? borderColor;
  final Widget? preffixicon;
  final Widget? suffixicon;
  final Widget? prefix;
  final Color? hintTextColor;
  final Color? prefixIconColor;
  final int? numberOfLines;
  final int? maxLength;
  final double paddingHorizontal;
  final bool? readOnly;
  final TextInputAction? textInputAction;
  final FontWeight? hintFontWeight;
  final double? hintTextSize;
  final TextInputType? keyboardType;
  final bool? enabled;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final StringToVoidFunc? onChanged;
  final StringToVoidFunc? onFieldSubmitted;
  final String? initialValue;
  final Color? textColor;
  final String? fontFamily;
  final double? borderRadius;
  final bool hasViewHight;
  final EdgeInsets? contentPadding;
  final String? error;
  final GestureTapCallback? onTab;
  final  validator;

  const CustomTextField({
    super.key,
    this.onChanged,
    this.hintText = "",
    this.labelText = "",
    this.lines,
    this.obsecureText,
    this.borderColor,
    this.preffixicon,
    this.prefix,
    this.hintTextColor,
    this.prefixIconColor,
    this.numberOfLines,
    this.maxLength,
    this.paddingHorizontal = 0,
    this.suffixicon,
    this.readOnly,
    this.textInputAction,
    this.hintFontWeight,
    this.hintTextSize,
    this.keyboardType,
    this.enabled,
    this.controller,
    this.inputFormatters,
    this.onFieldSubmitted,
    this.initialValue,
    this.textColor,
    this.onTab,
    this.fontFamily,
    this.borderRadius,
    this.hasViewHight = true,
    this.contentPadding,
    this.error,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10.0,
      shadowColor: colorPrimary.withOpacity(0.8),
      borderRadius: BorderRadius.circular(5.h),
      color: Colors.white,
      child: TextFormField(
        initialValue: initialValue,

        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        inputFormatters: inputFormatters,
        controller: controller,
        keyboardType: keyboardType,
        validator: validator,
        textInputAction: textInputAction,
        enabled: enabled,
        obscureText: obsecureText ?? false,
        readOnly: readOnly ?? false,
        maxLines: numberOfLines,
        minLines: numberOfLines,
        maxLength: maxLength ?? null,
        onTap: onTab,
        style: TextStyle(
            letterSpacing: 1,
            color: textColor ?? colorBlack,
            fontFamily: fontFamily ?? Family.regular),
        decoration: InputDecoration(
            labelText: labelText == "" ? null : tr(labelText ?? ""),
            hintText: tr(hintText ?? ""),
            hintStyle: TextStyle(
              color: hintTextColor ?? colorBlack,
              fontWeight: hintFontWeight,
              fontSize: hintTextSize ?? 14.0,
            ),
            errorText: error != null && error!.trim().length > 0 ? error : null,
            prefixIcon: preffixicon,
            suffixIcon: suffixicon,
            prefix: prefix,
            contentPadding: contentPadding ??
                (paddingHorizontal == 0
                    ? EdgeInsets.zero
                    : EdgeInsets.symmetric(
                        horizontal: paddingHorizontal, vertical: 5)),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 5.h),
                borderSide: BorderSide(
                    color: borderColor ?? colorInputBorder.withOpacity(0.7))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 5.h),
                borderSide: BorderSide(
                    color: borderColor ?? colorInputBorder.withOpacity(0.7))),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 5.h),
                borderSide: BorderSide(color: borderColor ?? colorInputBorder)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 5.h),
                borderSide: BorderSide(
                    color: borderColor ?? colorInputBorder.withOpacity(0.7)))),
      ),
    );
  }
}
