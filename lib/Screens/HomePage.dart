import 'package:ecommerce_app/Screens/ProductScreenOverview.dart';
import 'package:flutter/material.dart';

class HomePage_Ecommerce extends StatelessWidget {

  final routeName = '/homepage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('E-Commerce_App'),
      // ),
      body: ProductScreenOverview(),
    );
  }
}
