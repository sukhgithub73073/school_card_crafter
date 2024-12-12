import 'package:card_craft/src/core/app_assets.dart';
import 'package:card_craft/src/core/app_colors.dart';
import 'package:card_craft/src/core/app_image_view.dart';
import 'package:card_craft/src/core/app_text_style.dart';
import 'package:card_craft/src/core/common_space.dart';
import 'package:card_craft/src/core/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShareTab extends StatefulWidget {
  const ShareTab({super.key});

  @override
  State<ShareTab> createState() => _ShareTabState();
}

class _ShareTabState extends State<ShareTab> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: colorWhite,
        body: LayoutBuilder(builder: (context, constraints) {
          return ListView(children: [],);
        }),
      ),
    );
  }
}
