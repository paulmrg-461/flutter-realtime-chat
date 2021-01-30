import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:realtime_chat/global/enviroment.dart';

class AuthService with ChangeNotifier {
  //User user;??

  Future login(String email, String password) async {
    final data = {'email': email, 'password': password};

    final resp = await http.post('${Enviroment.apiUrl}/login',
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});

    print(resp.body);
  }
}
