import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function onPressed;
  final String textButton;
  final Color buttonColor;
  final Color textColor;
  final double fontSize;

  const CustomButton(
      {Key key,
      @required this.onPressed,
      @required this.textButton,
      this.buttonColor,
      this.textColor,
      this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: this.onPressed,
      color: this.buttonColor,
      shape: StadiumBorder(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 46, vertical: 14),
        child: Text(
          this.textButton,
          style: TextStyle(
              fontSize: this.fontSize,
              color: this.textColor,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
