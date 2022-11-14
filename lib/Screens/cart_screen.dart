import 'package:ecommerce_app/Widgets/cartview.dart';
import 'package:ecommerce_app/providers/cart.dart' show Cart;
import 'package:ecommerce_app/providers/orders.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeName = '/cartScreen';
    final cart = Provider.of<Cart>(context);
    final order = Provider.of<Orders>(context);
    final List cartList = cart.items.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'Your order value :',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Chip(
                  label: Text('\$${cart.cartTotal.toStringAsFixed(2)}'),
                ),
                FlatButton(
                  onPressed: () {
                    order.addOrders(cart.items.values.toList(), cart.cartTotal);
                    cart.clear();
                    Navigator.of(context).pushNamed('/orderScreen');
                  },
                  child: const Text(
                    'Order Now',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.w800),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cart.itemCount,
              itemBuilder: (ctx, index) => CartView(
                  id: cartList[index].id,
                  productId: cart.items.keys.toList()[index],
                  title: cartList[index].title,
                  price: cartList[index].price,
                  quantity: cartList[index].quantity),
            ),
          ),
        ],
      ),
    );
  }
}
