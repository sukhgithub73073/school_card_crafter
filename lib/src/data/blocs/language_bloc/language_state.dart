part of 'language_bloc.dart';

sealed class LanguageState extends Equatable {
  const LanguageState();
}

final class LanguageInitial extends LanguageState {
  @override
  List<Object> get props => [];
}
final class LanguageLoading extends LanguageState {
  @override
  List<Object> get props => [];
}

final class LanguageChange extends LanguageState {
  final String locale ;
  LanguageChange({required this.locale});
  @override
  List<Object> get props => [];
}



