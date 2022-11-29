import 'package:ecommerce_app/Screens/add_or_edit_product_screen.dart';
import 'package:ecommerce_app/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserProductView extends StatelessWidget {
  final String imageUrl;
  final String productId;
  final String productTitle;

  UserProductView(
      {required this.imageUrl,
      required this.productId,
      required this.productTitle});

  @override
  Widget build(BuildContext context) {
    final scaffold = Scaffold.of(context);

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(imageUrl),
        ),
        title: Text(
          productTitle,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
        ),
        //subtitle: Text(productId),
        trailing: Container(
          width: 100,
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(EditProductScreen.routeName,
                      arguments: productId);
                },
                icon: Icon(Icons.edit, color: Theme.of(context).accentColor),
              ),
              IconButton(
                onPressed: () async {
                  try {
                    await Provider.of<Products>(context, listen: false)
                        .deleteProduct(productId);
                  } catch (error) {
                    scaffold.showSnackBar(
                        const SnackBar(content: Text('Error in deleting')));
                  }
                },
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).errorColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
