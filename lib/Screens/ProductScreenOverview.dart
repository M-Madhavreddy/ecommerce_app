import 'package:ecommerce_app/Widgets/badge.dart';
import 'package:ecommerce_app/Widgets/products_Gridview.dart';
import 'package:ecommerce_app/providers/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductScreenOverview extends StatefulWidget {
  @override
  State<ProductScreenOverview> createState() => _ProductScreenOverviewState();
}

class _ProductScreenOverviewState extends State<ProductScreenOverview> {
  bool Favorites = false;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Favorites'),
                value: 0,
              ),
              PopupMenuItem(
                child: Text('ALL Products'),
                value: 1,
              ),
            ],
            onSelected: (int value) {
              setState(() {
                if (value == 0) {
                  Favorites = true;
                } else {
                  Favorites = false;
                }
              });
            },
          ),
          Consumer(
            builder: ((context, Cart, child) => Badge(
                  child: IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {},
                  ),
                  value: cart.itemcount,
                  color: Theme.of(context).accentColor,
                )),
          )
        ],
      ),
      body: product_gridview(Favorites),
    );
  }
}
