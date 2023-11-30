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
   
