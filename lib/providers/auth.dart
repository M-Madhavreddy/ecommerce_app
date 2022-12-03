import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Auth with ChangeNotifier {
  late String _token;
  late DateTime _expiryDate;
  late String userId;

  Future<void> userSignUp(String email, String password) async {
    final url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyAQkAqvpRhRrFblWZFpQ8W_gjYyCZo1uxs');
    final resonse = await http.post(
      url,
      body: json.encode(
        {
          'email': email,
          'password': password,
          'returnSecureToken': true,
        },
      ),
    );
    print(json.decode(resonse.body));
  }

  Future<void> userLogin(String email , String password) async {
    final url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyAQkAqvpRhRrFblWZFpQ8W_gjYyCZo1uxs');
  final response = await http.post(url,body: json.encode({
    'email' : email ,
    'password' : password,
    'returnSecureToken':true,
  }));
  print(json.decode(response.body));
  }
}
