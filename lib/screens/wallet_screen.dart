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
        Positioned(
            // top: 128,
            bottom: -60,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 64,
              child: ClipOval(
                child: Image.asset(
                  "assets/images/profilepic.png",
                  height: 120,
                  width: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ))
      ],
      alignment: Alignment.center,
      clipBehavior: Clip.none,
    );

    Widget userInfo = Padding(
        padding: EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          children: [
            Row(
              children: [
                Text("Personal Info",
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)))
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name",
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255), fontSize: 15),
                ),
                SizedBox(
                  width: 20,
                ),
                Flexible(
                  child: Text(
                    "User1",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 15),
                  ),
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "E-mail",
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255), fontSize: 15),
                ),
                SizedBox(
                  width: 20,
                ),
                Flexible(
                  child: Text(
                    "user1@gmail.com",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 15),
                  ),
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Phone",
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255), fontSize: 15),
                ),
                SizedBox(
                  width: 20,
                ),
                Flexible(
                  child: Text(
                    "0898767890",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 15),
                  ),
                )
              ],
            ),
          ]
              .map((e) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: e,
                  ))
              .toList(),
        ));

    Widget myBankingCards = Expanded(
      child: Container(
          height: 100,
          padding: EdgeInsets.symmetric(horizontal: 28),
          child: FutureBuilder<Map<String, dynamic>>(
            future: availableCards.readAvailableCards(),
            builder: _buildAvailableCards,
          )),
    );

    Widget walletScreenContents = Column(
      children: [
        walletScreenDashBoard,
        SizedBox(
          height: 60,
        ),
        userInfo,
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 28, vertical: 10),
          child: Row(
            children: [
              Text(
                "My Cards",
                style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              ),
              Spacer(),
              InkWell(
                  child: Text(
                    "+ Add",
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  onTap: goToAddCardScreen)
            ],
          ),
        ),
        myBankingCards,
      ],
    );

    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => TabbedLayoutComponent()),
                  (route) => false),
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          title: Text("My Wallet", style: TextStyle(color: Colors.white)),
          centerTitle: true,
          actions: [
            Builder(
                builder: (context) => IconButton(
                    onPressed: () {},
                    icon: Icon(
                      FluentIcons.settings_28_regular,
                      color: Colors.white,
                    )))
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: CustomScrollView(slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: walletScreenContents,
          )
        ]));
  }

  void goToAddCardScreen() =>
      Navigator.push(context, SlideRightRoute(page: AddCardScreen()))
          .then((value) {
        setState(() {});
      });

  Widget _buildAvailableCards(
      BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
    final List cardData = [
      {'cardBrand': 'Master Card', 'cardNumber': '1234 5678 7777 1111'},
      {'cardBrand': 'Master Card', 'cardNumber': '1234 5678 7777 1110'},
      {'cardBrand': 'Master Card', 'cardNumber': '1234 5678 7777 1112'},
      {'cardBrand': 'Master Card', 'cardNumber': '1234 5678 7777 1113'},
      {'cardBrand': 'Master Card', 'cardNumber': '1234 5678 7777 1114'},
    ];

    return ListView.separated(
      padding: EdgeInsets.all(0),
      itemBuilder: (_, index) => Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Color.fromARGB(40, 255, 255, 255),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.1),
                blurRadius: 48,
                offset: Offset(2, 8),
                spreadRadius: -16),
          ],
        ),
        child: ListTile(
          onTap: () => _deleteCardDialogBox(cardData[index]['cardNumber']),
          contentPadding:
              EdgeInsets.only(left: 12, top: 0, right: 0, bottom: 0),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(6.18),
            child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  Color.fromARGB(255, 47, 14, 129),
                  BlendMode.color,
                ),
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    Colors.transparent,
                    BlendMode.saturation,
                  ),
                  child: Container(
                      color: Colors.transparent,
                      child: Image.asset(
                        "assets/images/system_image/mastercard.png",
                        width: 68,
                        height: 68,
                      )),
                )),
          ),
          title: Text(
            cardData[index]['cardBrand'],
            style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 16.5),
          ),
          subtitle: Text(
            _formatCardNumber(cardData[index]['cardNumber']),
            style: TextStyle(
                fontSize: 13, color: Color.fromARGB(255, 255, 255, 255)),
          ),
        ),
      ),
      separatorBuilder: (_, b) => Divider(
        height: 14,
        color: Colors.transparent,
      ),
      itemCount: cardData.length,
    );
  }

  String _formatCardNumber(String currentCardNumber, {bool encrypt = true}) {
    String formattedCardNumber = "";
    String cardCopy = currentCardNumber;
    cardCopy = cardCopy.replaceAll(' ', '');
    if (encrypt) {
      cardCopy = cardCopy[0] +
          '*' * (cardCopy.length - 6) +
          cardCopy.substring(cardCopy.length - 5);
    }
    if (RegExp(r'^3[47]').hasMatch(currentCardNumber)) {
      for (var i = 0; i < cardCopy.length; i++) {
        formattedCardNumber += cardCopy[i];
        if (i == 3 || i == 9) {
          formattedCardNumber += ' ';
        }
      }
    } else {
      for (var i = 0; i < cardCopy.length; i++) {
        formattedCardNumber += cardCopy[i];
        if ((i + 1) % 4 == 0) {
          formattedCardNumber += ' ';
        }
      }
    }
    return formattedCardNumber.trim();
  }

  void goBackToLastTabScreen() {
    int lastTab =
        Provider.of<TabNavigationProvider>(context, listen: false).lastTab;
    Provider.of<TabNavigationProvider>(context, listen: false).removeLastTab();
    widget.setTab(lastTab);
  }

  void _deleteCardDialogBox(String cardNumber) {
    Decoration buttonDecoration = BoxDecoration(
      boxShadow: [
        BoxShadow(
            color: Colors.blueGrey.shade100,
            offset: Offset(0, 4),
            blurRadius: 5.0)
      ],
      gradient: RadialGradient(
          colors: [Color.fromARGB(255, 80, 6, 170), Color.fromARGB(255, 60, 21, 160)],
          radius: 8.4,
          center: Alignment(-0.24, -0.36)),
      borderRadius: BorderRadius.circular(10),
    );
    ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      primary: Colors.transparent,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
              title: Text(
                "Delete Card?",
                textAlign: TextAlign.center,
              ),
              content: Text(
                "Are you sure, you want to delete Card with number\n${_formatCardNumber(cardNumber, encrypt: false)}?",
                textAlign: TextAlign.center,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              actionsAlignment: MainAxisAlignment.center,
              actions: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 48,
                          width: 100,
                          decoration: buttonDecoration,
                          child: ElevatedButton(
                              onPressed: () => _deleteSelectedCard(cardNumber),
                              child: Text('Delete'),
                              style: buttonStyle),
                        ),
                        SizedBox(
                          width: 24,
                        ),
                        Container(
                          height: 48,
                          width: 100,
                          decoration: buttonDecoration,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Cancel'),
                              style: buttonStyle),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                )
              ],
            ));
  }

  Future<void> _deleteSelectedCard(String cardNumber) async {
    bool cardDeletionStatus = await availableCards.deleteCard(cardNumber);
    if (cardDeletionStatus) {
      setState(() {});
      Navigator.of(context).pop();
    } else {
      Navigator.of(context).pop();
    }
  }
}
