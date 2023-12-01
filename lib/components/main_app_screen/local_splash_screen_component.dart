import 'package:flutter/material.dart';

class LocalSplashScreenComponent extends StatelessWidget {
  const LocalSplashScreenComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0x280494),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/system_image/E-WalletP.png',
            height: 128.0,
          ),
        ],
      ),
    );
  }
}

