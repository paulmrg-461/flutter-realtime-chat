import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screensize = MediaQuery.of(context).size;
    return Center(
        child: Container(
            margin: EdgeInsets.only(top: 48),
            width: screensize.width * 0.65,
            padding: EdgeInsets.all(32),
            child: Column(
              children: [
                Image(image: AssetImage('assets/tag-logo.png')),
                SizedBox(
                  height: 18,
                ),
                Text(
                  'Messenger!',
                  style: TextStyle(fontSize: 26),
                )
              ],
            )));
  }
}
