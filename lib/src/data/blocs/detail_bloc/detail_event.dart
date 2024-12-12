part of 'detail_bloc.dart';

abstract class DetailEvent extends Equatable {
  const DetailEvent();
}

class VerifyDetailEvent extends DetailEvent {
  final Map<String, dynamic> map;

  const VerifyDetailEvent({required this.map});

  @override
  List<Object?> get props => [map];
}
