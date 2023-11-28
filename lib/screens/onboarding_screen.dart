import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:emoney/screens/login_screen.dart';

class PageData {
  final String? title;

  final Image? mediaContent;
  final Color bgColor;
  final Color textColor;
  final Widget? optionalWidget;

  PageData(
      {this.title,
      this.mediaContent,
      this.bgColor = const Color.fromRGBO(40, 4, 148, 0),
      this.textColor = Colors.black,
      this.optionalWidget});
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late List<PageData> pages;
  late Widget getStarted;

  @override
  void initState() {
    super.initState();

    getStarted = Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
            onPressed: completedOrientation,
            child: Text(
              'Get Started',
              style: TextStyle(fontSize: 27, color: Colors.white),
            ),
            style: TextButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 171, 69, 254),
                padding: EdgeInsets.all(18),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.5))),
          ),
        ),
