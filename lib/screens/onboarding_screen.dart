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

        pages = [
      PageData(
          // textColor: Color(0xFFe8f9ec),
          mediaContent: null,
          textColor: Colors.white,
          bgColor: Color.fromRGBO(38, 0, 113, 1),
          title:
              "Welcome to Hello-Pay! Experience effortless financial transactions with Hello-Pay, our cutting-edge E-money app. Say farewell to traditional payments and step into the future of digital ease. Secure, streamlined, and ready for anything – Hello-Pay is your trusted companion for a brighter financial world!"),
      PageData(
        mediaContent: Image.asset(
            'assets/images/onboarding_assets/desktop.png'),
        title:
            "Discover the convenience and efficiency of our application, crafted with care and precision from humble beginnings.",
        bgColor: Color.fromRGBO(40, 4, 148, 1),
        textColor: Colors.white,
      ),
      PageData(
          mediaContent: Image.asset(
              'assets/images/onboarding_assets/onlineshop.png'),
          bgColor: Color.fromRGBO(38, 0, 113, 1),
          textColor: Colors.white,
          optionalWidget: getStarted),
    ];
  }

        void completedOrientation() async {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (route) => false);
    // }
  }

  List<Color> get colors => pages.map((p) => p.bgColor).toList();
@override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ConcentricPageView(
          colors: colors,
          radius: 30,
          curve: Curves.ease,
          duration: Duration(seconds: 2),
          itemCount: pages.length,
          itemBuilder: (index, value) {
            // PageData page = pages[index % pages.length];
            PageData page = pages[index];
            return Column(children: [
              Container(
                child: Theme(
                  data: ThemeData(
                    textTheme: TextTheme(
                      headline6: TextStyle(
                          color: page.textColor,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Helvetica',
                          letterSpacing: 0.0,
                          fontSize: 15),
                      subtitle2: TextStyle(
                        color: page.textColor,
                        fontWeight: FontWeight.w300,
                        fontSize: 18,
                      ),
                      bodyText2: GoogleFonts.poppins(
                        color: page.textColor,
                        letterSpacing: 0.0,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  child: PageCard(page: page),
                ),
              ),
            ]);
          },
        ),
      ),
    );
  }
}
