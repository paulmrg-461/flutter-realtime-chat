import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String text;
  final String uid;
  final AnimationController animationController;

  const ChatMessage(
      {Key key,
      @required this.text,
      @required this.uid,
      @required this.animationController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: this.animationController,
      child: SizeTransition(
        sizeFactor:
            CurvedAnimation(parent: animationController, curve: Curves.easeOut),
        child: Container(
          child: this.uid == '123' ? _myMessage() : _notMyChatMessage(),
        ),
      ),
    );
  }

  Widget _myMessage() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.only(right: 12.0, left: 48, top: 6.0, bottom: 6.0),
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
        margin: EdgeInsets.only(right: 48.0, left: 12, top: 6.0, bottom: 6.0),
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
