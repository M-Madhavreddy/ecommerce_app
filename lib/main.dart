import 'package:ecommerce_app/Screens/add_newproduct_screen.dart';
import 'package:ecommerce_app/Screens/user_products_screen.dart';
import './Screens/Product_DetailScreen.dart';
import './Screens/cart_screen.dart';
import './Screens/order_screen.dart';
import './providers/cart.dart';
import './providers/orders.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Screens/HomePage.dart';
import './providers/products_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (ctx) => Products(),
          ),
          ChangeNotifierProvider(
            create: (ctx) => Cart(),
          ),
          ChangeNotifierProvider(
            create: (ctx) => Orders(),
          ),
        ],
        child: MaterialApp(
          theme: ThemeData(
              primarySwatch: Colors.purple,
              accentColor: Colors.deepOrangeAccent,
              fontFamily: 'Lato'),
          home: const HomePage_Ecommerce(),
          routes: {
            '/ProductDetailScreen': (ctx) => ProductDetailScreen(),
            '/cartScreen': (ctx) => CartScreen(),
            '/orderScreen' : (ctx) => OrdersScreen(),
            UserProductScreen.routeName : (ctx) => UserProductScreen(),
            EditProductScreen.routeName : (ctx) => EditProductScreen(),
          },
        ));
  }
}
