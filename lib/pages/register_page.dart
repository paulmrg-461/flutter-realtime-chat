import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realtime_chat/helpers/show_alert.dart';
import 'package:realtime_chat/services/auth_service.dart';
import 'package:realtime_chat/widgets/custom_button.dart';
import 'package:realtime_chat/widgets/custom_input.dart';
import 'package:realtime_chat/widgets/labels.dart';
import 'package:realtime_chat/widgets/logo.dart';

class RegisterPage extends StatelessWidget {
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
                    text: 'Register',
                  ),
                  _Form(),
                  Labels(
                    route: 'login',
                    text: 'I already have an account!',
                    actionText: 'Sign in!',
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
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Container(
      //margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 46),
      child: Column(
        children: [
          CustomInput(
            textController: nameController,
            hintText: 'Name',
            icon: Icons.person_outline,
            textInputType: TextInputType.text,
            textCapitalization: TextCapitalization.words,
          ),
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
            onPressed: authService.authenticating
                ? null
                : () async {
                    FocusScope.of(context).unfocus();
                    final signupOk = await authService.signUp(
                        nameController.text.trim(),
                        emailController.text.trim(),
                        passwordController.text.trim());

                    if (signupOk == true) {
                      Navigator.pushReplacementNamed(context, 'users');
                    } else {
                      showAlert(context, 'Bad sign up', signupOk.toString());
                    }
                  },
            textButton: 'Sign up',
            buttonColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 18.0,
          )
        ],
      ),
    );
  }
}
