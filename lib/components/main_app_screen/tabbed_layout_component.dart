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

    return WillPopScope(
      onWillPop: _onBackPress,
      child: Scaffold(
        backgroundColor: Color(0xfffefefe),
        extendBodyBehindAppBar: true,
        bottomNavigationBar: googleNavBar(),
        body: screens.isEmpty ? Text("Loading...") : screens[_currentTab],
      ),
    );
  }

  Widget googleNavBar() {
    return Container(
      color: Color.fromARGB(255, 0, 0, 0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.18, vertical: 1),
        child: GNav(
          haptic: false,
          gap: 6,
          activeColor: Color.fromARGB(255, 40, 4, 148),
          iconSize: 24,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 11),
          duration: Duration(milliseconds: 300),
          color: Color.fromARGB(255, 255, 255, 255),
          tabs: [
            GButton(
              icon: FluentIcons.home_32_regular,
              iconSize: 36,
              text: 'Home',
            ),
            GButton(
              icon: HadWinIcons.line_awesome_wallet_solid,
              iconSize: 36,
              text: 'Cards',
            ),
            GButton(
              icon: FluentIcons.alert_32_regular,
              iconActiveColor: Color.fromARGB(255, 40, 4, 148),
              text: 'Activities',
              leading: Stack(
                children: [
                  Icon(
                    FluentIcons.alert_32_regular,
                    color: _currentTab == 2
                        ? Color.fromARGB(255, 40, 4, 148)
                        : Color.fromARGB(255, 255, 255, 255),
                    size: 36,
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: ClipOval(
                      child: Container(
                          color: Color(0xffffb3c1),
                          width: 17,
                          height: 17,
                          child: Center(
                            child: Text("3",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 9.6,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffc9184a),
                                    backgroundColor: Color(0xffffb3c1))),
                          )),
                    ),
                  )
                ],
              ),
            ),
            // GButton(
            //   icon: HadWinIcons.line_awesome_wallet_solid,
            //   text: 'Wallet',
            //   iconSize: 34,
            // ),
          ],
          selectedIndex: _currentTab,
          onTabChange: _onTabChange,
        ),
      ),
    );
  }

  void _onTabChange(index) {
    if (_currentTab == 1 || _currentTab == 2) {
      FocusManager.instance.primaryFocus?.unfocus();
    }

    setState(() {
      _currentTab = index;
    });
  }

  Future<bool> _onBackPress() {
    if (_currentTab == 0) {
      return Future.value(true);
    } else {
      int lastTab =
          Provider.of<TabNavigationProvider>(context, listen: false).lastTab;
      Provider.of<TabNavigationProvider>(context, listen: false)
          .removeLastTab();
      setTab(lastTab);
    }
    return Future.value(false);
  }
}
