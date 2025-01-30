import 'package:bloc/bloc.dart';
import 'package:bloc_learning/bloc/products/products_event.dart';
import 'package:bloc_learning/bloc/products/products_state.dart';

class ProductBloc extends Bloc<ProductEvent,ProductState>{
  ProductBloc():super(const ProductState());


}