import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:card_craft/src/core/drop_down/drop_list_model.dart';
import 'package:card_craft/src/data/repository/register_repo.dart';

part 'disability_event.dart';

part 'disability_state.dart';

class DisabilityBloc extends Bloc<DisabilityEvent, DisabilityState> {
  var registerRepository = GetIt.I<RegisterRepository>();

  DisabilityBloc() : super(DisabilityInitial()) {
    on<GetDisabilityEvent>(_getDisabiltyApi);
  }

  Future<FutureOr<void>> _getDisabiltyApi(
      GetDisabilityEvent event, Emitter<DisabilityState> emit) async {
    try {
      emit(DisabilityLoading());
      var responseModel = await registerRepository.getDisablity(event.map);
      var list = (responseModel.data['data'] as List)
          .map((item) => DropListModel.fromJson(item))
          .toList();
      emit(DisabilityLoaded(list: list));
    } catch (e) {
      emit(DisabilityError(error: e.toString()));
    }
  }
}
