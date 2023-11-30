import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class HomeDashboardScreen extends StatefulWidget {
  final Function setTab;
  const HomeDashboardScreen({Key? key, required this.setTab}) : super(key: key);

  @override
  HomeDashboardScreenState createState() => HomeDashboardScreenState();
}

class HomeDashboardScreenState extends State<HomeDashboardScreen> {
  List<dynamic> allTransactions = [];
  late List<Map<String, dynamic>> response;
  Map<String, dynamic>? error = null;
  final List data = [
    {
      "id": 1,
      "email": "hans1@gmail.com",
      "name": "Hans",
      "date": "2023-11-01",
      "amount": 22000,
      "type": "credit",
      "status": "success",
      "transactionId": "1234567891"
    },
    {
      "id": 2,
      "email": "jerjb@gmail.com",
      "name": "Jerel",
      "date": "2023-11-01",
      "amount": 32000,
      "type": "credit",
      "status": "success",
      "transactionId": "1234567892"
    },
    {
      "id": 3,
      "email": "jadej@gmail.com",
      "name": "Jade",
      "date": "2023-11-01",
      "amount": 40000,
      "type": "credit",
      "status": "success",
      "transactionId": "1234567893"
    },
    {
      "id": 4,
      "email": "ivan1@gmail.com",
      "name": "Ivan",
      "date": "2023-11-01",
      "amount": 10000,
      "type": "credit",
      "status": "success",
      "transactionId": "1234567894"
    },
    {
      "id": 5,
      "email": "sabsa@gmail.com",
      "name": "Sabrina",
      "date": "2023-11-01",
      "amount": 12.000,
      "type": "credit",
      "status": "success",
      "transactionId": "1234567895"
    },
    {
      "id": 6,
      "email": "hans1@gmail.com",
      "name": "Hans",
      "date": "2023-11-01",
      "amount": 20000,
      "type": "credit",
      "status": "success",
      "transactionId": "1234567896"
    },
    {
      "id": 7,
      "email": "jadej@gmail.com",
      "name": "Jade",
      "date": "2023-11-01",
      "amount": 10000,
      "type": "credit",
      "status": "success",
      "transactionId": "1234567897"
    },
    {
      "id": 8,
      "email": "sabsa@gmail.com",
      "name": "sabrina",
      "date": "2023-11-01",
      "amount": 15500,
      "type": "credit",
      "status": "success",
      "transactionId": "1234567880"
    },
    
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> dashboardActions = [
      GestureDetector(
        onTap: () {},
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 23,
            child: ClipOval(
              child: Image.asset(
                "assets/images/profilepic.png",
                height: 42,
                width: 42,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      )
    ];
    List<Widget> dashboardContents = [
      Container(
        color: Colors.black,
        child: Container(
            height: 240,
            width: double.infinity,
            decoration: BoxDecoration(
              // color: Color(0xFF0070BA),
              color: Color.fromARGB(255, 40, 4, 148),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(36),
              ),
            )),
      ),
      Positioned(
          child: Opacity(
            opacity: 0.16,
            child: Image.asset(
              "assets/images/system_image/magicpattern-blob-1652765120695.png",
              color: Colors.white,
              height: 480,
            ),
          ),
          left: -156,
          top: -96),
      Positioned(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/system_image/E-WalletMini.png',
                height: 100,
                width: 100,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Hello, User1!",
                style: TextStyle(color: Colors.grey.shade300, fontSize: 17),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Rp. 100.000",
                style: TextStyle(
                    color: Colors.white.withOpacity(0.96),
                    fontSize: 36,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 6.18,
              ),
              Text(
                "Your balance",
                style: TextStyle(color: Colors.white, fontSize: 15),
              )
            ],
          ),
        ),
        bottom: 20,
        left: 10,
      )
    ];
    List<Widget> transactionButtons = <Widget>[
      Padding(
        padding: EdgeInsets.all(10),
        child: ElevatedButton(
            onPressed: () {},
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Icon(
                    Icons.file_upload_outlined,
                    size: 24,
                  ),
                ),
                Spacer(),
                Text(
                  "Send Money",
                  style: TextStyle(fontSize: 13),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
            style: ElevatedButton.styleFrom(
              // primary: Color(0xFF0070BA),
              primary: Color.fromARGB(255, 40, 4, 148),
              // fixedSize: Size(90, 100),
              fixedSize: Size(96, 108),
              shadowColor: Color.fromARGB(255, 40, 4, 148).withOpacity(0.618),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            )),
      ),
      Padding(
        padding: EdgeInsets.all(10),
        child: ElevatedButton(
            onPressed: () {},
            child: Column(children: [
              SizedBox(
                height: 10,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Icon(
                    Icons.file_download_outlined,
                    size: 24,
                    color: Color.fromARGB(255, 40, 4, 148),
                  )),
              Spacer(),
              Text(
                "Request Payment",
                style: TextStyle(color: Color.fromARGB(255, 40, 4, 148), fontSize: 13),
              ),
              SizedBox(
                height: 10,
              )
            ]),
            style: ElevatedButton.styleFrom(
              // fixedSize: Size(90, 100),
              fixedSize: Size(96, 108),
              primary: Colors.white,
              shadowColor: Color(0xffF5F7FA).withOpacity(0.618),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            )),
      ),
      PopupMenuButton(
        icon: Icon(
          FluentIcons.more_vertical_28_regular,
          color: Colors.grey,
        ),
        offset: Offset(119, -27),
        itemBuilder: (context) => [
          PopupMenuItem(
            child: Text("Scan QR Code"),
          ),
          PopupMenuItem(
            child: Text("My QR Code"),
          )
        ],
      )
    ];

     List<Widget> homeScreenContents = <Widget>[
      Stack(
        children: dashboardContents,
      ),
      Container(
        color: Colors.black,
        padding: EdgeInsets.all(10),
        child: Align(
          alignment: Alignment.topLeft,
          child: Wrap(
            direction: Axis.horizontal,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: transactionButtons,
          ),
        ),
      ),
      Expanded(
          flex: 1,
          child: Container(
              color: Colors.black,
              padding: EdgeInsets.symmetric(horizontal: 15),
              height: 150,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Text(
                          "Activity",
                          style:
                              TextStyle(fontSize: 21, color: Color.fromARGB(255, 40, 4, 148)),
                        ),
                        Spacer(),
                        InkWell(
                          child: Text("View all",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey)),
                          onTap: () {},
                        )
                      ],
                    ),
                    width: double.infinity,
                  ),
                  Expanded(
                    child: Container(
                      height: 145,
                      child: Builder(builder: _buildTransactionActivities),
                    ),
                  )
                ],
              )))
    ];

    return Scaffold(

        backgroundColor: Colors.transparent,
        appBar: AppBar(
          actions: dashboardActions,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: CustomScrollView(slivers: [
          SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: homeScreenContents,
              ))
        ]));
  }
