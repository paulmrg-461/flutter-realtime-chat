import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String hintText;
  final TextEditingController textController;
  final IconData icon;
  final IconData suffixIcon;
  final TextInputType textInputType;
  final bool obscureText;
  final TextCapitalization textCapitalization;

  CustomInput(
      {Key key,
      @required this.hintText,
      @required this.textController,
      @required this.icon,
      this.suffixIcon,
      this.textInputType = TextInputType.text,
      this.obscureText = false,
      this.textCapitalization = TextCapitalization.none})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 18),
        padding: EdgeInsets.only(top: 6, left: 6, right: 18),
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
          controller: this.textController,
          autocorrect: false,
          keyboardType: this.textInputType,
          obscureText: this.obscureText,
          textCapitalization: this.textCapitalization,
          decoration: InputDecoration(
              prefixIcon: Icon(this.icon),
              suffixIcon: Icon(this.suffixIcon),
              focusedBorder: InputBorder.none,
              border: InputBorder.none,
              hintText: this.hintText),
        ));
  }
}
