import 'dart:async';


import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';


part 'dashboard_event.dart';

part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {



  DashboardBloc() : super(DashboardInitial()) {
    on<DashboardEvent>(_onLoadListEvent);
    on<UpdateIndexEvent>(_onUpdateIndex);
  }

  FutureOr<void> _onLoadListEvent(
      DashboardEvent event, Emitter<DashboardState> emit) {
    emit(DashboardLoading());


  }

  FutureOr<void> _onUpdateIndex(UpdateIndexEvent event, Emitter<DashboardState> emit) {
    emit(DashboardLoading());


  }
}
