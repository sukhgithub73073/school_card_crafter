import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'language_event.dart';

part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageInitial()) {
    on<ChangeLanguageEvent>(_changeLanguage);
  }

  FutureOr<void> _changeLanguage(
      ChangeLanguageEvent event, Emitter<LanguageState> emit) {
    emit(LanguageLoading());
    emit(LanguageChange(locale: event.locale));
  }
}
