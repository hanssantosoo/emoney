import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:emoney/components/add_card_screen/card_flipper.dart';
import 'package:emoney/components/add_card_screen/card_processing_screen.dart';
import 'package:emoney/utilities/card_identifier.dart';
import 'package:emoney/utilities/slide_right_route.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({
    Key? key,
  }) : super(key: key);

  @override
  _AddCardScreenState createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen>
    with SingleTickerProviderStateMixin {
  late List<Widget> cardInputFields;
  late ItemScrollController _cardInputDataController;
  late TextEditingController _cardNumberInputController;
  late TextEditingController _expiryDateInputController;
  late TextEditingController _cvvInputController;
  late TextEditingController _cardHolderInputController;

  late CardFlippingController cardFlipper;

  late FocusScopeNode cardDetailsFocusNodes;
  late AnimationController cardSwitcher;
  late Animation<double> sides;

  Map<String, String> cardDetails = {
    'cardNumber': '',
    'expiryDate': '',
    'cvv': '',
    'cardHolder': ''
  };
