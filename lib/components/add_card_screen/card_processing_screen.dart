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
