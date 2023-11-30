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
