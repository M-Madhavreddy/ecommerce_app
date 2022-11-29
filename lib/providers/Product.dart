import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart ' as http;

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final double price;
  bool isfavorite;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isfavorite = false,
  });

  void _setFavValue(bool newValue) {
    isfavorite = newValue;
    notifyListeners();
  }

  Future<void> toggleFavoriteStatus() async {

    bool oldStatus = isfavorite;

    isfavorite = !isfavorite ;

    final url = Uri.https('flutter-shopapp-2f255-default-rtdb.firebaseio.com',
        '/products/$id.json');
    try {
      final response =
          await http.patch(url, body: json.encode({'isFavorite': isfavorite}));
      if (response.statusCode >= 400) {
        _setFavValue(oldStatus);
      }
    } catch (error) {
      _setFavValue(oldStatus);
    }
    notifyListeners();
  }
}
