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
