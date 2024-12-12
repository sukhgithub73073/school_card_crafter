import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:card_craft/src/data/models/response_model.dart';
import 'package:card_craft/src/data/network/api_status_code.dart';
import 'package:card_craft/src/data/network/http_service.dart';

abstract class LoginRepository {
  Future<ResponseModel> loginApi(Map<String, dynamic> map);
}

class LoginRepositoryImp extends LoginRepository {
  @override
  Future<ResponseModel> loginApi(Map<String, dynamic> map) async {
    return await HttpService()
        .postRequest(fullUrl: ApisEndpoints.loginUrl, body: map);
  }
}
