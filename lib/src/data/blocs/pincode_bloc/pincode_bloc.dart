import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:card_craft/src/data/models/pincode_model.dart';
import 'package:card_craft/src/data/models/response_model.dart';
import 'package:card_craft/src/data/repository/pincode_repo.dart';
import 'package:card_craft/src/utility/app_util.dart';
import 'package:get_it/get_it.dart';

part 'pincode_event.dart';

part 'pincode_state.dart';

class PincodeBloc extends Bloc<PincodeEvent, PincodeState> {
  var pincodeRepository = GetIt.I<PincodeRepository>();

  PincodeBloc() : super(PincodeInitial()) {
    on<GetInfoPincodeEvent>(_getPincodeInfo);
  }

  Future<FutureOr<void>> _getPincodeInfo(
      GetInfoPincodeEvent event, Emitter<PincodeState> emit) async {
    try {
      emit(PincodeLoading());
      var responseModel =
          await pincodeRepository.getPincodeInfoApi(pincode: event.pincode);
      printLog("_getPincodeInfo  Res==> ${responseModel.data}");

      if (responseModel.data[0]["Status"] == "Error") {
        emit(PincodeError(
            error: "Your pincode is incorrect, Please enter connect pincode"));
      } else {
        final List<PincodeModel> list = List<PincodeModel>.from(
            responseModel.data.map((json) => PincodeModel.fromJson(json)));
        responseModel.data = list;
        emit(PincodeSuccess(responseModel: responseModel));
      }
    } catch (e, t) {
      printLog(
          "_getPincodeInfo  Exception==> ${e.toString()}>>${t.toString()}");

      emit(PincodeError(error: e.toString()));
    }
  }
}
