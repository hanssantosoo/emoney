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
