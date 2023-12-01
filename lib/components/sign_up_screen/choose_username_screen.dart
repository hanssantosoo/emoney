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
            Container(
              width: 260,
              child: TextField(
                controller: usernameField,
                onChanged: ((value) {
                  setState(() {
                    if (_showErrorMessage == true) {
                      _showErrorMessage = false;
                    }
                  });
                }),
                decoration: InputDecoration(
                  suffixIcon: usernameField.text.isEmpty
                      ? null
                      : Container(
                          decoration: BoxDecoration(
                            color: usernameStatus == true
                                ? Colors.green
                                : Colors.red,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(16),
                                bottomRight: Radius.circular(16)),
                          ),
                          child: Icon(
                            usernameStatus == true
                                ? FluentIcons.checkmark_48_regular
                                : FluentIcons.prohibited_48_regular,
                            color: Colors.white,
                            size: 34,
                          ),
                        ),
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding:
                      EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                  hintText: "username",
                  hintStyle: TextStyle(fontSize: 16, color: Color(0xFF929BAB)),
                ),
                textInputAction: TextInputAction.done,
                onSubmitted: (_) => trySettingUsername(),
                style: TextStyle(fontSize: 16, color: Color(0xFF929BAB)),
              ),
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 1.0, color: Color(0xFFF5F7FA)),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Container(
              width: 270,
              height: 64,
              margin: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                gradient: RadialGradient(
                    colors: [Color(0xff0070BA), Color(0xff1546A0)],
                    radius: 8.4,
                    center: Alignment(-0.24, -0.36)),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ElevatedButton(
                  onPressed: trySettingUsername,
                  child: Text('Confirm'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  )),
            ),
          ],
        ),
        padding: EdgeInsets.all(45),
      ),
    );
  }

  void trySettingUsername() async {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(
            content: Text("Successfully created account"),
            backgroundColor: Colors.green))
        .closed
        .then((value) => Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => TabbedLayoutComponent()),
            (route) => false));
  }
}
