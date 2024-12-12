import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faker/faker.dart';
import 'package:card_craft/src/data/models/response_model.dart';
import 'package:card_craft/src/data/network/api_status_code.dart';
import 'package:card_craft/src/data/network/http_service.dart';
import 'package:card_craft/src/enums/role_enum.dart';
import 'package:card_craft/src/ui/register/student_registration/student_data.dart';
import 'package:card_craft/src/utility/app_data.dart';

abstract class RegisterRepository {
  Future<ResponseModel> registerApi(Map<String, dynamic> body);

  Future<ResponseModel> updateStudentApi(Map<String, dynamic> body);

  Future<ResponseModel> updateStaffApi(Map<String, dynamic> body);

  Future<ResponseModel> getDisablity(Map<String, dynamic> body);

  Future<ResponseModel> getCastListApi();

  Future<ResponseModel> getSerialNoApi();
}

class RegisterRepositoryImp extends RegisterRepository {
  @override
  Future<ResponseModel> registerApi(Map<String, dynamic> body) async {
    var responseModel = await ResponseModel(
        success: false, data: null, errors: null, message: "");

    try {
      var _fullUrl =
          "${ApisEndpoints.createStudentUrl}?ProjectId=${body["projectId"]}";
      if (body["TYPE"] == RoleEnum.Staff.name) {
        _fullUrl =
        "${ApisEndpoints.createStaffUrl}?ProjectId=${body["projectId"]}";
      }

      if (StudentData.selectedImage == null) {
        print(">>>>>>>>>>>>>>>>>>image null");

        responseModel = await HttpService()
            .postRequest(fullUrl: _fullUrl, body: body, useTokenInBody: true);
      } else {
        print(
            ">>>>>>>>>>>>>>>>>>image not null ${StudentData.selectedImage!.path}");

        var responseImage = await HttpService().postRequestMultipart(
            fullUrl:
            "${ApisEndpoints.UploadImageUrl}?ProjectId=${AppData.userModel.data.projectId}",
            body: {},
            useTokenInBody: true,
            files: StudentData.selectedImage == null
                ? []
                : [StudentData.selectedImage!]);

        if (body["TYPE"] == RoleEnum.student.name) {
          body["studentForICard"][0]["imageUrl"] =
          responseImage.success ? responseImage.data.toString() : "";
        }

        responseModel = await HttpService()
            .postRequest(fullUrl: _fullUrl, body: body, useTokenInBody: true);
      }
    } catch (e, t) {
      print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>EEEE>>>>$t");
    }
    return responseModel;
  }

  @override
  Future<ResponseModel> updateStudentApi(Map<String, dynamic> body) async {
    var responseModel = await ResponseModel(
        success: false, data: null, errors: null, message: "");
    try {
      var _fullUrl =
          "${ApisEndpoints.createStudentUrl}?ProjectId=${body["projectId"]}";
      if (body["TYPE"] == RoleEnum.Staff.name) {
        _fullUrl =
        "${ApisEndpoints.createStaffUrl}?ProjectId=${body["projectId"]}";
      }
      if (StudentData.selectedImage == null) {
        print(">>>>>>>>>>>>>>>>>>image null");

        responseModel = await HttpService()
            .postRequest(fullUrl: _fullUrl, body: body, useTokenInBody: true);
      } else {
        print(
            ">>>>>>>>>>>>>>>>>>image not null ${StudentData.selectedImage!.path}");

        var responseImage = await HttpService().postRequestMultipart(
            fullUrl:
            "${ApisEndpoints.UploadImageUrl}?ProjectId=${AppData.userModel.data.projectId}",
            body: {},
            useTokenInBody: true,
            files: StudentData.selectedImage == null
                ? []
                : [StudentData.selectedImage!]);

        if (body["TYPE"] == RoleEnum.student.name) {
          body["studentForICard"][0]["imageUrl"] =
          responseImage.success ? responseImage.data.toString() : "";
        }

        responseModel = await HttpService()
            .postRequest(fullUrl: _fullUrl, body: body, useTokenInBody: true);
      }
    } catch (e, t) {
      print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>EEEE>>>>$t");
    }

    return responseModel;
  }

  @override
  Future<ResponseModel> updateStaffApi(Map<String, dynamic> body) async {
    var responseModel = await ResponseModel(
        success: false, data: null, errors: null, message: "");

    var _fullUrl = "${ApisEndpoints.createStaffUrl}";

    if (StudentData.selectedImage == null) {
      print(">>>>>>>>>>>>>>>>>>UPDATE image null");
      responseModel = await HttpService()
          .postRequest(fullUrl: _fullUrl, body: body, useTokenInBody: true);
    } else {
      print(">>>>>>>>>>>>>>>>>>UPDATE image not null");
      responseModel = await HttpService().postRequestMultipart(
          fullUrl: _fullUrl,
          body: body,
          useTokenInBody: true,
          files: StudentData.selectedImage == null
              ? []
              : [StudentData.selectedImage!]);
    }
    return responseModel;
  }

  @override
  Future<ResponseModel> getCastListApi() async {
    var res = await HttpService()
        .getRequest(fullUrl: ApisEndpoints.getCasteUrl, useTokenInBody: true);

    return res;
  }

  @override
  Future<ResponseModel> getDisablity(Map<String, dynamic> body) async {
    var res = await HttpService().getRequest(
        fullUrl: ApisEndpoints.getDisabilityUrl, useTokenInBody: true);

    return res;
  }

  @override
  Future<ResponseModel> getSerialNoApi() async {
    var res = await HttpService().getRequestWithForm(
        fullUrl: "${ApisEndpoints.getSerialNoUrl}", useTokenInBody: true);
    return res;
  }
}
