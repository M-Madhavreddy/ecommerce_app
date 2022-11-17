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
  bool favorites = false;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: 0,
                child: Text('Favorites'),
              ),
              const PopupMenuItem(
                value: 1,
                child: Text('ALL Products'),
              ),
              const PopupMenuItem(
                value: 2,
                child: Text('Orders'),
              ),
            ],
            onSelected: (int value) {
              setState(() {
                if (value == 0) {
                  favorites = true;
                } else {
                  favorites = false;
                }
                if (value == 2){
                  Navigator.of(context).pushNamed('/orderScreen');
                }
              });
            },
          ),
          Consumer(
            builder: ((context, Cart, child) => Badge(
                  value: cart.itemCount.toString(),
                  color: Theme.of(context).accentColor,
                  child: IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/cartScreen');
                    },
                  ),
                )
            ),
          )
        ],
      ),
      body: product_gridview(favorites),
    );
  }
}
