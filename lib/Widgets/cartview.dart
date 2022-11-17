import 'package:ecommerce_app/providers/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartView extends StatelessWidget {
  final String id;
  final String productId;
  final String title;
  final double price;
  final int quantity;

  CartView(
      {required this.id,
      required this.productId,
      required this.title,
      required this.price,
      required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 9.0,
      ),
      child: Dismissible(
        key: Key(id),
        direction: DismissDirection.endToStart,
        confirmDismiss: (direction) {
          return showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                    title: const Text('Are you sure ?'),
                    content:
                        const Text('Do you want remove the item from Cart?'),
                    actions: [
                      FlatButton(
                          onPressed: () {
                            Navigator.of(ctx).pop(true);
                          },
                          child: const Text('Yes')),
                      FlatButton(
                          onPressed: () {
                            Navigator.of(ctx).pop(false);
                          },
                          child: const Text('No')),
                    ],
                  ));
        },
        background: Container(
          margin: const EdgeInsets.all(10),
          color: Theme.of(context).errorColor,
          alignment: Alignment.centerRight,
          child: const Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.delete, color: Colors.white),
          ),
        ),
        onDismissed: (id) {
          Provider.of<Cart>(context, listen: false).removeItem(productId);
        },
        child: Card(
          child: ListTile(
            visualDensity: VisualDensity.standard,
            leading: Padding(
              padding: const EdgeInsets.all(5.0),
              child: CircleAvatar(
                child: FittedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text('\$$price'),
                  ),
                ),
              ),
            ),
            title: Text(title),
            subtitle: Text('Total Price : \$${(price * quantity)}'),
            trailing: Text('x$quantity'),
          ),
        ),
      ),
    );
  }
}
