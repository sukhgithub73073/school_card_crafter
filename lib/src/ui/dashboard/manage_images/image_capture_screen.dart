import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:card_craft/src/core/app_colors.dart';
import 'package:card_craft/src/core/app_tap_widget.dart';
import 'package:card_craft/src/data/blocs/image_capture_bloc/image_capture_bloc.dart';
import 'package:card_craft/src/extension/app_extension.dart';

import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:card_craft/src/core/app_button.dart';
import 'package:card_craft/src/core/app_colors.dart';
import 'package:card_craft/src/core/app_input_field.dart';
import 'package:card_craft/src/core/app_text_style.dart';
import 'package:card_craft/src/core/common_space.dart';
import 'package:card_craft/src/core/text_view.dart';
import 'package:card_craft/src/extension/app_extension.dart';

class ImageCaptureScreen extends StatefulWidget {
  const ImageCaptureScreen({super.key});

  @override
  State<ImageCaptureScreen> createState() => _ImageCaptureScreenState();
}

class _ImageCaptureScreenState extends State<ImageCaptureScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ImageCaptureBloc>().add(ClearImageCaptureEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          text: "imagesCapture",
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
        spaceVertical(space: 5.h),
        BlocConsumer<ImageCaptureBloc, ImageCaptureState>(
          listener: (context, state) {},
          builder: (context, state) {
            final List<XFile> list;
            if (state is ImageCaptureSuccess) {
              list = state.imagesList;
              return Expanded(
                  child: GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.only(bottom: 50),
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 3 images per row
                  crossAxisSpacing: 10.0, // Spacing between columns
                  mainAxisSpacing: 10.0, // Spacing between rows
                  childAspectRatio: 0.8, // Adjust height-to-width ratio
                ),
                itemCount: list.length,
                // Total items in the grid
                itemBuilder: (context, index) {
                  return TapWidget(
                    onTap: () {
                      // Add your tap functionality here
                    },
                    child: Card(
                      elevation: 10,
                      margin: EdgeInsets.all(5.r),
                      shadowColor: colorPrimary,
                      child: Column(
                        children: [
                          Expanded(
                            child: Image.file(
                              File(list[index].path),
                              // Replace with your image source
                              fit: BoxFit.cover,
                              // Fit image to the container
                              width: double
                                  .infinity, // Ensure the image spans the width
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.0),
                            child: Text(
                              "Sr No: ${index + 1}", // Display the index
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ));
            }
            return SizedBox.shrink();
          },
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ImageCaptureBloc>().add(CaptureImageCaptureEvent());
        },
        child: Icon(Icons.add, color: colorWhite),
        backgroundColor: colorPrimary,
      ),
    );
  }
}
