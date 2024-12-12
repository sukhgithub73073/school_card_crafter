part of 'http_service.dart';

class ApisEndpoints {
  // https://schoolclub.co.in/laravel_app/public/uploads/student/1721982393_scaled_1000003585.jpg_stu.jpg

  static String pincodeUrl = "https://api.postalpincode.in/pincode/";
  static String versionCode = "";
  // static String domain = "https://schoolclub.in";

  // static String domain = "http://school.uniquepayupi.in";
  static String domain = "http://school.myschooling.in";
  static String baseUrl = "$domain/api$versionCode";
  static String imagesPathStudent =
      "$domain/laravel_app/public/uploads/student/";
  static String imagesPathStaff =
      "$domain/laravel_app/public/uploads/staff/";

  static String loginUrl = "$baseUrl/Account/login";
  static String UploadImageUrl = "$baseUrl/Student/UploadImage";
  // static String UploadImageUrl = "$baseUrl/Student/UploadImage";
  static String createStudentUrl = "$baseUrl/Student/Savebulk";
  static String getStudentUrl = "$baseUrl/Student/GetStudent";
  static String deleteStudentUrl = "$baseUrl/Student/DeleteStudent";
  static String createStaffUrl = "$baseUrl/User/AddStaff";
  static String getStaffUrl = "$baseUrl/User/StaffList";

//User/StaffList?id=



  static String getCasteUrl = "$baseUrl/get-caste-sub-caste";
  static String getGroupUrl = "$baseUrl/get-class-group-data";
  //static String getClassUrl = "$baseUrl/get-class-data";
  static String getClassUrl = "$baseUrl/Student/GetClassMaster";

  static String getDisabilityUrl = "$baseUrl/get-disability-type";
  static String getSerialNoUrl = "$baseUrl/get-sr-no/";
  static String updateStudentUrl = "$baseUrl/Student/Savebulk";

}
