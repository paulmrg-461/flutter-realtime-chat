import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realtime_chat/models/user.dart';
import 'package:realtime_chat/services/auth_service.dart';
import 'package:realtime_chat/services/chat_service.dart';
import 'package:realtime_chat/services/socket_service.dart';
import 'package:realtime_chat/widgets/chat_message.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final _textController = new TextEditingController();
  final _focusNode = new FocusNode();
  bool _isWriting = false;

  ChatService chatService;
  SocketService socketService;
  AuthService authService;

  List<ChatMessage> _messages = [];

  @override
  void initState() {
    this.chatService = Provider.of<ChatService>(context, listen: false);
    this.socketService = Provider.of<SocketService>(context, listen: false);
    this.authService = Provider.of<AuthService>(context, listen: false);

    this.socketService.socket.on('personal-message', _listenMessage);
    super.initState();
  }

  void _listenMessage(dynamic payload) {
    ChatMessage message = new ChatMessage(
        text: payload['message'],
        uid: payload['from'],
        animationController: AnimationController(
            vsync: this, duration: Duration(milliseconds: 300)));
    setState(() {
      _messages.insert(0, message);
    });

    message.animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _myAppBar(this.chatService.userTo),
      body: Container(
        child: Column(
          children: [
            Flexible(
                child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: _messages.length,
              itemBuilder: (_, i) => _messages[i],
              reverse: true,
            )),
            Divider(
              height: 1,
            ),
            Container(
              color: Colors.white,
              child: _inputChat(),
            )
          ],
        ),
      ),
    );
  }

  AppBar _myAppBar(User user) {
    return AppBar(
      backgroundColor: Colors.blue,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
              maxRadius: 18,
              backgroundColor: Colors.blue[100],
              child: Text(
                user.name.substring(0, 2),
                style: TextStyle(fontSize: 16.0),
              )),
          SizedBox(
            width: 12,
          ),
          Text(
            user.name,
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          ),
        ],
      ),
      actions: [IconButton(icon: Icon(Icons.call), onPressed: () {})],
    );
  }

  Widget _inputChat() {
    return SafeArea(
        child: Container(
      margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      child: Row(
        children: [
          Flexible(
              child: TextField(
            controller: _textController,
            onSubmitted: _handleSubmit,
            onChanged: (String text) {
              setState(() {
                _isWriting = (text.trim().length > 0) ? true : false;
              });
            },
            decoration: InputDecoration.collapsed(hintText: 'Enviar mensaje'),
            focusNode: _focusNode,
          )),

          //Send button
          Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: Platform.isIOS
                  ? CupertinoButton(
                      child: Text('Enviar'),
                      onPressed: _isWriting
                          ? () => _handleSubmit(_textController.text.trim())
                          : null)
                  : Container(
                      //margin: EdgeInsets.symmetric(horizontal: 4.0),
                      child: IconTheme(
                        data: IconThemeData(color: Colors.blue[400]),
                        child: IconButton(
                            icon: Icon(Icons.send),
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onPressed: _isWriting
                                ? () =>
                                    _handleSubmit(_textController.text.trim())
                                : null),
                      ),
                    ))
        ],
      ),
    ));
  }

  _handleSubmit(String text) {
    if (text.length == 0) return;

    _textController.clear();
    _focusNode.requestFocus();

    final newMessage = new ChatMessage(
      uid: '123',
      text: text,
      animationController: AnimationController(
          vsync: this, duration: Duration(milliseconds: 300)),
    );
    _messages.insert(0, newMessage);
    newMessage.animationController.forward();

    setState(() {
      _isWriting = false;
    });

    this.socketService.emit('personal-message', {
      'from': this.authService.user.uid,
      'to': this.chatService.userTo.uid,
      'message': text
    });
  }

  @override
  void dispose() {
    for (ChatMessage message in _messages) {
      message.animationController.dispose();
    }

    this.socketService.socket.off('personal-message');
    super.dispose();
  }
}
