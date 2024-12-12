part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();
}

class ProductInitial extends ProductState {
  @override
  List<Object> get props => [];
}
class ProductLoading extends ProductState {
  @override
  List<Object> get props => [];
}
class ProductSuccess extends ProductState {
  final ResponseModel responseModel ;
  ProductSuccess({required this.responseModel});
  @override
  List<Object> get props => [responseModel];
}
class ProductError extends ProductState {
  final String error ;
  ProductError({required this.error});

  @override
  List<Object> get props => [error];
}
