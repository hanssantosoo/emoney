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
                                          : Colors.green.shade600,
                                  foregroundColor: !stepCompletedSuccessfully[e]
                                      ? Color(0xFF0070BA)
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
                                    ? Colors.green.shade600
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
                          colors: [Color(0xff0070BA), Color(0xff1546A0)],
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
                                      color: Colors.blue,
                                      size: 18,
                                    ),
                                    Text(
                                      'Back',
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 16),
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
