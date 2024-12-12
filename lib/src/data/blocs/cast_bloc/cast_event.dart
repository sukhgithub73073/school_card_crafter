part of 'cast_bloc.dart';

sealed class CastEvent extends Equatable {
  const CastEvent();
}

class GetCastEvent extends CastEvent {
  const GetCastEvent();

  @override
  List<Object?> get props => [];
}
