import 'dart:convert';

import 'package:card_craft/src/data/models/pincode_model.dart';
import 'package:card_craft/src/data/models/response_model.dart';
import 'package:card_craft/src/data/network/http_service.dart';
import 'package:card_craft/src/utility/app_util.dart';

abstract class PincodeRepository {
  Future<ResponseModel> getPincodeInfoApi({required String pincode});
}

class PincodeRepositoryImp extends PincodeRepository {
  @override
  Future<ResponseModel> getPincodeInfoApi({required String pincode}) async {
    ResponseModel responseModel = ResponseModel(success: false,data: null,errors: null,message: "");
    try {
      responseModel = await HttpService().getRequest(
        fullUrl: ApisEndpoints.pincodeUrl + pincode,
      );
    } catch (e, t) {
      printLog(
          "getPincodeInfoApi  Exception==> ${e.toString()}>>${t.toString()}");
    }

    return responseModel;
  }
}
