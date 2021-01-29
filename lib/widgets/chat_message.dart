import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String text;
  final String uid;

  const ChatMessage({Key key, this.text, this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: this.uid == '123' ? _myMessage() : _notMyChatMessage(),
    );
  }

  Widget _myMessage() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.only(right: 12.0, left: 48, bottom: 12.0),
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
            color: Color(0xff4D9EF6),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            )),
        child: Text(
          this.text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _notMyChatMessage() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(right: 48.0, left: 12, bottom: 12.0),
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
            color: Color(0xffE4E5E8),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(12),
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            )),
        child: Text(
          this.text,
          style: TextStyle(color: Colors.black87),
        ),
      ),
    );
  }
}
