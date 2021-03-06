import 'package:flutter/material.dart';
import 'package:realtime_chat/widgets/custom_button.dart';
import 'package:realtime_chat/widgets/custom_input.dart';
import 'package:realtime_chat/widgets/labels.dart';
import 'package:realtime_chat/widgets/logo.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF2F2F2),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.95,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Logo(
                    text: 'Messenger',
                  ),
                  _Form(),
                  Labels(
                    route: 'register',
                    text: 'Don\'t you have an account?',
                    actionText: 'Sign up!',
                  ),
                  Text(
                    'Terms and conditions',
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.w200),
                  )
                ],
              ),
            ),
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
          CustomButton(
            onPressed: () => Navigator.pushReplacementNamed(context, 'users'),
            textButton: 'Login',
            buttonColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 18.0,
          )
        ],
      ),
    );
  }
}
