import 'dart:math';

import 'package:flutter/material.dart';

class CardFlipper extends StatefulWidget {
  final Widget frontSide, backSide;
  final Duration transitionDuration;
  final CardFlippingController? cardFlippingController;
  CardFlipper(
      {Key? key,
      required this.frontSide,
      required this.backSide,
      required this.transitionDuration,
      this.cardFlippingController})
      : super(key: key);

  @override
  _CardFlipperState createState() => _CardFlipperState();
}
