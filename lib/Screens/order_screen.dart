import 'package:ecommerce_app/Widgets/orderview.dart';
import 'package:ecommerce_app/providers/orders.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<Orders>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Orders',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, i) => orderview(orderdetails: orders.orderList[i] ,),
        itemCount: orders.ordersLength,
      ),
    );
  }
}
