import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:card_craft/src/core/app_assets.dart';
import 'package:card_craft/src/core/app_button.dart';
import 'package:card_craft/src/core/app_colors.dart';
import 'package:card_craft/src/core/app_dialog.dart';
import 'package:card_craft/src/core/app_image_view.dart';
import 'package:card_craft/src/core/app_input_field.dart';
import 'package:card_craft/src/core/app_tap_widget.dart';
import 'package:card_craft/src/core/app_text_style.dart';
import 'package:card_craft/src/core/common_space.dart';
import 'package:card_craft/src/core/dialog_widgets/failure_message_dialog.dart';
import 'package:card_craft/src/core/dialog_widgets/success_message_dialog.dart';
import 'package:card_craft/src/core/text_view.dart';
import 'package:card_craft/src/data/blocs/image_pick_bloc/image_pick_bloc.dart';
import 'package:card_craft/src/data/blocs/pincode_bloc/pincode_bloc.dart';
import 'package:card_craft/src/data/blocs/student_bloc/student_bloc.dart';
import 'package:card_craft/src/data/blocs/update_bloc/update_bloc.dart';
import 'package:card_craft/src/data/models/pincode_model.dart';
import 'package:card_craft/src/data/network/http_service.dart';
import 'package:card_craft/src/enums/role_enum.dart';
import 'package:card_craft/src/enums/snack_type_enum.dart';
import 'package:card_craft/src/extension/app_extension.dart';
import 'package:card_craft/src/ui/dashboard/main_screen.dart';
import 'package:card_craft/src/ui/register/student_registration/student_data.dart';
import 'package:card_craft/src/utility/app_data.dart';
import 'package:card_craft/src/utility/app_util.dart';

class StudentUpdateScreen extends StatefulWidget {
  const StudentUpdateScreen({super.key});

  @override
  State<StudentUpdateScreen> createState() => _StudentUpdateScreenState();
}

class _StudentUpdateScreenState extends State<StudentUpdateScreen> {
  @override
  void initState() {
    super.initState();

    context.read<ImagePickBloc>().add(ClearImagePickEvent());
    StudentData.resetImage();
  }

  final dobFormatter = MaskTextInputFormatter(
    mask: '##-##-####',
    filter: {"#": RegExp(r'[0-9]')},
  );

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
                                print(
                                    "selectedImage>>>>>>>>${state.toString()}");
                                if (state is ImagePickSuccess) {
                                  StudentData.selectedImage = state.file;

                                  return CircleAvatar(
                                    radius: 100,
                                    backgroundImage:
                                        FileImage(File(state.file.path)),
                                  );
                                } else {
                                  StudentData.resetImage();
                                  return (StudentData
                                              .selectedStudent?.imageUrl) !=
                                          ""
                                      ? CircleAvatar(
                                          radius: 100,
                                          backgroundImage: NetworkImage(
                                              "${StudentData.selectedStudent?.imageUrl}"),
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
                          CustomTextField(
                              controller: StudentData.classController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              paddingHorizontal: 20.0,
                              hasViewHight: false,
                              labelText: "classesName",
                              hintText: "classesNameHere",
                              numberOfLines: 1,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter valid class name';
                                }
                                return null;
                              },
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
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter valid role number';
                                }
                                return null;
                              },
                              hintFontWeight: FontWeight.w400,
                              hintTextColor: colorGray.withOpacity(0.6)),
                          spaceVertical(space: 20.h),
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
                            controller: StudentData.dobController,
                            textInputAction: TextInputAction.next,
                            onChanged: (e) {},
                            keyboardType: TextInputType.number,
                            paddingHorizontal: 20.0,
                            hasViewHight: false,
                            labelText: "dob",
                            hintText: "dd-MM-yyyy",
                            numberOfLines: 1,
                            hintFontWeight: FontWeight.w400,
                            hintTextColor: colorGray.withOpacity(0.6),
                            inputFormatters: [
                              dobFormatter
                            ], // Apply the formatter here
                          ),

                          spaceVertical(space: 20.h),
                          CustomTextField(
                              controller: StudentData.nameControllerFather,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              paddingHorizontal: 20.0,
                              hasViewHight: false,
                              labelText: "fatherName",
                              hintText: "fatherNameHere",
                              prefix: Text(
                                "Mr ",
                                style: TextStyle(
                                    color: colorBlack,
                                    fontWeight: FontWeight.bold),
                              ),
                              numberOfLines: 1,
                              hintFontWeight: FontWeight.w400,
                              hintTextColor: colorGray.withOpacity(0.6)),
                          spaceVertical(space: 20.h),
                          CustomTextField(
                              controller: StudentData.nameControllerMother,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              paddingHorizontal: 20.0,
                              hasViewHight: false,
                              labelText: "motherName",
                              hintText: "motherNameHere",
                              prefix: Text(
                                "Mrs ",
                                style: TextStyle(
                                    color: colorBlack,
                                    fontWeight: FontWeight.bold),
                              ),
                              numberOfLines: 1,
                              hintFontWeight: FontWeight.w400,
                              hintTextColor: colorGray.withOpacity(0.6)),
                          spaceVertical(space: 20.h),
                          //
                          // CustomTextField(
                          //     controller: StudentData.stateController,
                          //     textInputAction: TextInputAction.next,
                          //     keyboardType: TextInputType.text,
                          //     paddingHorizontal: 20.0,
                          //     hasViewHight: false,
                          //     labelText: "state",
                          //     hintText: "state",
                          //     numberOfLines: 1,
                          //     hintFontWeight: FontWeight.w400,
                          //     hintTextColor: colorGray.withOpacity(0.6)),
                          // spaceVertical(space: 20.h),
                          CustomTextField(
                              controller: StudentData.districtController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              paddingHorizontal: 20.0,
                              hasViewHight: false,
                              labelText: "district",
                              hintText: "district",
                              numberOfLines: 1,
                              hintFontWeight: FontWeight.w400,
                              hintTextColor: colorGray.withOpacity(0.6)),
                          spaceVertical(space: 20.h),
                          // BlocConsumer<PincodeBloc, PincodeState>(
                          //   listener: (context, state) {
                          //     if (state is PincodeError) {
                          //       appDialog(
                          //           context: context,
                          //           child: ErrorDailog(
                          //             title: "invalidPincode",
                          //             onTap: () {
                          //               context.back();
                          //             },
                          //             message: "${state.error}",
                          //           ));
                          //     }
                          //   },
                          //   builder: (context, state) {
                          //     return Stack(
                          //       children: [
                          //         CustomTextField(
                          //             controller: StudentData.pincodeController,
                          //             textInputAction: TextInputAction.next,
                          //             keyboardType: TextInputType.number,
                          //             paddingHorizontal: 20.0,
                          //             hasViewHight: false,
                          //             labelText: "pincode",
                          //             hintText: "pincodeHere",
                          //             numberOfLines: 1,
                          //             hintFontWeight: FontWeight.w400,
                          //             onChanged: (e) {
                          //               if (StudentData.pincodeController.text
                          //                       .length ==
                          //                   6) {
                          //                 context.read<PincodeBloc>().add(
                          //                     GetInfoPincodeEvent(
                          //                         pincode: StudentData
                          //                             .pincodeController.text));
                          //               }
                          //             },
                          //             hintTextColor:
                          //                 colorGray.withOpacity(0.6)),
                          //         state is PincodeLoading
                          //             ? Positioned(
                          //                 bottom: 10,
                          //                 top: 10,
                          //                 right: 10,
                          //                 child: SizedBox(
                          //                   width: 25.0.w,
                          //                   height: 30.0.h,
                          //                   child: CircularProgressIndicator(
                          //                     strokeWidth: 3.0,
                          //                     color: colorPrimary,
                          //                   ),
                          //                 ),
                          //               )
                          //             : SizedBox.shrink(),
                          //       ],
                          //     );
                          //   },
                          // ),
                          // BlocBuilder<PincodeBloc, PincodeState>(
                          //   builder: (context, state) {
                          //     if (state is PincodeSuccess) {
                          //       PostOffice postOffice =
                          //           state.responseModel.data[0].postOffice[0];
                          //       print(
                          //           ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
                          //       StudentData.stateController.text =
                          //           postOffice.state;
                          //       StudentData.districtController.text =
                          //           postOffice.district;
                          //       return Column(
                          //         children: [
                          //           spaceVertical(space: 20.h),
                          //           CustomTextField(
                          //               controller: StudentData.stateController,
                          //               textInputAction: TextInputAction.next,
                          //               keyboardType: TextInputType.text,
                          //               paddingHorizontal: 20.0,
                          //               hasViewHight: false,
                          //               readOnly: true,
                          //               labelText: "state",
                          //               hintText: "state",
                          //               numberOfLines: 1,
                          //               hintFontWeight: FontWeight.w400,
                          //               hintTextColor:
                          //                   colorGray.withOpacity(0.6)),
                          //           spaceVertical(space: 20.h),
                          //           CustomTextField(
                          //               controller:
                          //                   StudentData.districtController,
                          //               textInputAction: TextInputAction.next,
                          //               keyboardType: TextInputType.text,
                          //               paddingHorizontal: 20.0,
                          //               hasViewHight: false,
                          //               readOnly: true,
                          //               labelText: "district",
                          //               hintText: "district",
                          //               numberOfLines: 1,
                          //               hintFontWeight: FontWeight.w400,
                          //               hintTextColor:
                          //                   colorGray.withOpacity(0.6)),
                          //         ],
                          //       );
                          //     } else {
                          //       return SizedBox.shrink();
                          //     }
                          //   },
                          // ),
                          // spaceVertical(space: 20.h),
                          CustomTextField(
                              controller: StudentData.tehsilController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              paddingHorizontal: 20.0,
                              hasViewHight: false,
                              labelText: "tehsilHere",
                              hintText: "tehsil",
                              numberOfLines: 1,
                              hintFontWeight: FontWeight.w400,
                              hintTextColor: colorGray.withOpacity(0.6)),
                          spaceVertical(space: 20.h),
                          CustomTextField(
                              controller: StudentData.villMohallaController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              paddingHorizontal: 20.0,
                              hasViewHight: false,
                              labelText: "villMohalla",
                              hintText: "villMohalla",
                              numberOfLines: 1,
                              hintFontWeight: FontWeight.w400,
                              hintTextColor: colorGray.withOpacity(0.6)),
                          spaceVertical(space: 30.h),
                          CustomTextField(
                              controller: StudentData.mobileController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              paddingHorizontal: 20.0,
                              hasViewHight: false,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(10),
                              ],
                              labelText: "mobileNumber",
                              hintText: "mobileNumber",
                              numberOfLines: 1,
                              hintFontWeight: FontWeight.w400,
                              hintTextColor: colorGray.withOpacity(0.6)),
                          spaceVertical(space: 20.h),
                          spaceVertical(space: 30.h),
                          BlocConsumer<UpdateBloc, UpdateState>(
                            listener: (context, state) {
                              printLog(
                                  ">>>>>>>>>>>>>>>>UpdateBloc><<<<<<<<<<<<<<${state.toString()}");
                              if (state is UpdateSuccess) {
                                appDialog(
                                    context: context,
                                    child: SuccessDailog(
                                      title: "successfully",
                                      onTap: () {
                                        context.back();
                                        context.read<StudentBloc>().add(
                                            GetStudentEvent(
                                                map: AppData.studentMap));
                                        context.back();

                                        // context.pushReplacementScreen(
                                        //     nextScreen: MainScreen());
                                      },
                                      message:
                                          "Successfully update your record",
                                    ));
                              } else if (state is UpdateError) {
                                appDialog(
                                    context: context,
                                    child: ErrorDailog(
                                      title: "error",
                                      onTap: () {
                                        context.back();
                                      },
                                      message: "${state.error}",
                                    ));
                              }
                            },
                            builder: (context, state) {
                              return state is UpdateLoading
                                  ? SizedBox(child: CircularProgressIndicator())
                                  : Container(
                                      height: 40.h,
                                      width: double.infinity,
                                      decoration:
                                          BoxDecoration(color: colorPrimary),
                                      child: AppSimpleButton(
                                        onDoneFuction: () async {
                                          if (StudentData
                                              .rollNoController.text.isEmpty) {
                                            context.showSnackBar(
                                                title: tr("error"),
                                                message: tr("rollNoError"),
                                                snackTypeEnum:
                                                    SnackTypeEnum.error);
                                          } else if (StudentData
                                              .nameController.text.isEmpty) {
                                            context.showSnackBar(
                                                title: tr("error"),
                                                message: tr("nameError"),
                                                snackTypeEnum:
                                                    SnackTypeEnum.error);
                                          } else if (StudentData
                                              .nameControllerFather
                                              .text
                                              .isEmpty) {
                                            context.showSnackBar(
                                                title: tr("error"),
                                                message: tr("fatherNameError"),
                                                snackTypeEnum:
                                                    SnackTypeEnum.error);
                                          }
                                          // else if (StudentData
                                          //     .nameControllerMother
                                          //     .text
                                          //     .isEmpty) {
                                          //   context.showSnackBar(
                                          //       title: tr("error"),
                                          //       message: tr("motherNameError"),
                                          //       snackTypeEnum:
                                          //           SnackTypeEnum.error);
                                          // }
                                          // else if (StudentData.pincodeController
                                          //         .text.length !=
                                          //     6) {
                                          //   context.showSnackBar(
                                          //       title: tr("error"),
                                          //       message: tr("pincodeError"),
                                          //       snackTypeEnum:
                                          //           SnackTypeEnum.error);
                                          // }
                                          else if (StudentData
                                              .tehsilController.text.isEmpty) {
                                            context.showSnackBar(
                                                title: tr("error"),
                                                message: tr("tehsilError"),
                                                snackTypeEnum:
                                                    SnackTypeEnum.error);
                                          } else if (StudentData
                                              .villMohallaController
                                              .text
                                              .isEmpty) {
                                            context.showSnackBar(
                                                title: tr("error"),
                                                message: tr("villMohallaError"),
                                                snackTypeEnum:
                                                    SnackTypeEnum.error);
                                          } else if (StudentData
                                                  .mobileController
                                                  .text
                                                  .length !=
                                              10) {
                                            context.showSnackBar(
                                                title: tr("error"),
                                                message: tr("mobileError"),
                                                snackTypeEnum:
                                                    SnackTypeEnum.error);
                                          } else {
                                            print(
                                                "sdddddddssssss>>>>>>>>${StudentData.selectedImage == null}");

                                            List items = [];
                                            var map = {
                                              "een":"",
                                              "id": StudentData
                                                      .selectedStudent?.id ??
                                                  "",
                                              "dob": StudentData
                                                      .selectedStudent?.dob ??
                                                  "",
                                              "srno": StudentData
                                                      .selectedStudent?.srno ??
                                                  "",

                                              "class": StudentData
                                                      .classController.text ??
                                                  "",
                                              //
                                              // "class": StudentData
                                              //         .selectedStudent
                                              //         ?.datumClass ??
                                              //     "",
                                              "ImageUrl": Uri.parse(StudentData
                                                          .selectedStudent
                                                          ?.imageUrl ??
                                                      "")
                                                  .pathSegments
                                                  .last,
                                              "sid": "",
                                              "roll_no": StudentData
                                                  .rollNoController.text,
                                              "name": StudentData
                                                  .nameController.text,
                                              "father": StudentData
                                                  .nameControllerFather.text,
                                              "mother": StudentData
                                                  .nameControllerMother.text,
                                              "pinCode": StudentData
                                                  .pincodeController.text,
                                              "district": StudentData
                                                  .districtController.text,
                                              "tehsil": StudentData
                                                  .tehsilController.text,
                                              "VillageOrMohalla": StudentData
                                                  .villMohallaController.text,
                                              "MobileNo": StudentData
                                                  .mobileController.text,
                                            };

                                            items.add(map);
                                            var finalMap = {
                                              "projectId": AppData
                                                  .userModel.data.projectId,
                                              "isReissueCard": true,
                                              "studentForICard": items,
                                              "TYPE": RoleEnum.student.name,
                                            };
                                            context.read<UpdateBloc>().add(
                                                UpdateStudentEvent(
                                                    map: finalMap));
                                          }
                                        },
                                        buttonBackgroundColor: colorPrimary,
                                        nameText: "submit",
                                        textSize: 18.sp,
                                      ),
                                    );
                            },
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
                      text: "studentsUpdateForm",
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
