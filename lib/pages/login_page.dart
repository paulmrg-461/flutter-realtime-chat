import 'package:flutter/material.dart';
import 'package:realtime_chat/widgets/custom_input.dart';
import 'package:realtime_chat/widgets/labels.dart';
import 'package:realtime_chat/widgets/logo.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF2F2F2),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Logo(),
              _Form(),
              Labels(),
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

class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 46),
      child: Column(
        children: [
          CustomInput(
            textController: emailController,
            hintText: 'Email',
            icon: Icons.mail_outline,
            textInputType: TextInputType.emailAddress,
          ),
          CustomInput(
            textController: passwordController,
            hintText: 'Password',
            icon: Icons.lock_outline,
            textInputType: TextInputType.text,
            obscureText: true,
          ),
          //TODO: Create Button
          RaisedButton(
              child: Text(
                'Login',
                style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
              color: Colors.blue,
              onPressed: () => print(emailController.text))
        ],
      ),
    );
  }
}
