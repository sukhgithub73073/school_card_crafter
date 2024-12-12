import 'dart:io';

import 'package:camera/camera.dart';
import 'package:card_craft/src/data/blocs/cast_bloc/cast_bloc.dart';
import 'package:card_craft/src/data/blocs/login_bloc/login_bloc.dart';
import 'package:card_craft/src/data/models/cast_model.dart';
import 'package:card_craft/src/data/network/http_service.dart';
import 'package:card_craft/src/ui/register/student_registration/register_parent.dart';
import 'package:card_craft/src/ui/register/student_registration/student_data.dart';
import 'package:card_craft/src/ui/register/student_registration/take_image_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:card_craft/src/core/app_assets.dart';
import 'package:card_craft/src/core/app_dialog.dart';
import 'package:card_craft/src/core/dialog_widgets/failure_message_dialog.dart';
import 'package:card_craft/src/core/dialog_widgets/success_message_dialog.dart';
import 'package:card_craft/src/core/drop_down/drop_list_model.dart';

import 'package:card_craft/src/data/blocs/image_pick_bloc/image_pick_bloc.dart';
import 'package:card_craft/src/data/blocs/register_bloc/register_bloc.dart';
import 'package:card_craft/src/utility/app_data.dart';
import 'package:card_craft/src/utility/app_util.dart';
import 'package:card_craft/src/utility/decoration_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:card_craft/src/core/app_button.dart';
import 'package:card_craft/src/core/app_colors.dart';
import 'package:card_craft/src/core/app_image_view.dart';
import 'package:card_craft/src/core/app_input_field.dart';
import 'package:card_craft/src/core/app_tap_widget.dart';
import 'package:card_craft/src/core/app_text_style.dart';
import 'package:card_craft/src/core/common_space.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:card_craft/src/core/text_view.dart';
import 'package:card_craft/src/extension/app_extension.dart';
import 'package:radio_group_v2/radio_group_v2.dart';

class RegisterOne extends StatefulWidget {
  const RegisterOne({super.key});

  @override
  State<RegisterOne> createState() => _RegisterOneState();
}

class _RegisterOneState extends State<RegisterOne> {
  @override
  void initState() {
    super.initState();
    context.read<CastBloc>().add(GetCastEvent());
    context.read<RegisterBloc>().add(GetSerialNoEvent());
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              ImageView(
                  imageType: ImageType.asset,
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
                        child: Stack(
                          children: [
                            BlocConsumer<ImagePickBloc, ImagePickState>(
                              listener: (context, state) {},
                              builder: (context, state) {
                                if (state is ImagePickSuccess) {
                                  StudentData.selectedImage = state.file;
                                  return CircleAvatar(
                                    radius: 100,
                                    backgroundImage:
                                        FileImage(File(state.file.path)),
                                  );
                                } else {
                                  return (StudentData.selectedStudent?.image) !=
                                          ""
                                      ? CircleAvatar(
                                          radius: 100,
                                          backgroundImage: NetworkImage(
                                              "${ApisEndpoints.imagesPathStudent}${StudentData.selectedStudent?.image}"),
                                        )
                                      : CircleAvatar(
                                          radius: 100,
                                          backgroundImage:
                                              AssetImage(AppAssets.logo),
                                        );
                                }
                              },
                            ),
                            Positioned(
                                bottom: 0,
                                right: 10,
                                child: TapWidget(
                                  onTap: () async {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return SafeArea(
                                          child: Wrap(
                                            children: <Widget>[
                                              ListTile(
                                                leading:
                                                Icon(Icons.photo_library),
                                                title: Text('Gallery'),
                                                onTap: () {
                                                  Navigator.of(context).pop();
                                                  context
                                                      .read<ImagePickBloc>()
                                                      .add(
                                                      ChangeImagePickEvent());
                                                },
                                              ),
                                              ListTile(
                                                leading:
                                                Icon(Icons.photo_camera),
                                                title: Text('Camera'),
                                                onTap: () {
                                                  Navigator.of(context).pop();
                                                  context
                                                      .read<ImagePickBloc>()
                                                      .add(
                                                      CaptureImagePickEvent());
                                                },
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: colorBlack, width: 1.w),
                                          color: colorWhite,
                                          shape: BoxShape.circle),
                                      child: Icon(Icons.camera_alt)),
                                ))
                          ],
                        ),
                      ),
                    ),
                    spaceVertical(space: 10.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Column(
                        children: [
                          spaceVertical(space: 20.h),
                          // Container(
                          //   height: 40.h,
                          //   width: double.maxFinite,
                          //   decoration: BoxDecoration(
                          //       border: Border.all(color: Colors.grey),
                          //       boxShadow: [
                          //         BoxShadow(
                          //             color: colorPrimary.withOpacity(0.8),
                          //             blurRadius: 10,
                          //             blurStyle: BlurStyle.outer)
                          //       ],
                          //       borderRadius: BorderRadius.circular(10)),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     crossAxisAlignment: CrossAxisAlignment.center,
                          //     children: [
                          //       Expanded(
                          //         child: TapWidget(
                          //           onTap: () {
                          //             setState(() {
                          //               StudentData.admissionType = "new";
                          //             });
                          //           },
                          //           child: Container(
                          //             height: double.maxFinite,
                          //             decoration: BoxDecoration(
                          //                 color:
                          //                     StudentData.admissionType == "new"
                          //                         ? colorPrimary
                          //                         : colorWhite,
                          //                 borderRadius:
                          //                     BorderRadius.circular(10)),
                          //             child: Center(
                          //               child: TextView(
                          //                 text: "newAddmission",
                          //                 color:
                          //                     StudentData.admissionType == "new"
                          //                         ? colorWhite
                          //                         : colorGray,
                          //                 textSize: 16.sp,
                          //                 textAlign: TextAlign.center,
                          //                 style: AppTextStyleEnum.medium,
                          //                 fontFamily: Family.medium,
                          //                 lineHeight: 1.3,
                          //               ),
                          //             ),
                          //           ),
                          //         ),
                          //       ),
                          //       Expanded(
                          //         child: TapWidget(
                          //           onTap: () {
                          //             setState(() {
                          //               StudentData.admissionType = "old";
                          //             });
                          //           },
                          //           child: Container(
                          //             height: double.maxFinite,
                          //             decoration: BoxDecoration(
                          //                 color:
                          //                     StudentData.admissionType == "old"
                          //                         ? colorPrimary
                          //                         : colorWhite,
                          //                 borderRadius:
                          //                     BorderRadius.circular(10)),
                          //             child: Center(
                          //               child: TextView(
                          //                 text: "oldAddmission",
                          //                 color:
                          //                     StudentData.admissionType == "old"
                          //                         ? colorWhite
                          //                         : colorGray,
                          //                 textSize: 16.sp,
                          //                 textAlign: TextAlign.center,
                          //                 style: AppTextStyleEnum.medium,
                          //                 fontFamily: Family.medium,
                          //                 lineHeight: 1.3,
                          //               ),
                          //             ),
                          //           ),
                          //         ),
                          //       )
                          //     ],
                          //   ),
                          // ),
                          // spaceVertical(space: 20.h),
                          // CustomTextField(
                          //     controller: StudentData.srnoController,
                          //     textInputAction: TextInputAction.next,
                          //     keyboardType: TextInputType.text,
                          //     paddingHorizontal: 20.0,
                          //     hasViewHight: false,
                          //     labelText: "srNo",
                          //     hintText: "srNoHere",
                          //     numberOfLines: 1,
                          //     enabled: false,
                          //     hintFontWeight: FontWeight.w400,
                          //     hintTextColor: colorGray.withOpacity(0.6)),
                          // spaceVertical(space: 20.h),
                          CustomTextField(
                              controller: StudentData.nameController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              paddingHorizontal: 20.0,
                              hasViewHight: false,
                              labelText: "name",
                              hintText: "nameHere",
                              numberOfLines: 1,
                              hintFontWeight: FontWeight.w400,
                              hintTextColor: colorGray.withOpacity(0.6)),
                          spaceVertical(space: 20.h),

                          CustomTextField(
                              controller: StudentData.rollNoController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              paddingHorizontal: 20.0,
                              hasViewHight: false,
                              labelText: "rollNo",
                              hintText: "rollNoHere",
                              numberOfLines: 1,
                              hintFontWeight: FontWeight.w400,
                              hintTextColor: colorGray.withOpacity(0.6)),

                          spaceVertical(space: 20.h),
                          CustomTextField(
                              controller: StudentData.aadhaarController,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(12),
                              ],
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              paddingHorizontal: 20.0,
                              hasViewHight: false,
                              labelText: "aadhaarNumber",
                              hintText: "aadhaarNumberHere",
                              numberOfLines: 1,
                              hintFontWeight: FontWeight.w400,
                              hintTextColor: colorGray.withOpacity(0.6)),
                          spaceVertical(space: 20.h),
                          TapWidget(
                            onTap: () async {
                              DateTime? selectedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime.now(),
                                  builder:
                                      (BuildContext context, Widget? child) {
                                    return Theme(
                                      data: ThemeData.light().copyWith(
                                        primaryColor: colorPrimary,
                                        colorScheme: ColorScheme.light(
                                            primary: colorPrimary),
                                        buttonTheme: ButtonThemeData(
                                          textTheme: ButtonTextTheme.primary,
                                        ),
                                      ),
                                      child: child!,
                                    );
                                  });
                              if (selectedDate != null) {
                                String formattedDate =
                                    "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}";
                                StudentData.dobController.text =
                                    formattedDate; // Uprdate the text field with the selected date
                              }
                            },
                            child: CustomTextField(
                                controller: StudentData.dobController,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(12),
                                ],
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number,
                                paddingHorizontal: 20.0,
                                hasViewHight: false,
                                labelText: "dob",
                                hintText: "dobHere",
                                numberOfLines: 1,
                                enabled: false,
                                hintFontWeight: FontWeight.w400,
                                hintTextColor: colorGray.withOpacity(0.6)),
                          ),
                          spaceVertical(space: 20.h),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: RadioGroup(
                              controller: StudentData.genderCtrl,
                              values: [tr("male"), tr("female"), tr("other")],
                              indexOfDefault: 0,
                              orientation: RadioGroupOrientation.horizontal,
                              decoration: RadioGroupDecoration(
                                spacing: 10.0,
                                labelStyle: TextStyle(
                                  color: colorBlack,
                                ),
                                activeColor: colorPrimary,
                              ),
                            ),
                          ),
                          spaceVertical(space: 20.h),
                          CustomDropdown<DropListModel>.search(
                            initialItem: StudentData.selectReligion,
                            hintText: tr("selectReligion"),
                            items: getReligionList(),
                            decoration: customDropdownDecoration,
                            excludeSelected: false,
                            onChanged: (item) {
                              StudentData.selectedReligion = item;
                            },
                          ),
                          spaceVertical(space: 20.h),
                          BlocConsumer<CastBloc, CastState>(
                            listener: (context, state) {
                              print(
                                  ">>>>>>>>>>>>>>>>>>>>>>>>>>.${state.toString()}");
                            },
                            builder: (context, state) {
                              return state is CastLoaded
                                  ? Row(
                                      children: [
                                        Expanded(
                                          child: CustomDropdown<Caste>(
                                            hintText: tr("selectCaste"),
                                            items: state.casteModel.data.caste,
                                            decoration:
                                                customDropdownDecoration,
                                            excludeSelected: false,
                                            onChanged: (item) {
                                              StudentData.selectedCast = item;
                                              AppData.subCastList.clear();
                                              AppData.subCastList
                                                  .addAll(item?.subCaste ?? []);
                                            },
                                          ),
                                        ),
                                        spaceHorizontal(space: 10.w),
                                        Expanded(
                                          child: CustomDropdown<Caste>.search(
                                            hintText: tr("selectSubCaste"),
                                            items: AppData.subCastList,
                                            decoration:
                                                customDropdownDecoration,
                                            excludeSelected: false,
                                            onChanged: (item) {
                                              StudentData.selectedSubCast =
                                                  item;
                                            },
                                          ),
                                        ),
                                      ],
                                    )
                                  : SizedBox.shrink();
                            },
                          ),
                          spaceVertical(space: 20.h),
                          spaceVertical(space: 30.h),

                          Container(
                            height: 40.h,
                            width: double.infinity,
                            decoration: BoxDecoration(color: colorPrimary),
                            child: AppSimpleButton(
                              onDoneFuction: () async {
                                context.pushScreen(
                                    nextScreen: RegisterParent());
                              },
                              buttonBackgroundColor: colorPrimary,
                              nameText: "submit",
                              textSize: 18.sp,
                            ),
                          ),

                          spaceVertical(space: 10.h),
                        ],
                      ),
                    ),
                    spaceVertical(space: 10.h),
                  ]),
              Positioned(
                top: 5.h,
                left: 5.w,
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(color: colorWhite, Icons.arrow_back),
                      onPressed: () {
                        context.back();
                      },
                    ),
                    TextView(
                      text: "studentsRegistrationForm",
                      color: colorWhite,
                      textSize: 16.sp,
                      textAlign: TextAlign.center,
                      style: AppTextStyleEnum.medium,
                      fontFamily: Family.medium,
                      lineHeight: 1.3,
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
