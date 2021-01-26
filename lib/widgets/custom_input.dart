import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 18),
        padding: EdgeInsets.only(top: 6, bottom: 2, left: 6, right: 18),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30.0),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  offset: Offset(0, 5),
                  blurRadius: 5)
            ]),
        child: TextField(
          autocorrect: false,
          keyboardType: TextInputType.emailAddress,
          //obscureText: true,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.mail_outline),
              focusedBorder: InputBorder.none,
              border: InputBorder.none,
              hintText: 'Email'),
        ));
  }
}
