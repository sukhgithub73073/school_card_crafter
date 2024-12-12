import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:card_craft/src/data/models/response_model.dart';
import 'package:card_craft/src/data/network/api_status_code.dart';
import 'package:card_craft/src/utility/app_util.dart';
import 'package:card_craft/src/utility/firestore_table.dart';

abstract class SubjectRepository {
  Future<ResponseModel> getSubjectApi(Map<String, dynamic> map);

  Future<ResponseModel> createSubjectApi(Map<String, dynamic> map);
}

class SubjectRepositoryImp extends SubjectRepository {
  @override
  Future<ResponseModel> getSubjectApi(Map<String, dynamic> map) async {
    var responseModel = await ResponseModel(success: false,data: null,errors: null,message: "");
    CollectionReference collectionRef =
        FirebaseFirestore.instance.collection(tblSubject);
    Query query =
        collectionRef.where("school_code", isEqualTo: map["school_code"]);
    QuerySnapshot querySnapshot = await query.get();

    printLog("getSubjectApi>>>>>>>>${querySnapshot.docs.length}");
    responseModel.success = true;
    responseModel.message = "Class Successful!";
    responseModel.data = querySnapshot.docs;
    return responseModel;
  }

  @override
  Future<ResponseModel> createSubjectApi(Map<String, dynamic> map) async {
    var responseModel = await ResponseModel(success: false,data: null,errors: null,message: "");
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection(tblSubject)
        .where("school_code", isEqualTo: map["school_code"])
        .where("subject_name", isEqualTo: map["subject_name"])
        .get();
    if (querySnapshot.docs.isEmpty) {
      var res =
          await FirebaseFirestore.instance.collection(tblSubject).add(map);
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection(tblSubject)
          .where("school_code", isEqualTo: map["school_code"])
          .get();
      responseModel.success = true;
      responseModel.message = "Subject Created Successful!";
      responseModel.data = querySnapshot.docs;
    } else {
      responseModel.success = false;
      responseModel.message =
          "Subject name already exists! Please use a different name.";
      responseModel.data = {};
    }

    return responseModel;
  }
}
