import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class ProductFetched extends ProductEvent{}