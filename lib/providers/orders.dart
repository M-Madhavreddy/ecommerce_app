import 'package:ecommerce_app/providers/cart.dart';
import 'package:flutter/material.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem({
    required this.id,
    required this.amount,
    required this.products,
    required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  final List<OrderItem> _orders = [];

  List<OrderItem> get orderList {
    return [..._orders];
  }

  void addOrders(List<CartItem> cartproducts, double total) {
    _orders.insert(
      0,
      OrderItem(
        id: DateTime.now().toString(),
        amount: total,
        products: cartproducts,
        dateTime: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
