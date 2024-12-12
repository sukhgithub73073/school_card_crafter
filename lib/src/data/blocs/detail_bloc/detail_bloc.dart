import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:card_craft/src/data/models/response_model.dart';
import 'package:card_craft/src/data/repository/school_repo.dart';
import 'package:get_it/get_it.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  var schoolRepository = GetIt.I<SchoolRepository>();

  DetailBloc() : super(DetailInitial()) {
    on<VerifyDetailEvent>(_getSchoolInfo);
  }
  Future<FutureOr<void>> _getSchoolInfo(VerifyDetailEvent event, Emitter<DetailState> emit) async {
    try {
      emit(DetailLoading());
      emit(DetailSuccess(responseModel: await schoolRepository.getSchoolDetail(map: event.map)));

    } catch (e) {
      emit(DetailError(error: e.toString())) ;
    }

  }
}
