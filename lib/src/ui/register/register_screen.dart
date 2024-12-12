import 'dart:io';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:card_craft/src/core/app_assets.dart';
import 'package:card_craft/src/core/app_dialog.dart';
import 'package:card_craft/src/core/dialog_widgets/failure_message_dialog.dart';
import 'package:card_craft/src/core/dialog_widgets/success_message_dialog.dart';
import 'package:card_craft/src/core/drop_down/drop_list_model.dart';
import 'package:card_craft/src/data/blocs/classes_bloc/classes_bloc.dart';
import 'package:card_craft/src/data/blocs/groups_bloc/groups_bloc.dart';
import 'package:card_craft/src/data/blocs/image_pick_bloc/image_pick_bloc.dart';
import 'package:card_craft/src/data/blocs/pincode_bloc/pincode_bloc.dart';
import 'package:card_craft/src/data/blocs/register_bloc/register_bloc.dart';
import 'package:card_craft/src/data/models/pincode_model.dart';
import 'package:card_craft/src/ui/register/parent_detail_screen.dart';
import 'package:card_craft/src/utility/app_util.dart';
import 'package:card_craft/src/utility/decoration_util.dart';
import 'package:card_craft/src/utility/validation_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var nameController = TextEditingController(text: "");
  var aadhaarController = TextEditingController(text: "");
  var fatherController = TextEditingController(text: "");
  var motherController = TextEditingController(text: "");
  var srnoController = TextEditingController(text: "");
  var emailController = TextEditingController(text: "");
  var pincodeController = TextEditingController(text: "");
  var addressController = TextEditingController(text: "");
  var passwordController = TextEditingController(text: "");
  var selectedPostOffice;
  var selectedGroup;
  var selectedClass;
  var admissionType = "new";
  RadioGroupController myController = RadioGroupController();

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
                                    return CircleAvatar(
                                      radius: 100,
                                      backgroundImage:
                                          FileImage(File(state.file.path)),
                                    );
                                  } else {
                                    return CircleAvatar(
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
                                  onTap: () {
                                    context
                                        .read<ImagePickBloc>()
                                        .add(ChangeImagePickEvent());
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
                          Container(
                            height: 40.h,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                boxShadow: [
                                  BoxShadow(
                                      color: colorPrimary.withOpacity(0.8),
                                      blurRadius: 10,
                                      blurStyle: BlurStyle.outer)
                                ],
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: TapWidget(
                                    onTap: () {
                                      setState(() {
                                        admissionType = "new";
                                      });
                                    },
                                    child: Container(
                                      height: double.maxFinite,
                                      decoration: BoxDecoration(
                                          color: admissionType == "new"
                                              ? colorPrimary
                                              : colorWhite,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                        child: TextView(
                                          text: "newAddmission",
                                          color: admissionType == "new"
                                              ? colorWhite
                                              : colorGray,
                                          textSize: 16.sp,
                                          textAlign: TextAlign.center,
                                          style: AppTextStyleEnum.medium,
                                          fontFamily: Family.medium,
                                          lineHeight: 1.3,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: TapWidget(
                                    onTap: () {
                                      setState(() {
                                        admissionType = "old";
                                      });
                                    },
                                    child: Container(
                                      height: double.maxFinite,
                                      decoration: BoxDecoration(
                                          color: admissionType == "old"
                                              ? colorPrimary
                                              : colorWhite,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                        child: TextView(
                                          text: "oldAddmission",
                                          color: admissionType == "old"
                                              ? colorWhite
                                              : colorGray,
                                          textSize: 16.sp,
                                          textAlign: TextAlign.center,
                                          style: AppTextStyleEnum.medium,
                                          fontFamily: Family.medium,
                                          lineHeight: 1.3,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          spaceVertical(space: 20.h),
                          // BlocConsumer<GroupsBloc, GroupsState>(
                          //   listener: (context, state) {},
                          //   builder: (context, state) {
                          //     if (state is GroupsSuccess) {
                          //       printLog(
                          //           "builder >>>>>>>>>>>>>>>>>${state is GroupsSuccess}");
                          //       List<DropListModel> list = [];
                          //       state.data.forEach((element) {
                          //         list.add(DropListModel(
                          //             id: "${element.id}",
                          //             name: "${element.groupName}"));
                          //       });
                          //       return CustomDropdown<DropListModel>.search(
                          //         hintText: tr("selectGroup"),
                          //         items: list,
                          //         excludeSelected: false,
                          //         decoration: customDropdownDecoration,
                          //         onChanged: (item) {
                          //           selectedGroup = item;
                          //           context
                          //               .read<ClassesBloc>()
                          //               .add(GetClassesByGroupEvent(map: {
                          //                 "school_code": "GSSS19543",
                          //                 "group_id": item?.id ?? "",
                          //               }));
                          //         },
                          //       );
                          //     } else {
                          //       return SizedBox.shrink();
                          //     }
                          //   },
                          // ),
                          // spaceVertical(space: 10.h),
                          BlocConsumer<ClassesBloc, ClassesState>(
                            listener: (context, state) {},
                            builder: (context, state) {
                              if (state is ClassesGetSuccess) {
                                printLog(
                                    "builder >>>>>>>>>>>>>>>>>${state is GroupsSuccess}");
                                List<DropListModel> list = [];
                                state.data.forEach((element) {
                                  list.add(DropListModel(
                                      id: "${element.id}",
                                      name: "${element.className}"));
                                });
                                return CustomDropdown<DropListModel>.search(
                                  hintText: tr("selectClass"),
                                  items: list,
                                  decoration: customDropdownDecoration,
                                  excludeSelected: false,
                                  onChanged: (item) {
                                    selectedClass = item;
                                  },
                                );
                              } else {
                                return SizedBox.shrink();
                              }
                            },
                          ),
                          spaceVertical(space: 20.h),
                          if (admissionType == "old") ...[
                            CustomTextField(
                                controller: srnoController,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.text,
                                paddingHorizontal: 20.0,
                                hasViewHight: false,
                                labelText: "srNo",
                                hintText: "srNoHere",
                                numberOfLines: 1,
                                hintFontWeight: FontWeight.w400,
                                hintTextColor: colorGray.withOpacity(0.6)),
                            spaceVertical(space: 20.h),
                          ],
                          CustomTextField(
                              controller: emailController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              paddingHorizontal: 20.0,
                              hasViewHight: false,
                              labelText: "email",
                              hintText: "emailHere",
                              numberOfLines: 1,
                              hintFontWeight: FontWeight.w400,
                              hintTextColor: colorGray.withOpacity(0.6)),
                          spaceVertical(space: 20.h),
                          CustomTextField(
                              controller: passwordController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              paddingHorizontal: 20.0,
                              hasViewHight: false,
                              labelText: "password",
                              hintText: "***********",
                              numberOfLines: 1,
                              borderColor: colorInputBorder,
                              hintFontWeight: FontWeight.w400,
                              hintTextColor: colorInputBorder.withOpacity(0.6)),
                          spaceVertical(space: 20.h),
                          CustomTextField(
                              controller: nameController,
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
                              controller: aadhaarController,
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
                          Align(
                            alignment: Alignment.centerLeft,
                            child: RadioGroup(
                              controller: myController,
                              values: ["Male", "Female", "Other"],
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
                            hintText: tr("selectReligion"),
                            items: getReligionList(),
                            decoration: customDropdownDecoration,
                            excludeSelected: false,
                            onChanged: (item) {},
                          ),
                          spaceVertical(space: 20.h),
                          Row(children: [
                            Expanded(
                              child: CustomDropdown<DropListModel>.search(
                                hintText: tr("selectCaste"),
                                items: getCasteList(),
                                decoration: customDropdownDecoration,
                                excludeSelected: false,
                                onChanged: (item) {},
                              ),
                            ),
                            spaceHorizontal(space: 10.w),
                            Expanded(
                              child: CustomDropdown<DropListModel>.search(
                                hintText: tr("selectSubCaste"),
                                items: getSubCasteList(),
                                decoration: customDropdownDecoration,
                                excludeSelected: false,
                                onChanged: (item) {},
                              ),
                            ),
                          ],) ,

                          spaceVertical(space: 20.h),


                          Row(
                            children: [
                              Expanded(
                                child: TapWidget(
                                  onTap: () {
                                    context.pushScreen(
                                        nextScreen:
                                            ParentDetailScreen(type: "father"));
                                  },
                                  child: CustomTextField(
                                      controller: fatherController,
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.text,
                                      paddingHorizontal: 20.0,
                                      hasViewHight: false,
                                      readOnly: true,
                                      enabled: false,
                                      onChanged: null,
                                      onTab: null,
                                      labelText: "fatherDetail",
                                      hintText: "fatherNameHere",
                                      numberOfLines: 1,
                                      hintFontWeight: FontWeight.w400,
                                      hintTextColor:
                                          colorGray.withOpacity(0.6)),
                                ),
                              ),
                              spaceHorizontal(space: 10.w),
                              Expanded(
                                child: TapWidget(
                                  onTap: () {
                                    context.pushScreen(
                                        nextScreen:
                                            ParentDetailScreen(type: "mother"));
                                  },
                                  child: CustomTextField(
                                      controller: motherController,
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.text,
                                      paddingHorizontal: 20.0,
                                      hasViewHight: false,
                                      readOnly: true,
                                      enabled: false,
                                      onChanged: null,
                                      onTab: null,
                                      labelText: "motherDetail",
                                      hintText: "motherNameHere",
                                      numberOfLines: 1,
                                      hintFontWeight: FontWeight.w400,
                                      hintTextColor:
                                          colorGray.withOpacity(0.6)),
                                ),
                              ),
                            ],
                          ),
                          spaceVertical(space: 20.h),
                          BlocConsumer<PincodeBloc, PincodeState>(
                            listener: (context, state) {
                              if (state is PincodeError) {
                                appDialog(
                                    context: context,
                                    child: ErrorDailog(
                                      title: "invalidPincode",
                                      onTap: () {
                                        context.back();
                                      },
                                      message: "${state.error}",
                                    ));
                              }
                            },
                            builder: (context, state) {
                              return Stack(
                                children: [
                                  CustomTextField(
                                      controller: pincodeController,
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.number,
                                      paddingHorizontal: 20.0,
                                      hasViewHight: false,
                                      labelText: "pincode",
                                      hintText: "pincodeHere",
                                      numberOfLines: 1,
                                      hintFontWeight: FontWeight.w400,
                                      onChanged: (e) {
                                        if (pincodeController.text.length ==
                                            6) {
                                          context.read<PincodeBloc>().add(
                                              GetInfoPincodeEvent(
                                                  pincode:
                                                      pincodeController.text));
                                        }
                                      },
                                      hintTextColor:
                                          colorGray.withOpacity(0.6)),
                                  state is PincodeLoading
                                      ? Positioned(
                                          bottom: 10,
                                          top: 10,
                                          right: 10,
                                          child: SizedBox(
                                            width: 25.0.w,
                                            height: 30.0.h,
                                            child: CircularProgressIndicator(
                                              strokeWidth: 3.0,
                                              color: colorPrimary,
                                            ),
                                          ),
                                        )
                                      : SizedBox.shrink(),
                                ],
                              );
                            },
                          ),
                          BlocBuilder<PincodeBloc, PincodeState>(
                            builder: (context, state) {
                              if (state is PincodeSuccess) {
                                return Column(
                                  children: [
                                    spaceVertical(space: 20.h),
                                    FormField<String>(
                                      builder: (FormFieldState<String> s) {
                                        return InputDecorator(
                                          decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.fromLTRB(
                                                      12, 10, 20, 20),
                                              errorStyle: TextStyle(
                                                  color: Colors.redAccent,
                                                  fontSize: 16.0),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0))),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton<PostOffice>(
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey,
                                              ),
                                              hint: Text(
                                                "selectCity",
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              items: state.responseModel.data[0]
                                                  .postOffice
                                                  .map<
                                                          DropdownMenuItem<
                                                              PostOffice>>(
                                                      (PostOffice value) {
                                                return DropdownMenuItem(
                                                  value: value,
                                                  child: Row(
                                                    children: [
                                                      TextView(
                                                        text: "${value.name}",
                                                        color: colorGray,
                                                        textSize: 12.sp,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: AppTextStyleEnum
                                                            .medium,
                                                        fontFamily:
                                                            Family.medium,
                                                        lineHeight: 1.3,
                                                      )
                                                    ],
                                                  ),
                                                );
                                              }).toList(),
                                              isExpanded: true,
                                              isDense: true,
                                              onChanged: (selectedItem) {
                                                setState(() {
                                                  selectedPostOffice =
                                                      selectedItem;
                                                });
                                              },
                                              value: selectedPostOffice,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                );
                              } else {
                                return SizedBox.shrink();
                              }
                            },
                          ),
                          spaceVertical(space: 20.h),
                          CustomTextField(
                              controller: addressController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              paddingHorizontal: 20.0,
                              hasViewHight: false,
                              labelText: "address",
                              hintText: "addressHere",
                              numberOfLines: 1,
                              hintFontWeight: FontWeight.w400,
                              hintTextColor: colorGray.withOpacity(0.6)),

                          spaceVertical(space: 20.h),
                          CustomTextField(
                              controller: addressController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              paddingHorizontal: 20.0,
                              hasViewHight: false,
                              labelText: "previousSchool",
                              hintText: "previousSchoolHere",
                              numberOfLines: 1,
                              hintFontWeight: FontWeight.w400,
                              hintTextColor: colorGray.withOpacity(0.6)),
                          spaceVertical(space: 30.h),
                          BlocConsumer<RegisterBloc, RegisterState>(
                            listener: (context, state) {
                              if (state is RegisterSuccess) {
                                appDialog(
                                    context: context,
                                    child: SuccessDailog(
                                      title: "successfully",
                                      onTap: () {
                                        context.back();
                                        context.back();
                                      },
                                      message: "${state.userModel.message}",
                                    ));
                              } else if (state is RegisterError) {
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
                              return Container(
                                height: 40.h,
                                width: double.infinity,
                                decoration: BoxDecoration(color: colorPrimary),
                                child: AppSimpleButton(
                                  onDoneFuction: () async {
                                    if (!ValidationUtil.emailValidation(
                                        email: emailController.text)) {
                                    } else if (!ValidationUtil
                                        .passwordValidation(
                                            password:
                                                passwordController.text)) {
                                    } else {
                                      var map = {
                                        "school_code": "GSSS19543",
                                        "role_type": "Student",
                                        "email": emailController.text,
                                        "password": passwordController.text,
                                        "name": nameController.text,
                                        "father_name": fatherController.text,
                                        "mother_name": motherController.text,
                                        "pincode": pincodeController.text,
                                        "district": selectedPostOffice.district,
                                        "city": selectedPostOffice.name,
                                        "address": addressController.text
                                      };
                                      context
                                          .read<RegisterBloc>()
                                          .add(DoRegisterEvent(map: map));
                                    }
                                  },
                                  buttonBackgroundColor: colorPrimary,
                                  nameText: "register",
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
//
