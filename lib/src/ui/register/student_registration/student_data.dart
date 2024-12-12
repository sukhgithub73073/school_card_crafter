import 'package:camera/camera.dart';
import 'package:card_craft/src/core/drop_down/drop_list_model.dart';
import 'package:card_craft/src/data/models/students_model.dart';
import 'package:card_craft/src/utility/app_util.dart';
import 'package:flutter/material.dart';
import 'package:radio_group_v2/widgets/view_models/radio_group_controller.dart';

import '../../../data/models/cast_model.dart';
import 'package:intl/intl.dart';
class StudentData{
  static XFile? selectedImage  ;

  // static String dob = "" ;
  static var nameController = TextEditingController(text: "");
  static var aadhaarController = TextEditingController(text: "");
  static var dobController = TextEditingController(text: "");
  static var mobileController = TextEditingController(text: "");
  static var srnoController = TextEditingController(text: "");
  static var rollNoController = TextEditingController(text: "");
  static var classController = TextEditingController(text: "");

  static var admissionType = "new";
  static var genderCtrl = RadioGroupController();
  static DropListModel? selectedReligion ;
  static Caste? selectedCast ;
  static Caste? selectedSubCast ;
  static DropListModel? selectFatherOcc ;
  static DropListModel? selectFatherQualification ;
  static DropListModel? selectMotherOcc ;
  static DropListModel? selectMotherQualification ;
  static DropListModel? selectReligion ;


  static var addressController = TextEditingController(text: "");
  static var pincodeController = TextEditingController(text: "");
  static var selectedPostOffice;
  static var nameControllerFather = TextEditingController(text: "");
  static var aadharControllerFather = TextEditingController(text: "");
  static var nameControllerMother = TextEditingController(text: "");
  static var aadharControllerMother = TextEditingController(text: "");
  static var occupationList = getOccupationList();
  static var qualificationList = getQualificationList();

  static var stateController = TextEditingController(text: "");
  static var districtController = TextEditingController(text: "");
  static var tehsilController = TextEditingController(text: "");
  static var villMohallaController = TextEditingController(text: "");
  static var pincodeAddressController = TextEditingController(text: "");
  static var selectedPostOfficeAddress;

  static var stateGaurdianCtrl = TextEditingController(text: "");
  static var districtGaurdianCtrl = TextEditingController(text: "");
  static var villageMohalaGaurdianCtrl = TextEditingController(text: "");

  static var pincodeGaurdianCtrl = TextEditingController(text: "");
  static var tehsilGaurdianCtrl = TextEditingController(text: "");
  static var nameGaurdianCtrl = TextEditingController(text: "");
  static var relationshipGaurdianCtrl = TextEditingController(text: "");
  static var mobileGaurdianCtrl = TextEditingController(text: "");

  static var previosSchoolCtrl = TextEditingController(text: "");
  static var timeCtrl = TextEditingController(text: "");
  static DropListModel? selectedGroup;
  static DropListModel? selectedClass;

  static var selectedPreviosGroup;
  static var selectedPreviosClass;
  static var bankNameCtrl= TextEditingController(text: "");
  static var ifscCtrl= TextEditingController(text: "");
  static var branchAddressCtrl= TextEditingController(text: "");
  static var accountCtrl= TextEditingController(text: "");
  static var holderNameCtrl= TextEditingController(text: "");

  static var udisePenCtrl = TextEditingController(text: "");
  static var selectDisabilityType ;
  static var obtainMarksCtrl = TextEditingController(text: "");
  static var attendedDaysCtrl = TextEditingController(text: "");
  static var emailCtrl = TextEditingController(text: "");
  static var disabilityCtrl = TextEditingController(text: "");
  static var weightCtrl = TextEditingController(text: "");
  static var heightCtrl = TextEditingController(text: "");
  static var bloodGroupList = getBloodGroupList();
  static var disabilityTypeList = getDisabilityTypeList();
  static RadioGroupController disabilityRadioController = RadioGroupController();
  static RadioGroupController resultRadioController = RadioGroupController();

  static DropListModel? selectedBloodGroup;
  static Datum? selectedStudent ;

  static void resetImage() {
    selectedImage = null ;
    print("selectedImageselectedImage${selectedImage==null}");
  }

  static void clearStudentData() {
    selectedImage = null ;
    nameController.clear();
    aadhaarController.clear();
    mobileController.clear();
    dobController.clear();
    srnoController.clear();
    rollNoController.clear();
    admissionType = "new"; // Assuming this is the default value
    genderCtrl = RadioGroupController(); // Reset the radio group controller
    selectedReligion = null;
    selectedCast = null;
    selectedSubCast = null;
    selectFatherOcc = null;
    selectFatherQualification = null;
    selectMotherOcc = null;
    selectMotherQualification = null;

    addressController.clear();
    pincodeController.clear();
    selectedPostOffice = null;
    nameControllerFather.clear();
    aadharControllerFather.clear();
    nameControllerMother.clear();
    aadharControllerMother.clear();
    occupationList = getOccupationList(); // Reload the default occupation list
    qualificationList = getQualificationList(); // Reload the default qualification list

    stateController.clear();
    districtController.clear();
    tehsilController.clear();
    villMohallaController.clear();
    pincodeAddressController.clear();
    selectedPostOfficeAddress = null;

    stateGaurdianCtrl.clear();
    districtGaurdianCtrl.clear();
    villageMohalaGaurdianCtrl.clear();
    pincodeGaurdianCtrl.clear();
    nameGaurdianCtrl.clear();
    relationshipGaurdianCtrl.clear();
    mobileGaurdianCtrl.clear();

    previosSchoolCtrl.clear();
    timeCtrl.clear();
    selectedGroup = null;
    selectedClass = null;

    selectedPreviosGroup = null;
    selectedPreviosClass = null;
    bankNameCtrl.clear();
    ifscCtrl.clear();
    branchAddressCtrl.clear();
    accountCtrl.clear();
    holderNameCtrl.clear();

    udisePenCtrl.clear();
    selectDisabilityType = null;
    obtainMarksCtrl.clear();
    attendedDaysCtrl.clear();
    emailCtrl.clear();
    disabilityCtrl.clear();
    weightCtrl.clear();
    heightCtrl.clear();
    bloodGroupList = getBloodGroupList(); // Reload the default blood group list
    disabilityTypeList = getDisabilityTypeList(); // Reload the default disability type list
    disabilityRadioController = RadioGroupController(); // Reset the disability radio controller
    resultRadioController = RadioGroupController(); // Reset the result radio controller
    selectedBloodGroup = null;
  }

  static void editStudent({required Datum student}) {
    selectedStudent = student ;
    nameController.text =student.name ;
    rollNoController.text =student.srno.toString() ;
    //aadhaarController.text =student.aadhaarNumber ;
    dobController.text =student.dob ;
    mobileController.text =student.mobileNo ;
    // dobController.text =  DateFormat('dd-MM-yyyy').format(student.dob.toLocal()) ;

    nameControllerFather.text = student.father ;
    classController.text = student.datumClass ;
    // aadharControllerFather.text = student.fatherAadhar ;

    nameControllerMother.text = student.mother ;
    // aadharControllerMother.text = student.motherAadhar ;

    pincodeController.text = student.pinCode;
    tehsilController.text = student.tehsil;
    villMohallaController.text = student.villageOrMohalla;
    //
    // nameGaurdianCtrl.text = student.guardian.guardianName ;
    // relationshipGaurdianCtrl.text = student.guardian.relationshipWithStudent ;
    // mobileGaurdianCtrl.text = student.guardian.guardianMobile ;
    // pincodeGaurdianCtrl.text = student.guardian.guardianPinCode ;
    // tehsilGaurdianCtrl.text = student.guardian.guardianTehsil ;
    // villageMohalaGaurdianCtrl.text = student.guardian.guardianVillageMohalla ;
    //
    // previosSchoolCtrl.text = student.previousSchool;
    // timeCtrl.text = student.details.timePeriodOfResidence;
    //
    // bankNameCtrl.text = student.details.bankName ;
    // ifscCtrl.text = student.details.ifscCode ;
    // branchAddressCtrl.text = student.details.branchAddress ;
    // accountCtrl.text = student.details.accountNumber ;
    // holderNameCtrl.text = student.details.accountHolderName ;
    //
    // udisePenCtrl.text = student.details.udisePen ;
    // obtainMarksCtrl.text = student.details.obtainedMarks ;
    // attendedDaysCtrl.text = student.details.attendedDays.toString() ;
    // emailCtrl.text = student.email ;
    // weightCtrl.text = student.details.studentWeight ;
    // heightCtrl.text = student.details.studentHeight ;


  }




}