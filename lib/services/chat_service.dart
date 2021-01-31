import 'package:flutter/material.dart';
import 'package:realtime_chat/global/enviroment.dart';
import 'package:realtime_chat/models/messages_response.dart';
import 'package:realtime_chat/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:realtime_chat/services/auth_service.dart';

class ChatService with ChangeNotifier {
  User userTo;

  Future<List<Message>> getChat(
    String userID,
  ) async {
    final resp = await http.get('${Enviroment.apiUrl}/messages/$userID',
        headers: {
          'Content-Type': 'application/json',
          'x-token': await AuthService.getToken()
        });

    final messagesResponse = messagesResponseFromJson(resp.body);

    return messagesResponse.messages;
  }
}
