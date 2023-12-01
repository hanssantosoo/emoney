import 'dart:async';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:emoney/providers/tab_navigation_provider.dart';
import 'package:emoney/screens/all_transaction_activities_screen.dart';
import 'package:emoney/screens/home_dashboard_screen.dart';
import 'package:emoney/screens/wallet_screen.dart';
import 'package:emoney/utilities/icons.dart';
import 'package:provider/provider.dart';

class TabbedLayoutComponent extends StatefulWidget {
  const TabbedLayoutComponent({Key? key}) : super(key: key);

  @override
  _TabbedLayoutComponentState createState() => _TabbedLayoutComponentState();
}

class _TabbedLayoutComponentState extends State<TabbedLayoutComponent> {
  int _currentTab = 0;

  final LabeledGlobalKey<HomeDashboardScreenState> dashboardScreenKey =
      LabeledGlobalKey("Dashboard Screen");
  final LabeledGlobalKey<WalletScreenState> wallet =
      LabeledGlobalKey("Wallet Screen");
  final LabeledGlobalKey<AllTransactionActivitiesState> alltrans =
      LabeledGlobalKey("All Transaction Activities");

  void setTab(int index) {
    setState(() {
      _currentTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      HomeDashboardScreen(
        setTab: setTab,
        key: dashboardScreenKey,
      ),
      WalletScreen(
        setTab: setTab,
        key: wallet,
      ),
      AllTransactionActivities(
        setTab: setTab,
        key: alltrans,
      ),
    ];
