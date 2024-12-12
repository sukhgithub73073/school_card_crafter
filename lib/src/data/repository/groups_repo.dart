import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:card_craft/src/data/models/response_model.dart';
import 'package:card_craft/src/data/network/api_status_code.dart';
import 'package:card_craft/src/data/network/http_service.dart';
import 'package:card_craft/src/utility/firestore_table.dart';

abstract class GroupsRepository {
  Future<ResponseModel> groupsApi(Map<String, dynamic> map);

  Future<ResponseModel> addGroupsApi(Map<String, dynamic> map);
}

class GroupsRepositoryImp extends GroupsRepository {
  @override
  Future<ResponseModel> groupsApi(Map<String, dynamic> map) async {
    var res = await HttpService().postRequest(
        fullUrl: ApisEndpoints.getGroupUrl,
        useTokenInBody: true,
        body: map);

    return res;
  }

  @override
  Future<ResponseModel> addGroupsApi(Map<String, dynamic> map) async {
    var responseModel =
        await ResponseModel(success: false, data: null, errors: null, message: "");
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection(tblGroup)
        .where("school_code", isEqualTo: map["school_code"])
        .where("group_name", isEqualTo: map["group_name"])
        .get();
    if (querySnapshot.docs.isEmpty) {
      var res = await FirebaseFirestore.instance.collection(tblGroup).add(map);
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection(tblGroup)
          .where("school_code", isEqualTo: map["school_code"])
          .get();
      responseModel.success = true;
      responseModel.message = "Groups Created Successful!";
      responseModel.data = querySnapshot.docs;
    } else {
      responseModel.success = false;
      responseModel.message =
          "Group name already exists! Please use a different name.";
      responseModel.data = {};
    }

    return responseModel;
  }
}
