import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  final String id;
  final String title;
  final double price;
  final int quantity;

  CartView(
      {required this.id,
      required this.title,
      required this.price,
      required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: ListTile(visualDensity: VisualDensity.standard,
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: CircleAvatar(
            child: FittedBox(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text('\$${price}'),
              ),
            ),
          ),
        ),
        title: Text(title),
        subtitle: Text('Total Price : \$${(price * quantity)}'),
        trailing: Text('x${quantity}'),
      ),
    );
  }
}
