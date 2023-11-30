import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:provider/provider.dart';
import 'package:emoney/components.dart';

class AllTransactionActivities extends StatefulWidget {
  final Function setTab;
  const AllTransactionActivities({Key? key, required this.setTab})
      : super(key: key);

  @override
  AllTransactionActivitiesState createState() =>
      AllTransactionActivitiesState();
}

class AllTransactionActivitiesState extends State<AllTransactionActivities> {
  final List allTransactions = [
    {
      "transactionId": "1",
      "transactionMemberName": "Hans Santoso",
      "transactionMemberPhoneNumber": "09000000000",
      "transactionMemberEmail": "hans1@gmail.com",
      "moneySent": "+1000",
      "date": "2023-11-01"
    },
    {
      "transactionId": "2",
      "transactionMemberName": "Jerel Jacob",
      "transactionMemberPhoneNumber": "08000000000",
      "transactionMemberEmail": "jerjb@gmail.com",
      "moneySent": "-1000",
      "date": "2023-11-01"
    },
    {
      "transactionId": "3",
      "transactionMemberName": "Johnny Jade",
      "transactionMemberPhoneNumber": "07000000000",
      "transactionMemberEmail": "jadej@gmail.com",
      "moneySent": "+500",
      "date": "2023-11-01"
    },
    {
      "transactionId": "4",
      "transactionMemberName": "Ivan Makmur",
      "transactionMemberPhoneNumber": "06000000000",
      "transactionMemberEmail": "ivan1@gmail.com",
      "moneySent": "-81000",
      "date": "2023-11-01"
    },
    {
      "transactionId": "5",
      "transactionMemberName": "Sabrina Phalosa",
      "transactionMemberPhoneNumber": "05000000000",
      "transactionMemberEmail": "sabsa@gmail.com",
      "moneySent": "+1000",
      "date": "2023-11-01"
    },
    {
      "transactionId": "6",
      "transactionMemberName": "Sabrina Phalosa",
      "transactionMemberPhoneNumber": "05000000000",
      "transactionMemberEmail": "sabsa@gmail.com",
      "moneySent": "+1000",
      "date": "2023-11-01"
    },
    {
      "transactionId": "7",
      "transactionMemberName": "Ivan Makmur",
      "transactionMemberPhoneNumber": "06000000000",
      "transactionMemberEmail": "ivan1@gmail.com",
      "moneySent": "-81000",
      "date": "2023-11-01"
    },
    {
      "transactionId": "8",
      "transactionMemberName": "Ivan Makmur",
      "transactionMemberPhoneNumber": "06000000000",
      "transactionMemberEmail": "ivan1@gmail.com",
      "moneySent": "-81000",
      "date": "2023-11-01"
    },
    {
      "transactionId": "9",
      "transactionMemberName": "Hans Santoso",
      "transactionMemberPhoneNumber": "09000000000",
      "transactionMemberEmail": "hans1@gmail.com",
      "moneySent": "+1000",
      "date": "2023-11-01"
    },
    {
      "transactionId": "9",
      "transactionMemberName": "Hans Santoso",
      "transactionMemberPhoneNumber": "09000000000",
      "transactionMemberEmail": "hans1@gmail.com",
      "moneySent": "+1000",
      "date": "2023-11-01"
    },
   
];
  List<bool> _activeToggleMenu = [true, false, false];
  Map<String, dynamic>? error = null;
  late TextEditingController activitySearch;

  Widget appBarTitle = Text("Activities",
      style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)));
  Icon actionIcon = Icon(
    FluentIcons.search_24_regular,
    color: Color.fromARGB(255, 255, 255, 255),
  );
  @override
  void initState() {
    super.initState();

    // getTransactionsFromApi();

    activitySearch = TextEditingController();
  }

  void _updateTransactions() {
    if (mounted) {
      setState(() {
        allTransactions.sort(
            (a, b) => b['transactionDate'].compareTo(a['transactionDate']));
        for (var transaction in allTransactions) {
          String dateResponse =
              customGroup(DateTime.parse(transaction['transactionDate']));
          transaction['dateGroup'] = dateResponse;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        //  backgroundColor: Color(0xfffcfcfc),
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                int lastTab =
                    Provider.of<TabNavigationProvider>(context, listen: false)
                        .lastTab;
                Provider.of<TabNavigationProvider>(context, listen: false)
                    .removeLastTab();
                widget.setTab(lastTab);
              },
              icon: Icon(Icons.arrow_back,
                  color: Color.fromARGB(255, 255, 255, 255))),
          title: appBarTitle,
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  if (actionIcon.icon == FluentIcons.search_24_regular) {
                    setState(() {
                      appBarTitle = Container(
                        height: 48,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: Color(0xffF5F7FA),
                            borderRadius:
                                BorderRadius.all(Radius.circular(16.18))),
                        child: TextField(
                          controller: activitySearch,
                          autofocus: true,
                          textAlignVertical: TextAlignVertical.center,
                          onChanged: (value) {
                            setState(() {});
                          },
                          style: TextStyle(
                              color: Color.fromARGB(255, 45, 45, 45)),
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(6.18),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xffF5F7FA), width: 1.618),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16))),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xffF5F7FA), width: 1.618),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16))),
                              hintText: 'Search...',
                              hintStyle: TextStyle(
                                color: Color.fromARGB(255, 40, 40, 40),
                              )),
                        ),
                      );

                      actionIcon = Icon(
                        Icons.close,
                        color: Color.fromARGB(255, 255, 255, 255),
                      );
                    });
                  } else {
                    activitySearch.clear();
                    FocusManager.instance.primaryFocus?.unfocus();
                    setState(() {
                      appBarTitle = Text("Activities",
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255)));
                      actionIcon = Icon(
                        FluentIcons.search_24_regular,
                        color: Color.fromARGB(255, 255, 255, 255),
                      );
                    });
                  }
                },
                icon: actionIcon),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: Column(children: <Widget>[
          SizedBox(
            height: 96,
          ),
          Container(
            decoration: BoxDecoration(
                color: Color(0xffF5F7FA),
                borderRadius: BorderRadius.circular(10)),
            child: ToggleButtons(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xff929BAB),
              fillColor: Color.fromARGB(255, 40, 4, 148),
              selectedColor: Colors.white,
              renderBorder: false,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      "All",
                      style: TextStyle(fontSize: 16),
                    )),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      "Sent",
                      style: TextStyle(fontSize: 16),
                    )),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      "Received",
                      style: TextStyle(fontSize: 16),
                    )),
              ],
              onPressed: (int index) {
                setState(() {
                  for (int buttonIndex = 0;
                      buttonIndex < _activeToggleMenu.length;
                      buttonIndex++) {
                    if (buttonIndex == index) {
                      _activeToggleMenu[buttonIndex] = true;
                    } else {
                      _activeToggleMenu[buttonIndex] = false;
                    }
                  }
                });
              },
              isSelected: _activeToggleMenu,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Expanded(
              child: Container(
                  height: 300,
                  width: double.infinity,
                  child: ListView.builder(
                      itemCount: allTransactions.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(55, 245, 247, 250),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    allTransactions[index]
                                        ['transactionMemberPhoneNumber'],
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 12),
                                  ),
                                  Text(
                                    allTransactions[index]
                                        ['transactionMemberEmail'],
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  Text(
                                    allTransactions[index]['moneySent'],
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 12),
                                  ),
                                  Text(
                                    allTransactions[index]['date'],
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 12),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      })))
        ]));
  }
}
