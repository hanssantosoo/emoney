import 'package:flutter/material.dart';
import 'package:emoney/components/main_app_screen/tabbed_layout_component.dart';

class LoginFormComponent extends StatefulWidget {
  const LoginFormComponent({Key? key}) : super(key: key);

  @override
  LoginFormComponentState createState() {
    return LoginFormComponentState();
  }
}

class LoginFormComponentState extends State<LoginFormComponent> {
  final _formKey = GlobalKey<FormState>();
  String errorMessage1 = "";
  String errorMessage2 = "";
  String userInput = "";
  String password = "";

  void errorMessageSetter(int fieldNumber, String message) {
    setState(() {
      if (fieldNumber == 1) {
        errorMessage1 = message;
      } else {
        errorMessage2 = message;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: TextFormField(
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  errorMessageSetter(
                      1, 'you must provide a email-id or username');
                } else {
                  errorMessageSetter(1, "");

                  setState(() {
                    userInput = value;
                  });
                }

                return null;
              },
              autocorrect: false,
              decoration: InputDecoration(
                fillColor: Colors.white,
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding:
                    EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                hintText: "username or email address",
                hintStyle: TextStyle(fontSize: 16, color: Color(0xFF929BAB)),
              ),
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
          if (errorMessage1 != '')
            Container(
              child: Text(
                "\t\t\t\t$errorMessage1",
                style: TextStyle(fontSize: 10, color: Colors.red),
              ),
              margin: EdgeInsets.all(2),
              padding: EdgeInsets.all(2),
            ),
          Container(
            child: TextFormField(
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (value) => _validateLoginDetails(),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  errorMessageSetter(2, 'password cannot be empty');
                } else {
                  errorMessageSetter(2, "");
                  setState(() {
                    password = value;
                  });
                }
                return null;
              },
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding:
                    EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                hintText: "password",
                hintStyle: TextStyle(fontSize: 16, color: Color(0xFF929BAB)),
              ),
            ),
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border.all(width: 1.0, color: Color(0xFFF5F7FA)),
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
          ),
          if (errorMessage2 != '')
            Container(
              child: Text(
                "\t\t\t\t$errorMessage2",
                style: TextStyle(fontSize: 10, color: Colors.red),
              ),
              margin: EdgeInsets.all(2),
              padding: EdgeInsets.all(2),
            ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 16.0),
            width: double.infinity,
            height: 64,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                  colors: [Color.fromARGB(255, 44, 1, 161), Color.fromARGB(255, 29, 3, 113)],
                  radius: 8.4,
                  center: Alignment(-0.24, -0.36)),
              borderRadius: BorderRadius.circular(20),
            ),
            child: ElevatedButton(
                onPressed: _validateLoginDetails,
                child: Text(
                  'Log in',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                )),
          ),
        ],
      ),
    );
  }

  void _validateLoginDetails() {
    FocusManager.instance.primaryFocus?.unfocus();
    if (_formKey.currentState!.validate()) {
      if (errorMessage1 != "" || errorMessage2 != "") {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please provide all required details'),
            backgroundColor: Colors.red,
          ),
        );
      } else {
        // _formKey.currentState!.reset();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            // onVisible: tryLoggingIn,
            content: Text('Processing...'),
            backgroundColor: Color.fromARGB(255, 56, 0, 167)));
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(
                content: Text("Login Successful"),
                backgroundColor: Color.fromARGB(255, 212, 0, 250)))
            .closed
            .then((value) => Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) => TabbedLayoutComponent()),
                (route) => false));
      }
    }
  }
}
