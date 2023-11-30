import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:emoney/components/main_app_screen/tabbed_layout_component.dart';

class ChooseUsername extends StatefulWidget {
  const ChooseUsername({Key? key}) : super(key: key);

  @override
  _ChooseUsernameState createState() => _ChooseUsernameState();
}

class _ChooseUsernameState extends State<ChooseUsername> {
  late TextEditingController usernameField;
  late bool usernameStatus = false;
  bool _showErrorMessage = false;
  String _message = "your account has been created\nchoose a username";

  @override
  void initState() {
    super.initState();

    usernameField = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 64,
            ),
            Row(
              children: [
                CircleAvatar(
                    backgroundColor: Colors.blueGrey.shade100,
                    radius: 64,
                    child: ClipOval(
                      child: Image.asset(
                        "assets/images/profile.png",
                        height: 120,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                    ))
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            Container(
              height: 48,
              margin: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                _showErrorMessage ? 'the username is not available' : _message,
                style: TextStyle(
                    color:
                        _showErrorMessage ? Colors.red : Colors.grey.shade700),
                textAlign: TextAlign.center,
              ),
            ),
