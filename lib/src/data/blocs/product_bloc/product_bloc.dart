import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:card_craft/src/data/models/response_model.dart';
import 'package:card_craft/src/data/repository/product_repo.dart';
import 'package:get_it/get_it.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  var productRepository = GetIt.I<ProductRepository>();

    ProductBloc() : super(ProductInitial()) {
    on<GetProductEvent>(_getProduct);
  }

  Future<FutureOr<void>> _getProduct(GetProductEvent event, Emitter<ProductState> emit) async {
      emit(ProductLoading()) ;
      var responseModel = await productRepository.getProductApi();
      emit(ProductSuccess(responseModel: responseModel)) ;
  }
}
