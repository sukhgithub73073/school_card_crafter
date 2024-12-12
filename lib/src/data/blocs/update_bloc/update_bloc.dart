import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:card_craft/src/data/network/api_status_code.dart';
import 'package:card_craft/src/data/repository/register_repo.dart';

part 'update_event.dart';
part 'update_state.dart';

class UpdateBloc extends Bloc<UpdateEvent, UpdateState> {
  var registerRepository = GetIt.I<RegisterRepository>();

  UpdateBloc() : super(UpdateInitial()) {
    on<UpdateStudentEvent>(_updateStudent);
    on<UpdateStaffEvent>(_updateStaff);
  }

  Future<FutureOr<void>> _updateStudent(UpdateStudentEvent event, Emitter<UpdateState> emit) async {
    emit(UpdateLoading());
    try {
      var responseModel = await registerRepository.updateStudentApi(event.map);
      if (responseModel.success) {
        emit(UpdateSuccess());
      } else {
        emit(UpdateError(error: responseModel.message));
      }
    } catch (e) {
      emit(UpdateError(error: e.toString()));
    }
  }

  Future<FutureOr<void>> _updateStaff(UpdateStaffEvent event, Emitter<UpdateState> emit) async {
    emit(UpdateLoading());
    try {
      var responseModel = await registerRepository.updateStaffApi(event.map);
      if (responseModel.success) {
        emit(UpdateSuccess());
      } else {
        emit(UpdateError(error: responseModel.message));
      }
    } catch (e) {
      emit(UpdateError(error: e.toString()));
    }
  }
}
