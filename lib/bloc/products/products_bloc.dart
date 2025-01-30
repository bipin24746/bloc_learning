import 'package:bloc/bloc.dart';
import 'package:bloc_learning/bloc/products/products_event.dart';
import 'package:bloc_learning/bloc/products/products_state.dart';
import 'package:bloc_learning/bloc/repository/product/product_repository.dart';
import 'package:bloc_learning/utils/product_enums/product_enums.dart';


class ProductBloc extends Bloc<ProductEvent,ProductState>{
  ProductRepository productRepository = ProductRepository();
  ProductBloc() : super(const ProductState()){
    on<ProductFetched>(fetchedProductApi);
  }
  void fetchedProductApi(ProductFetched Event, Emitter<ProductState>emit) async {
    await productRepository.fetchProduct().then((value){
      emit(state.copyWith(
        productStatus: ProductStatus.success,
        message: "Success",
        productList: value,
      ));
    }).onError((error, stackTrace){
      emit(state.copyWith(
        productStatus: ProductStatus.failure,message: error.toString()
      ));
    });
  }
}
