import 'package:ecommerce_app/Widgets/products_Gridview.dart';
import 'package:flutter/material.dart';

class ProductScreenOverview extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: product_gridview(),
    );
  }
}

