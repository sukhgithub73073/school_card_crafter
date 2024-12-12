import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_storage/hive_storage.dart';
import 'package:card_craft/src/data/models/response_model.dart';
import 'package:card_craft/src/data/models/user_model.dart';
import 'package:card_craft/src/data/network/api_status_code.dart';
import 'package:card_craft/src/data/repository/login%20_repo.dart';
import 'package:get_it/get_it.dart';
import 'package:card_craft/src/utility/app_data.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  var loginRepository = GetIt.I<LoginRepository>();

  LoginBloc() : super(LoginInitial()) {
    on<DoLoginEvent>(_login);
    on<UpdateLoginEvent>(_onUpdateLoginEvent);
  }

  Future<FutureOr<void>> _login(
      DoLoginEvent event, Emitter<LoginState> emit) async {
    try {
      emit(LoginLoading());
      ResponseModel responseModel = await loginRepository.loginApi(event.map);
      if (responseModel.success) {
          var loginResponse = jsonEncode(responseModel);
        getHiveStorage.write(key: "LOGIN_RESPONSE", value: loginResponse);

        log(">>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<,,${loginResponse}") ;

        var userModel = userModelFromJson(loginResponse);
        AppData.userModel = userModel;
        AppData.authToken = userModel.data?.token ?? "";
        emit(LoginSuccess(userModel: userModel));
      } else {
        emit(LoginError(error: responseModel.message));
      }
    } catch (e, t) {
      print("$e>>>$t");
      emit(LoginError(error: e.toString()));
    }
  }

  Future<FutureOr<void>> _onUpdateLoginEvent(
      UpdateLoginEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    var loginResponse = await getHiveStorage.read<String>(
        key: "LOGIN_RESPONSE", defaultValue: "");
    var userModel = userModelFromJson(loginResponse ?? "");
    AppData.userModel = userModel;
    AppData.authToken = userModel.data?.token ?? "";
    emit(LoginSuccess(userModel: userModel));
  }
}
