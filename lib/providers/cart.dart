import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem(
      {required this.id,
      required this.title,
      required this.price,
      required this.quantity});
}

class Cart with ChangeNotifier {
   Map<String, CartItem> _items ={};

  Map<String, CartItem> get items {
    return {..._items};
  }

  void addCartItems(String id, String title, double price) {
    if (_items.containsKey(id)) {
      _items.update(
          id,
          (value) => CartItem(
              id: value.id,
              title: value.title,
              price: value.price,
              quantity: value.quantity + 1));
    } else {
      _items.putIfAbsent(
          id,
          () => CartItem(
              id: DateTime.now().toString(),
              title: title,
              price: price,
              quantity: 1));
    }
    notifyListeners();
  }

   int get itemCount {
     return _items.length;
   }

   double get cartTotal {
     double total=0.0;
     _items.forEach((key, cartItem) {
       total += cartItem.quantity * cartItem.price ;
     });
     return total;
   }


}
