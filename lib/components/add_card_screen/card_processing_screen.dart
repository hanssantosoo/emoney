import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class CardProcessingScreen extends StatefulWidget {
  const CardProcessingScreen({Key? key, required this.cardDetails})
      : super(key: key);
  final Map<String, String> cardDetails;
  @override
  State<CardProcessingScreen> createState() => _CardProcessingScreenState();
}

class _CardProcessingScreenState extends State<CardProcessingScreen>
    with TickerProviderStateMixin {
  late AnimationController cardProcessingAnimationController;
  bool exitScreen = false;
  bool showMessage = false;
  late Widget processStatusAnimation;
  String title = "Processing...";
  Widget processStatusText2 = SizedBox(
    height: 48,
    key: ValueKey(0),
  );
  Widget processStatusText = SizedBox(
    height: 48,
    key: ValueKey(0),
  );

   void toggleMessageVisibility() {
    if (cardProcessingAnimationController.isAnimating) {
      if (cardProcessingAnimationController.value > .5 &&
          showMessage == false) {
        setState(() {
          showMessage = true;
          processStatusText2 = processStatusText;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();

    cardProcessingAnimationController = AnimationController(
      vsync: this,
    );
    cardProcessingAnimationController.addListener(toggleMessageVisibility);
    processStatusAnimation = Container(
      color: Colors.transparent,
      width: 300,
    );

     WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      // String cardErrorMessage = await verifyCardDetails();

      // if (cardErrorMessage.isEmpty) {
      setState(() {
        processStatusAnimation = Container(
            color: Colors.transparent,
            width: 300,
            child: Lottie.network(
                'https://assets2.lottiefiles.com/packages/lf20_uub9r8ta.json',
                repeat: false,
                controller: cardProcessingAnimationController,
                onLoaded: (composition) {
              cardProcessingAnimationController.duration = composition.duration;
              cardProcessingAnimationController.forward();
            }));
        processStatusText = SizedBox(
            height: 48,
            key: ValueKey(1),
            child: Text(
              'card was added',
              style:
                  GoogleFonts.poppins(fontSize: 16, color: Color(0xff343a40)),
              textAlign: TextAlign.center,
            ));
        title = "Successful!";
      });
    });

       cardProcessingAnimationController.addListener(listenForExit);
  }

  void listenForExit() {
    if (cardProcessingAnimationController.isCompleted) {
      Future.delayed(Duration(seconds: 2, milliseconds: 500), (() {
        int count = 0;
        if (mounted) {
          Navigator.of(context).popUntil((_) => count++ >= 2);
        }
      }));
    }
  }

   @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        int count = 0;
        if (mounted) {
          Navigator.of(context).popUntil((_) => count++ >= 2);
        }
        return Future.value(false);
      },
      child: Scaffold(
        // backgroundColor: Colors.white,
        backgroundColor: Color(0xfffcfcfc),
        appBar: AppBar(
          title: Text(
            title,
            style: TextStyle(fontSize: 19),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Color(0xff243656),
          leading: IconButton(
              onPressed: goBackToWalletScreen, icon: Icon(Icons.arrow_back)),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                width: double.infinity,
                height: 400,
                child: Center(
                    child: Wrap(
                        direction: Axis.vertical,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                      AnimatedSwitcher(
                        child: processStatusAnimation,
                        duration: Duration(milliseconds: 300),
                      ),
                      AnimatedSwitcher(
                        child: processStatusText2,
                        duration: Duration(milliseconds: 600),
                      ),
                    ])))
          ],
        ),
      ),
    );
  }

    void goBackToWalletScreen() {
    int count = 0;
    if (mounted) {
      Navigator.of(context).popUntil((_) => count++ >= 2);
    }
  }
}
