part of 'pincode_bloc.dart';

abstract class PincodeEvent extends Equatable {
  const PincodeEvent();
}
class GetInfoPincodeEvent extends PincodeEvent {
  final String pincode ;
  const GetInfoPincodeEvent({required this.pincode});
  @override
  List<Object?> get props => [pincode];
}
