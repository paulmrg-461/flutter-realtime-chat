import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:realtime_chat/global/enviroment.dart';
import 'package:realtime_chat/models/login_response.dart';
import 'package:realtime_chat/models/user.dart';

class AuthService with ChangeNotifier {
  User user;
  bool _authenticating = false;

  bool get authenticating => this._authenticating;
  set authenticating(bool authenticating) {
    this._authenticating = authenticating;
    notifyListeners();
  }

  Future<bool> login(String email, String password) async {
    this.authenticating = true;

    final data = {'email': email, 'password': password};

    final resp = await http.post('${Enviroment.apiUrl}/login',
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});

    print(resp.body);
    this.authenticating = false;

    if (resp.statusCode == 200) {
      final loginResponse = loginResponseFromJson(resp.body);
      this.user = loginResponse.user;
      //TODO: Save token in safe place

      return true;
    } else {
      return false;
    }
  }
}
