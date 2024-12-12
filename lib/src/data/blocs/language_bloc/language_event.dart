part of 'language_bloc.dart';

sealed class LanguageEvent extends Equatable {
  const LanguageEvent();
}
 class ChangeLanguageEvent extends LanguageEvent {
  final String locale ;
  ChangeLanguageEvent({required this.locale});

  @override
  List<Object?> get props => [locale] ;
}
