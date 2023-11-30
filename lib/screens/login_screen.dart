import 'package:flutter/material.dart';
import 'package:emoney/components.dart';
import 'package:emoney/utilities/markdown_viewer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Widget helpInfoContainer = Container(
      width: double.infinity,
      height: 36,
    );

        Widget signUpContainer = Container(
      child: Center(
        child: InkWell(
          child: Text(
            'Sign up',
            style: TextStyle(fontSize: 14, color: Color(0xFF929BAB)),
          ),
          onTap: goToSignUpScreen,
        ),
      ),
      width: double.infinity,
      height: 36,
    );
    List<Widget> loginScreenContents = <Widget>[
      _spacing(20),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Image.asset('assets/images/system_image/E-Wallet.png'),
      ),
      _spacing(30),
      LoginFormComponent(),
      _spacing(30),
      helpInfoContainer,
      _spacing(30),
      signUpContainer
    ];
