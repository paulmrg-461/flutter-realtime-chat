import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  final String route;
  final String actionText;
  final String text;

  const Labels(
      {Key key,
      @required this.route,
      @required this.actionText,
      @required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            this.text,
            style: TextStyle(
                color: Colors.black54,
                fontSize: 16.0,
                fontWeight: FontWeight.w300),
          ),
          SizedBox(
            height: 8.0,
          ),
          GestureDetector(
            onTap: () => Navigator.pushReplacementNamed(context, this.route),
            child: Text(
              this.actionText,
              style: TextStyle(
                  color: Colors.blue[600],
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
