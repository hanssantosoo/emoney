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

class _CardFlipperState extends State<CardFlipper>
    with SingleTickerProviderStateMixin {
  late AnimationController cardFlippingController;

  late Animation<double> flipAnimation;
  Widget? displayedCard;
  bool isFacingUp = true;
  double skewFactor = 0;
  double defaultSkew = 0;

  TweenSequence<double> leftToRight = TweenSequence(<TweenSequenceItem<double>>[
    TweenSequenceItem<double>(
        tween: Tween<double>(begin: 360, end: 180), weight: 3),
    TweenSequenceItem<double>(
        tween: Tween<double>(begin: 180, end: 190), weight: 2),
    TweenSequenceItem<double>(
        tween: Tween<double>(begin: 190, end: 180), weight: 1),
  ]);

   TweenSequence<double> rightToLeft = TweenSequence(<TweenSequenceItem<double>>[
    TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0, end: 180), weight: 3),
    TweenSequenceItem<double>(
        tween: Tween<double>(begin: 180, end: 170), weight: 2),
    TweenSequenceItem<double>(
        tween: Tween<double>(begin: 170, end: 180), weight: 1),
  ]);

  @override
  void initState() {
    super.initState();
