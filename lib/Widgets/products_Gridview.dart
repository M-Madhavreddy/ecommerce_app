import 'package:ecommerce_app/Widgets/Productview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products_provider.dart';

class product_gridview extends StatelessWidget {
  bool Favorites;
  product_gridview(this.Favorites);

  @override
  Widget build(BuildContext context) {
    final productdata = Provider.of<Products>(context);

    final products = Favorites ? productdata.Favs : productdata.items;
    return GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
              //create: (ctx) => products[index],
              value: products[index],
              child: productview(),
            ),
        itemCount: products.length);
  }
}
