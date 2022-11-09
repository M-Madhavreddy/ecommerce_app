import 'package:ecommerce_app/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routename = '/ProductDetailScreen';
    final productid = ModalRoute.of(context)?.settings.arguments as String;
    final products = Provider.of<Products>(context)
        .items
        .firstWhere((product) => product.id == productid);

    return Scaffold(
      appBar: AppBar(
        title: Text(products.title),
      ),
      body: Center(
        child: Container(
          child: Text('this is product screen'),
        ),
      ),
    );
  }
}
