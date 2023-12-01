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
