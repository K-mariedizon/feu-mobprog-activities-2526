import 'dart:convert';
import 'package:expense_app/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

var apiUrl = '17bckriqx0.execute-api.ap-southeast-2.amazonaws.com'; 
var stage = '/prod'; 

class LoginService {

  Future loginRequest({
    required BuildContext context,
    required String username,
    required String password,
  }) async {

    final uri = Uri.https(
      apiUrl,
      '$stage/login',
      {
        'username': username.trim(),
        'password': password.trim(),
      },
    ); 

    final response = await http.get(uri); 

    if (!context.mounted) {
      return null;
    } 

    final Map? responseBody = jsonDecode(
      response.body,
    ); 

    if (response.statusCode >= 400) {
      // Logic for showing login failed dialog [5], [6]
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Login failed.', /* styling */),
            content: Text(
                responseBody != null
                    ? responseBody['message']
                    : 'Internal Server Error',
                /* styling */
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: Text('OK'),
              ),
            ],
          ),
      );
      return null;
    }

    BaseAppUser loginUser = BaseAppUser.fromJson(responseBody!['data']); 
    return loginUser; 
  }
}