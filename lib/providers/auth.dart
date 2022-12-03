import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Auth with ChangeNotifier {
   String ? _token;
   DateTime ? _expiryDate;
  late String userId;

  bool get isAuth {
    //return token!=null;
    if (token != null) {
      return true;
    } else {
      return false;
    }
  }

  get token {
    if (_token != null && _expiryDate!=null && _expiryDate!.isAfter(DateTime.now())) {
      return _token;
    }
    return null;
  }

  Future<void> _authenticate(
      String email, String password, String authMethod) async {
    final url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:$authMethod?key=AIzaSyAQkAqvpRhRrFblWZFpQ8W_gjYyCZo1uxs');
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );
      final responsedata = json.decode(response.body);
      if (responsedata['error'] != null) {
        throw HttpException(responsedata['error']['message']);
      }
      _token = responsedata['idToken'];
      _expiryDate = DateTime.now().add(
          Duration(seconds: int.parse(
              responsedata['expiresIn']),
          ));
      userId = responsedata['localId'];
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> userSignUp(String email, String password) async {
    return _authenticate(email, password, 'signUp');
    // final url = Uri.parse(
    //     'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyAQkAqvpRhRrFblWZFpQ8W_gjYyCZo1uxs');
    // final resonse = await http.post(
    //   url,
    //   body: json.encode(
    //     {
    //       'email': email,
    //       'password': password,
    //       'returnSecureToken': true,
    //     },
    //   ),
    // );
    // print(json.decode(resonse.body));
  }

  Future<void> userLogin(String email, String password) async {
    return _authenticate(email, password, 'signInWithPassword');

    // final url = Uri.parse(
    //     'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyAQkAqvpRhRrFblWZFpQ8W_gjYyCZo1uxs');
    // final response = await http.post(url,
    //     body: json.encode({
    //       'email': email,
    //       'password': password,
    //       'returnSecureToken': true,
    //     }));
    // print(json.decode(response.body));
  }
}
