import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:card_craft/src/data/models/cast_model.dart';
import 'package:card_craft/src/data/network/api_status_code.dart';
import 'package:card_craft/src/data/repository/register_repo.dart';
import 'package:get_it/get_it.dart';

part 'cast_event.dart';

part 'cast_state.dart';

class CastBloc extends Bloc<CastEvent, CastState> {
  var registerRepository = GetIt.I<RegisterRepository>();

  CastBloc() : super(CastInitial()) {
    on<GetCastEvent>(_getCastApi);
  }

  Future<FutureOr<void>> _getCastApi(
      GetCastEvent event, Emitter<CastState> emit) async {
    try {
      emit(CastLoading());
      var responseModel = await registerRepository.getCastListApi();
      emit(CastLoaded(casteModel: CasteModel.fromJson(responseModel.data)));
    } catch (e) {
      emit(CastError(error: e.toString()));
    }
  }
}
