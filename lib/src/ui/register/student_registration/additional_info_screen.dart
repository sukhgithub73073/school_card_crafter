import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:card_craft/src/core/app_assets.dart';
import 'package:card_craft/src/core/app_dialog.dart';
import 'package:card_craft/src/core/dialog_widgets/failure_message_dialog.dart';
import 'package:card_craft/src/core/dialog_widgets/success_message_dialog.dart';
import 'package:card_craft/src/core/drop_down/drop_list_model.dart';
import 'package:card_craft/src/data/blocs/classes_bloc/classes_bloc.dart';
import 'package:card_craft/src/data/blocs/disability_bloc/disability_bloc.dart';
import 'package:card_craft/src/data/blocs/groups_bloc/groups_bloc.dart';
import 'package:card_craft/src/data/blocs/image_pick_bloc/image_pick_bloc.dart';
import 'package:card_craft/src/data/blocs/pincode_bloc/pincode_bloc.dart';
import 'package:card_craft/src/data/blocs/register_bloc/register_bloc.dart';
import 'package:card_craft/src/data/blocs/update_bloc/update_bloc.dart';
import 'package:card_craft/src/data/models/pincode_model.dart';
import 'package:card_craft/src/ui/dashboard/main_screen.dart';
import 'package:card_craft/src/ui/register/parent_detail_screen.dart';
import 'package:card_craft/src/ui/register/student_registration/register_gaurdian_screen.dart';
import 'package:card_craft/src/ui/register/student_registration/student_data.dart';
import 'package:card_craft/src/utility/app_data.dart';
import 'package:card_craft/src/utility/app_util.dart';
import 'package:card_craft/src/utility/date_time_util.dart';
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

class AdditionalInfoScreen extends StatefulWidget {
  AdditionalInfoScreen({super.key});

  @override
  State<AdditionalInfoScreen> createState() => _AdditionalInfoScreenState();
}

class _AdditionalInfoScreenState extends State<AdditionalInfoScreen> {
  @override
  void initState() {
    super.initState();
    context.read<DisabilityBloc>().add(GetDisabilityEvent(map: {
          // 'college_id': '${AppData.userModel.data?.data.college.id ?? ""}',
          'session': DateTime.now().year,
          'class_group_id': '28'
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPrimary,
        leading: TapWidget(
          onTap: () {},
          child: Icon(
            Icons.arrow_back,
            color: colorWhite,
            size: 15.h,
          ),
        ),
        title: TextView(
          text: "additionalInfo",
          color: colorWhite,
          textSize: 16.sp,
          textAlign: TextAlign.center,
          style: AppTextStyleEnum.medium,
          fontFamily: Family.medium,
          lineHeight: 1.3,
        ),
        actions: [
          TapWidget(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: TextView(
                text: "skip",
                color: colorWhite,
                textSize: 14.sp,
                textAlign: TextAlign.center,
                style: AppTextStyleEnum.medium,
                fontFamily: Family.medium,
                lineHeight: 1.3,
              ),
            ),
          )
        ],
      ),
      body: ListView(shrinkWrap: true, children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              spaceVertical(space: 10.h),
              CustomTextField(
                  controller: StudentData.udisePenCtrl,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  paddingHorizontal: 20.0,
                  hasViewHight: false,
                  labelText: "udisePen",
                  hintText: "udisePen",
                  numberOfLines: 1,
                  hintFontWeight: FontWeight.w400,
                  hintTextColor: colorGray.withOpacity(0.6)),
              spaceVertical(space: 15.h),
              Row(
                children: [
                  TextView(
                    text: "disability",
                    color: colorBlack,
                    textSize: 14.sp,
                    textAlign: TextAlign.center,
                    style: AppTextStyleEnum.regular,
                    fontFamily: Family.regular,
                    lineHeight: 1.3,
                  ),
                  spaceHorizontal(space: 10.w),
                  RadioGroup(
                    controller: StudentData.disabilityRadioController,
                    values: ["Yes", "No"],
                    indexOfDefault: 0,
                    orientation: RadioGroupOrientation.horizontal,
                    decoration: RadioGroupDecoration(
                      spacing: 10.0,
                      labelStyle: TextStyle(
                        color: colorBlack,
                      ),
                      activeColor: colorPrimary,
                    ),
                  )
                ],
              ),
              spaceVertical(space: 15.h),
              BlocConsumer<DisabilityBloc, DisabilityState>(
                listener: (context, state) {
                  print("sdddddddssssssss${state.toString()}");
                },
                builder: (context, state) {
                  return state is DisabilityLoaded
                      ? CustomDropdown<DropListModel>(
                          hintText: tr("selectDisabilityType"),
                          items: state.list,
                          decoration: customDropdownDecoration,
                          excludeSelected: false,
                          onChanged: (item) {
                            StudentData.selectDisabilityType = item;
                          },
                        )
                      : SizedBox.shrink();
                },
              ),
              spaceVertical(space: 15.h),
              CustomTextField(
                  controller: StudentData.disabilityCtrl,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(3),
                  ],
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  paddingHorizontal: 20.0,
                  hasViewHight: false,
                  labelText: "disabilityPercent",
                  hintText: "disabilityPercent",
                  numberOfLines: 1,
                  hintFontWeight: FontWeight.w400,
                  hintTextColor: colorGray.withOpacity(0.6)),
              spaceVertical(space: 15.h),
              Row(
                children: [
                  TextView(
                    text: "result",
                    color: colorBlack,
                    textSize: 14.sp,
                    textAlign: TextAlign.center,
                    style: AppTextStyleEnum.regular,
                    fontFamily: Family.regular,
                    lineHeight: 1.3,
                  ),
                  spaceHorizontal(space: 10.w),
                  RadioGroup(
                    controller: StudentData.resultRadioController,
                    values: [tr("pass"), tr("fail"), tr("noResult")],
                    indexOfDefault: 0,
                    orientation: RadioGroupOrientation.horizontal,
                    decoration: RadioGroupDecoration(
                      spacing: 10.0,
                      labelStyle: TextStyle(
                        color: colorBlack,
                      ),
                      activeColor: colorPrimary,
                    ),
                  )
                ],
              ),
              spaceVertical(space: 15.h),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                        controller: StudentData.obtainMarksCtrl,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(12),
                        ],
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        paddingHorizontal: 20.0,
                        hasViewHight: false,
                        labelText: "obtainMarks",
                        hintText: "obtainMarks",
                        numberOfLines: 1,
                        hintFontWeight: FontWeight.w400,
                        hintTextColor: colorGray.withOpacity(0.6)),
                  ),
                  spaceHorizontal(space: 10.w),
                  Expanded(
                    child: CustomTextField(
                        controller: StudentData.attendedDaysCtrl,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(12),
                        ],
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        paddingHorizontal: 20.0,
                        hasViewHight: false,
                        labelText: "attendedDays",
                        hintText: "attendedDays",
                        numberOfLines: 1,
                        hintFontWeight: FontWeight.w400,
                        hintTextColor: colorGray.withOpacity(0.6)),
                  ),
                ],
              ),
              spaceVertical(space: 15.h),
              CustomTextField(
                  controller: StudentData.emailCtrl,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  paddingHorizontal: 20.0,
                  hasViewHight: false,
                  labelText: "email",
                  hintText: "emailHere",
                  numberOfLines: 1,
                  hintFontWeight: FontWeight.w400,
                  hintTextColor: colorGray.withOpacity(0.6)),
              spaceVertical(space: 15.h),
              CustomDropdown<DropListModel>(
                hintText: tr("selectBloodGroup"),
                items: StudentData.bloodGroupList,
                decoration: customDropdownDecoration,
                excludeSelected: false,
                onChanged: (item) {
                  StudentData.selectedBloodGroup = item;
                },
              ),
              spaceVertical(space: 15.h),
              CustomTextField(
                  controller: StudentData.weightCtrl,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(12),
                  ],
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  paddingHorizontal: 20.0,
                  hasViewHight: false,
                  labelText: "studentWeight",
                  hintText: "studentWeight",
                  numberOfLines: 1,
                  hintFontWeight: FontWeight.w400,
                  hintTextColor: colorGray.withOpacity(0.6)),
              spaceVertical(space: 15.h),
              CustomTextField(
                  controller: StudentData.heightCtrl,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(12),
                  ],
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  paddingHorizontal: 20.0,
                  hasViewHight: false,
                  labelText: "studentHeight",
                  hintText: "studentHeight",
                  numberOfLines: 1,
                  hintFontWeight: FontWeight.w400,
                  hintTextColor: colorGray.withOpacity(0.6)),
              spaceVertical(space: 15.h),
              BlocConsumer<UpdateBloc, UpdateState>(
                listener: (context, state) {
                  if (state is UpdateSuccess) {
                    appDialog(
                        context: context,
                        child: SuccessDailog(
                          title: "successfully",
                          onTap: () {
                            context.pushReplacementScreen(
                                nextScreen: MainScreen());
                          },
                          message: "Successfully update student detail",
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
                  return Container(
                    height: 40.h,
                    width: double.infinity,
                    decoration: BoxDecoration(color: colorPrimary),
                    child: AppSimpleButton(
                      onDoneFuction: () async {
                        var map = {
                          // 'college_id':
                          //     '${StudentData.selectedStudent?.collegeId}',
                          // "class_group_id":
                          //     StudentData.selectedStudent?.classGroupId,
                          // "class": StudentData.selectedStudent?.finalClassId,
                          "name": StudentData.nameController.text,
                          "mobile_no": StudentData.mobileGaurdianCtrl.text,
                          "roll_no": StudentData.rollNoController.text,
                          // "serial_no": StudentData.selectedStudent?.serialNo,
                          // "session": StudentData.selectedStudent?.session,
                          //"application_no": "APP123",
                          "aadhaar_number": StudentData.aadhaarController.text,
                          //"admission_date": DateTimeUtil.getCurrentDate(),
                          "dob": StudentData.dobController.text,
                         /// "gender": StudentData.genderCtrl.value,
                          "gender": "-",
                          "religion": StudentData.selectedReligion?.name ?? "",
                          "caste_id": StudentData.selectedCast?.id ?? "",
                          "sub_caste_id": StudentData.selectedSubCast?.id ?? "",
                          "father": StudentData.nameControllerFather.text,
                          "father_occupation":
                              StudentData.selectFatherOcc?.name ?? "",
                          "mother": StudentData.nameControllerMother.text,
                          "mother_occupation":
                              StudentData.selectMotherOcc?.name ?? "",
                          "pin_code": StudentData.pincodeController.text,
                          "district": StudentData.selectedStudent?.district,
                          // "state": StudentData.selectedStudent?.state,
                          "tehsil": StudentData.tehsilController.text,
                          "village_mohalla":
                              StudentData.villMohallaController.text,
                          "guardian_name": StudentData.nameGaurdianCtrl.text,
                          "relationship_with_student":
                              StudentData.relationshipGaurdianCtrl.text,
                          "guardian_mobile":
                              StudentData.mobileGaurdianCtrl.text,
                          "guardian_pin_code":
                              StudentData.pincodeGaurdianCtrl.text,
                          "guardian_district":
                              StudentData.districtGaurdianCtrl.text,
                          "guardian_tehsil": StudentData.tehsilGaurdianCtrl,
                          "guardian_village_mohalla":
                              StudentData.villageMohalaGaurdianCtrl.text,
                          "guardian_address": "Guardian Address",
                          "guardian_alternate_mobile":
                              StudentData.mobileGaurdianCtrl.text,
                          "guardian_email": StudentData.emailCtrl.text,
                          "previous_school": StudentData.previosSchoolCtrl.text,
                          // "group":
                          //     StudentData.selectedStudent?.finalClassGroupName,
                          // "previous_passed_class": StudentData
                          //     .selectedStudent?.details.previousPassedClass,
                          "time_period_of_residence": StudentData.timeCtrl.text,
                          "academic_year": "2023-2024",
                          "bank_name": StudentData.bankNameCtrl.text,
                          "ifsc_code": StudentData.ifscCtrl.text,
                          "branch_address": StudentData.branchAddressCtrl.text,
                          "account_number": StudentData.accountCtrl.text,
                          "account_holder_name":
                              StudentData.holderNameCtrl.text,
                          "udise_pen": StudentData.udisePenCtrl.text,
                          "disability_status":
                              StudentData.disabilityRadioController.value ==
                                      "Yes"
                                  ? 1
                                  : 0,
                          "disability_type":
                              StudentData.selectDisabilityType.name,
                          "disability_percentage":
                              StudentData.disabilityCtrl.text,
                          "last_academic_result":
                              StudentData.resultRadioController.value,
                          "obtained_marks": StudentData.obtainMarksCtrl.text,
                          "attended_days": StudentData.attendedDaysCtrl.text,
                          "student_blood_group":
                              StudentData.selectedBloodGroup?.name ?? "",
                          "student_weight": StudentData.weightCtrl.text,
                          "student_height": StudentData.heightCtrl.text
                        };

                        context
                            .read<UpdateBloc>()
                            .add(UpdateStudentEvent(map: map));
                        // appDialog(
                        //     context: context,
                        //     child: SuccessDailog(
                        //       title: "successfully",
                        //       onTap: () {
                        //         context.back();
                        //       },
                        //       message: "Successfully student register",
                        //     ));
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
    );
  }
}
//
