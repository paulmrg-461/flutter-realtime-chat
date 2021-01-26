import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF2F2F2),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _Logo(),
              _Form(),
              _Labels(),
              Text(
                'Terms and conditions',
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.w200),
              )
            ],
          ),
        ));
  }
}

class _Logo extends StatelessWidget {
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

class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [TextField(), TextField(), RaisedButton(onPressed: () {})],
      ),
    );
  }
}

class _Labels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            'Don\'t you have account?',
            style: TextStyle(
                color: Colors.black54,
                fontSize: 16.0,
                fontWeight: FontWeight.w300),
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            'Sign up!',
            style: TextStyle(
                color: Colors.blue[600],
                fontSize: 18.0,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
