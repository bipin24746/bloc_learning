import 'package:bloc_learning/model/product/product_model.dart';
import 'package:bloc_learning/utils/product_enums/product_enums.dart';
import 'package:equatable/equatable.dart';

class ProductState extends Equatable{
  final ProductStatus productStatus;
  final List<ProductModel> productList;
  final String message;
  const ProductState({
    this.productStatus = ProductStatus.loading,
    this.productList = const <ProductModel>[],
    this.message ='',
});

  ProductState copyWith({ProductStatus? productStatus,List<ProductModel>? productList, String? message, }){
    return ProductState(
      productList: productList ?? this.productList,
      productStatus: productStatus ?? this.productStatus,
      message: message ?? this.message,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [productStatus,productList,message];

}