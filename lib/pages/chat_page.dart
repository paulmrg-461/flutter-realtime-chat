import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _textController = new TextEditingController();
  final _focusNode = new FocusNode();
  bool _isWriting = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _myAppBar(),
      body: Container(
        child: Column(
          children: [
            Flexible(
                child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemBuilder: (_, i) => Text('$i'),
              reverse: true,
            )),
            Divider(
              height: 1,
            ),
            //TODO: TextBox
            Container(
              color: Colors.white,
              child: _inputChat(),
            )
          ],
        ),
      ),
    );
  }

  AppBar _myAppBar() {
    return AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
                maxRadius: 16,
                backgroundColor: Colors.blue[100],
                child: Text(
                  'Na',
                  style: TextStyle(fontSize: 12.0),
                )),
            SizedBox(
              width: 12.0,
            ),
            Text(
              'Natalia Flores',
              style: TextStyle(color: Colors.black87, fontSize: 14.0),
            ),
          ],
        ));
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
              child: !Platform.isIOS
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
    print(text);
    _textController.clear();
    _focusNode.requestFocus();
    setState(() {
      _isWriting = false;
    });
  }
}
