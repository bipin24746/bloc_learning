import 'package:bloc_learning/bloc/products/products_bloc.dart';
import 'package:bloc_learning/bloc/products/products_event.dart';
import 'package:bloc_learning/bloc/products/products_state.dart';
import 'package:bloc_learning/utils/product_enums/product_enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState(){
    super.initState();
    context.read<ProductBloc>().add(ProductFetched());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Api"),
      ),
      body: BlocBuilder<ProductBloc,ProductState>(builder: (context,state){
        switch (state.productStatus){
          case ProductStatus.loading:
            return CircularProgressIndicator();
            case ProductStatus.failure:
              return Text(state.message.toString());
          case ProductStatus.success:
            return ListView.builder(
                itemCount: state.productList.length,
                itemBuilder: (context, index) {
                  final item = state.productList[index];
                  return ListTile(
                      leading: item.image != null
                      ? Image.network(item.image!, width: 50, height: 50, fit: BoxFit.cover)
                      : Placeholder(fallbackHeight: 50, fallbackWidth: 50),
                  title: Text(item.title ?? 'No Title'),
                  subtitle: Text(item.description ?? 'No Description'),
                  trailing: Text('\Rs.${item.price?.toStringAsFixed(2) ?? '0.00'}'),);
                });
        }
      }),
    );
  }
}
