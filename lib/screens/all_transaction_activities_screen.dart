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
