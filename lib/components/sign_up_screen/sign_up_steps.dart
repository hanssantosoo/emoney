import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:emoney/components/sign_up_screen/choose_username_screen.dart';
import 'package:emoney/components/sign_up_screen/step_get_bank_account.dart';
import 'package:emoney/components/sign_up_screen/step_get_email_password.dart';
import 'package:emoney/components/sign_up_screen/step_get_name_address.dart';
import 'package:emoney/utilities/slide_right_route.dart';

class SignUpSteps extends StatefulWidget {
  const SignUpSteps({Key? key}) : super(key: key);

  @override
  _SignUpStepsState createState() => _SignUpStepsState();
}

class _SignUpStepsState extends State<SignUpSteps> {
  late PageController _signUpStepController;
  final nameAddressFormKey = LabeledGlobalKey<FormState>("nameAddressForm");
  final emailPasswordFormKey = LabeledGlobalKey<FormState>("emailPasswordForm");
  final bankAccountFormKey = LabeledGlobalKey<FormState>("bankAccountForm");
  Map<String, String> signUpDetails = {
    'fullname': '',
    'address': '',
    'emailId': '',
    'password': '',
    'bankAccount': ''
  };
  Map<String, String> registraionDetails() => signUpDetails;
  int _currentStep = 0;
  List<bool> stepHasError = [false, false, false];
  List<bool> stepCompletedSuccessfully = [false, false, false];
  late List<Widget> signUpStepContent;
  bool confirmSignUpButton = false;
  @override
  void initState() {
    _signUpStepController = PageController();
    signUpStepContent = [
      StepGetNameAddress(
        registrationDetails: registraionDetails,
        updateSignUpDetails: updateSignUpDetails,
        nameAddressFormKey: nameAddressFormKey,
        proceedToNextStep: _proceedToNextStep,
      ),
      StepGetEmailPassword(
        updateSignUpDetails: updateSignUpDetails,
        emailPasswordFormKey: emailPasswordFormKey,
        registrationDetails: registraionDetails,
        proceedToNextStep: _proceedToNextStep,
      ),
      StepGetBankAccount(
        updateSignUpDetails: updateSignUpDetails,
        bankAccountFormKey: bankAccountFormKey,
        registrationDetails: registraionDetails,
        showConfirmSignUpButton: showConfirmSignUpButton,
        finalStepProccessing: _finalStepProccessing,
      )
    ];

    super.initState();
  }

  @override
  void dispose() {
    _signUpStepController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.transparent,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              color: Colors.transparent,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [0, 1, 2]
                    .map((e) => Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () => changeStepOnTap(e),
                              child: CircleAvatar(
                                  backgroundColor: stepHasError[e]
                                      ? Colors.red.shade600
                                      : !stepCompletedSuccessfully[e]
                                          ? Color(0xffF5F7FA)
                                          : Color.fromARGB(255, 187, 8, 194),
                                  foregroundColor: !stepCompletedSuccessfully[e]
                                      ? Color.fromARGB(255, 78, 2, 176)
                                      : Color.fromRGBO(40, 4, 148, 1),
                                  radius: 18,
                                  child: stepHasError[e]
                                      ? Icon(
                                          FluentIcons.warning_16_filled,
                                          color: Colors.white,
                                        )
                                      : stepCompletedSuccessfully[e]
                                          ? Icon(
                                              FluentIcons.checkmark_16_regular)
                                          : _currentStep == e
                                              ? Icon(FluentIcons.edit_16_filled)
                                              : Text("${e + 1}")),
                            ),
                            if (e < 2)
                              Container(
                                height: 10,
                                width: 70,
                                color: stepCompletedSuccessfully[e]
                                    ? Color.fromARGB(255, 187, 8, 194)
                                    : Colors.transparent,
                              ),
                          ],
                        ))
                    .toList(),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: double.infinity,
              height: _currentStep == 2 ? 230 : 300,
              child: PageView(
                clipBehavior: Clip.none,
                controller: _signUpStepController,
                physics: NeverScrollableScrollPhysics(),
                children: signUpStepContent,
              ),
            ),
            if (_currentStep == 2)
              Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 3.6, horizontal: 10),
                  child: RichText(
                      text: TextSpan(
                          text: ' ',
                          style:
                              TextStyle(fontSize: 14, color: Color(0xFF929BAB)),
                          children: <InlineSpan>[]))),
            confirmSignUpButton
                ? Container(
                    margin: const EdgeInsets.symmetric(vertical: 16.0),
                    width: double.infinity,
                    height: 64,
                    decoration: BoxDecoration(
                      gradient: RadialGradient(
                          colors: [Color.fromARGB(255, 78, 2, 176), Color.fromARGB(255, 94, 6, 152)],
                          radius: 8.4,
                          center: Alignment(-0.24, -0.36)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ElevatedButton(
                        onPressed: _finalStepProccessing,
                        child: Text(
                          'Create Account',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        )),
                  )
                : Row(
                    children: [
                      if (_currentStep > 0 && confirmSignUpButton == false)
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextButton(
                              onPressed: _goBackToPreviousStep,
                              child: Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  spacing: 3.2,
                                  children: [
                                    Icon(
                                      FluentIcons.arrow_left_16_filled,
                                      color: const Color.fromARGB(255, 78, 2, 176),
                                      size: 18,
                                    ),
                                    Text(
                                      'Back',
                                      style: TextStyle(
                                          color: const Color.fromARGB(255, 78, 2, 176), fontSize: 16),
                                    ),
                                  ]),
                              style: TextButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              )),
                        ),
                      Spacer(),
                      if (_currentStep < signUpStepContent.length - 1)
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextButton(
                              onPressed: _proceedToNextStep,
                              child: Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  spacing: 3.2,
                                  children: [
                                    Text(
                                      'Next',
                                      style: TextStyle(
                                          color: const Color.fromARGB(255, 78, 2, 176), fontSize: 16),
                                    ),
                                    Icon(
                                      FluentIcons.arrow_right_16_filled,
                                      color: const Color.fromARGB(255, 78, 2, 176),
                                      size: 18,
                                    )
                                  ]),
                              style: TextButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              )),
                        ),
                    ],
                  ),
          ],
        ));
  }

  void _finalStepProccessing() {
    FocusManager.instance.primaryFocus?.unfocus();
    _performErrorCheck(_currentStep + 1);

    if (stepHasError[_currentStep] == false && mounted) {
      ScaffoldMessenger.of(context)
          .showSnackBar(
            SnackBar(
              content: Text('Processing'),
              backgroundColor: const Color.fromARGB(255, 78, 2, 176),
              // onVisible: _tryRegistering,
            ),
          )
          .closed
          .then((value) => _tryRegistering());
    }
  }

//? FUNCTION TO GO BACK TO PREVIOUS STEP OF THE CURRENT STEP
  void _goBackToPreviousStep() {
    FocusManager.instance.primaryFocus?.unfocus();
    _performErrorCheck(_currentStep - 1);
    if (_currentStep > 0) {
      _signUpStepController.animateToPage(_currentStep - 1,
          duration: Duration(milliseconds: 500), curve: Curves.easeInOutCubic);
      setState(() {
        _currentStep--;
      });
    }
  }

//? FUNCTION TO MOVE TO THE NEXT STEP FROM THE CURRENT STEP
  void _proceedToNextStep() {
    FocusManager.instance.primaryFocus?.unfocus();

    _performErrorCheck(_currentStep + 1);

    if (stepHasError[_currentStep] == false) {
      if (_currentStep < signUpStepContent.length - 1) {
        _signUpStepController.animateToPage(_currentStep + 1,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOutCubic);

        setState(() {
          _currentStep++;
        });
      }
    }
  }

//? FUNCTION TO UPDATE SIGN UP DETAILS
  void updateSignUpDetails(String key, String value) {
    setState(() {
      signUpDetails[key] = value;
    });
  }

//? FUNCTION TO TOGGLE VISIBILITY OF SIGN UP BUTTON
  void showConfirmSignUpButton(bool value) {
    if (value != confirmSignUpButton) {
      setState(() {
        confirmSignUpButton = value;
      });
    }
  }

//? FUNCTION TO CHECK FOR ERRORS IN ANY STEPS PRIOR FROM THE ONE REQUESTED
  void _performErrorCheck(int requestedIndex) {
    if (_currentStep < requestedIndex) {
      for (var i = 0; i < requestedIndex; i++) {
        bool errorStatus = false;
        switch (i) {
          case 0:
            nameAddressFormKey.currentState?.validate();
            if (signUpDetails["fullname"]!.isEmpty ||
                signUpDetails['address']!.isEmpty) {
              errorStatus = true;
            }

            break;
          case 1:
            emailPasswordFormKey.currentState?.validate();
            if (stepCompletedSuccessfully[1]) {
              errorStatus = false;
            } else if (stepCompletedSuccessfully[0] && _currentStep == 1) {
              // emailPasswordFormKey.currentState?.validate();
              if (signUpDetails["emailId"]!.isEmpty ||
                  signUpDetails["password"]!.isEmpty) {
                errorStatus = true;
              }
            } else {
              errorStatus = true;
            }
            break;
          case 2:
            bankAccountFormKey.currentState?.validate();
            if (signUpDetails["bankAccount"]!.isEmpty) {
              errorStatus = true;
            }

            break;
        }

        setState(() {
          stepHasError[i] = errorStatus;
          stepCompletedSuccessfully[i] = !stepHasError[i];
        });
        if (errorStatus) {
          break;
        }
      }
    } else {
      for (var i = _currentStep; i >= 0; i--) {
        bool errorStatus = false;
        switch (i) {
          case 0:
            nameAddressFormKey.currentState?.validate();
            if (signUpDetails["fullname"]!.isEmpty ||
                signUpDetails['address']!.isEmpty) {
              errorStatus = true;
            }

            break;
          case 1:
            emailPasswordFormKey.currentState?.validate();
            if (stepCompletedSuccessfully[1]) {
              errorStatus = false;
            } else if (stepCompletedSuccessfully[0] && _currentStep == 1) {
              // emailPasswordFormKey.currentState?.validate();
              if (signUpDetails["emailId"]!.isEmpty ||
                  signUpDetails["password"]!.isEmpty) {
                errorStatus = true;
              }
            } else {
              errorStatus = true;
            }
            break;
          case 2:
            bankAccountFormKey.currentState?.validate();
            if (signUpDetails["bankAccount"]!.isEmpty) {
              errorStatus = true;
            }

            break;
        }

        setState(() {
          stepHasError[i] = errorStatus;
          stepCompletedSuccessfully[i] = !stepHasError[i];
        });
        if (errorStatus) {
          break;
        }
      }
    }
  }

  void _tryRegistering() {
    Navigator.pushReplacement(context, SlideRightRoute(page: ChooseUsername()));
  }

//? FUNCTION TO CHANGE STEP ON TAPPING THE OVERHEAD STEP NUMBERS
  void changeStepOnTap(int requestedIndex) {
    FocusManager.instance.primaryFocus?.unfocus();

    if (requestedIndex < _currentStep) {
      _signUpStepController.animateToPage(requestedIndex,
          duration: Duration(milliseconds: 500), curve: Curves.easeInOutCubic);

      _performErrorCheck(requestedIndex);
      setState(() {
        _currentStep = requestedIndex;
      });
    } else if (requestedIndex > _currentStep &&
        requestedIndex != _currentStep) {
      _performErrorCheck(requestedIndex);

      if (!stepHasError.sublist(0, requestedIndex).contains(true)) {
        if (_currentStep < signUpStepContent.length - 1) {
          _signUpStepController.animateToPage(requestedIndex,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOutCubic);

          setState(() {
            _currentStep = requestedIndex;
          });
        }
      } else {
        int stepWithError =
            stepHasError.sublist(0, requestedIndex).indexOf(true);
        _signUpStepController.animateToPage(stepWithError,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOutCubic);

        setState(() {
          _currentStep = stepWithError;
        });
      }
    }
  }
}
