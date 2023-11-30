import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:emoney/components/add_card_screen/cards_storage.dart';
import 'package:emoney/components/main_app_screen/tabbed_layout_component.dart';
import 'package:provider/provider.dart';
import 'package:emoney/components.dart';

class WalletScreen extends StatefulWidget {
  final Function setTab;

  const WalletScreen({Key? key, required this.setTab}) : super(key: key);

  @override
  WalletScreenState createState() => WalletScreenState();
}

class WalletScreenState extends State<WalletScreen> {
  CardsStorage availableCards = CardsStorage();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget walletScreenDashBoard = Stack(
      children: [
        Container(
          height: 224, width: double.infinity,
          //  color: Color(0xFF0070BA)
          color: Color.fromARGB(255, 40, 4, 148),
        ),
        Container(
          height: 224,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned(
                  child: Opacity(
                    opacity: 0.16,
                    child: Image.asset(
                      "assets/images/system_image/magicpattern-blob-1652765120695.png",
                      color: const Color.fromARGB(129, 224, 224, 224),
                      height: 480,
                    ),
                  ),
                  left: -156,
                  top: -96)
            ],
          ),
        ),
