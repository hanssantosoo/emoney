import 'package:flutter/material.dart';
void showErrorAlert(BuildContext context, Map<String, dynamic> error) {
  Map<String, dynamic> errorTypes = {
    'error': _CommonError(context, error),
    'internetConnectionError': _LocalError(context, error),
    'localDBError': _LocalError(context, error),
    'authenticationError': _CommonError(context, error),
    'apiAuthorizationError': _HazardousError(context, error),
    'corruptedTokenError': _HazardousError(context, error)
  };
  String currentError = error.keys.first;

  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
            title: Text(
              "Error",
              textAlign: TextAlign.center,
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: errorTypes[currentError].errorDescription,
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              Container(
                height: 48,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.blueGrey.shade100,
                        offset: Offset(0, 4),
                        blurRadius: 5.0)
                  ],
                  gradient: RadialGradient(
                      colors: [Color(0xff0070BA), Color(0xff1546A0)],
                      radius: 8.4,
                      center: Alignment(-0.24, -0.36)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ElevatedButton(
                    onPressed: errorTypes[currentError].onClose,
                    child: Text('OK'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    )),
              )
            ],
          ));
}
class _CommonError {
  BuildContext context;
  Map<String, dynamic> error;
  _CommonError(this.context, this.error);
  List<Widget> get errorDescription => <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 24, bottom: 12),
          child: Text(
            error[error.keys.first],
            textAlign: TextAlign.center,
          ),
        ),
      ];

  void onClose() {
    Navigator.of(context).pop();
  }
}
