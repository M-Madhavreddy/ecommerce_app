import 'package:ecommerce_app/Widgets/products_Gridview.dart';
import 'package:flutter/material.dart';

class ProductScreenOverview extends StatefulWidget {
  @override
  State<ProductScreenOverview> createState() => _ProductScreenOverviewState();
}

class _ProductScreenOverviewState extends State<ProductScreenOverview> {
  bool Favorites = false;

  @override
  Widget build(BuildContext context) {
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
          )
        ],
      ),
      body: product_gridview(Favorites),
    );
  }
}
