import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:card_craft/src/data/models/response_model.dart';
import 'package:card_craft/src/data/network/api_status_code.dart';
import 'package:card_craft/src/data/network/http_service.dart';
import 'package:card_craft/src/utility/app_data.dart';
import 'package:card_craft/src/utility/app_util.dart';
import 'package:card_craft/src/utility/firestore_table.dart';

abstract class StudentRepository {
  Future<ResponseModel> getStudentApi(Map<String, dynamic> map);

  Future<ResponseModel> deleteStudentApi(Map<String, dynamic> map);

  Future<ResponseModel> createClassApi(Map<String, dynamic> map);
}

class StudentRepositoryImp extends StudentRepository {
  @override
  Future<ResponseModel> getStudentApi(Map<String, dynamic> map) async {
    var _url = "${ApisEndpoints.getStudentUrl}?ProjectId=${map["ProjectId"]}";
    return await HttpService().postRequest(fullUrl: _url, body: map);
  }

  @override
  Future<ResponseModel> deleteStudentApi(Map<String, dynamic> map) async {
    var _url =
        "${ApisEndpoints.deleteStudentUrl}?Id=${map["studentIds"]}";
    return await HttpService().postRequest(fullUrl: _url, body: {});
  }

  @override
  Future<ResponseModel> createClassApi(Map<String, dynamic> map) async {
    var responseModel = await ResponseModel(
        success: false, data: null, errors: null, message: "");
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection(tblStudent)
        .where("school_code", isEqualTo: map["school_code"])
        .where("class_name", isEqualTo: map["class_name"])
        .get();
    if (querySnapshot.docs.isEmpty) {
      var res =
          await FirebaseFirestore.instance.collection(tblStudent).add(map);
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection(tblStudent)
          .where("school_code", isEqualTo: map["school_code"])
          .get();
      responseModel.success = true;
      responseModel.message = "Class Created Successful!";
      responseModel.data = querySnapshot.docs;
    } else {
      responseModel.success = false;
      responseModel.message =
          "Class name already exists! Please use a different name.";
      responseModel.data = {};
    }

    return responseModel;
  }
}
