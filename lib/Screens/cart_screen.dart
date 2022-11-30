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
                OrderButton(order: order, cart: cart)
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

class OrderButton extends StatefulWidget {
   OrderButton({
    Key? key,
    required this.order,
    required this.cart,
  }) : super(key: key);

  final Orders order;
  final Cart cart;
  bool waiting = false ;

  @override
  State<OrderButton> createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: (widget.cart.cartTotal <= 0 ) ? null : () async {
        setState((){
          widget.waiting = true;
        });
        await widget.order.addOrders(widget.cart.items.values.toList(), widget.cart.cartTotal);
        setState((){
          widget.waiting = false;
        });
        widget.cart.clear();
      },
      child: widget.waiting ? const CircularProgressIndicator() : const Text(
        'Order Now',
        style: TextStyle(
            color: Colors.blue, fontWeight: FontWeight.w800),
      ),
    );
  }
}
