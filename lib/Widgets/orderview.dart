import 'package:ecommerce_app/providers/orders.dart';
import 'package:flutter/material.dart';

class orderview extends StatelessWidget {

  final OrderItem orderdetails;
  orderview({required this.orderdetails});

  @override
  Widget build(BuildContext context) {

    const routename = '/orderScreen';

    return Card(
      elevation: 6,
      child: ListTile(
        title: Text('${orderdetails.amount}'),
        subtitle: Text('${orderdetails.dateTime}'),

      ),
    );
  }
}
