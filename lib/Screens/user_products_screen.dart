import 'package:ecommerce_app/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Widgets/user_product_view.dart';

class UserProductScreen extends StatelessWidget {
  const UserProductScreen({Key? key}) : super(key: key);

  static const routeName = '/userProductScreen';

  @override
  Widget build(BuildContext context) {

    final userProducts = Provider.of<Products>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Your Products'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (ctx, i) => Column(children : [UserProductView(
          imageUrl: userProducts.items[i].imageUrl,
          productId: userProducts.items[i].id,
          productTitle: userProducts.items[i].title,
        ),
        const Divider(),
      ],),
        itemCount: userProducts.items.length,
      ),
    );
  }
}
