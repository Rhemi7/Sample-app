import 'package:flutter/material.dart';
import 'package:sample_app/features/storage_feature/presentation/screens/profile_screen.dart';
import 'package:sample_app/features/user_feature/presentation/utils/constants.dart';

import 'home_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int? selectedIndex = 0;

  static List<Widget> widgetOptions = <Widget>[
    const HomeScreen(),
    const ProfileScreen(),
  ];

  void _onTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgetOptions.elementAt(selectedIndex!), //New
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTapped,
        elevation: 0,
        currentIndex: selectedIndex!,
        backgroundColor: kColorWhite,
        type: BottomNavigationBarType.fixed,
        iconSize: 25,
        mouseCursor: SystemMouseCursors.grab,
        selectedLabelStyle: const TextStyle(color: kColorBlue, fontSize: 14),
        unselectedLabelStyle: const TextStyle(color: Colors.grey, fontSize: 14),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
