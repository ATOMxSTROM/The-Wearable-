import "package:ff_navigation_bar_plus/ff_navigation_bar_plus.dart";
import "package:flutter/material.dart";
import "package:provista/Screens/Features/3DModels/animation.dart";
import "package:provista/Screens/Features/emergency.dart";
import "package:provista/Screens/Features/graph_main.dart";
import "package:provista/Screens/Features/numeric_screen.dart";
import "package:provista/Screens/Home/views/home2.dart";
import "package:provista/constants.dart";

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 2;
  final List<Widget> pages = [
    const GraphMain(),
     const NumericScreen(),
     Home2(),
    const Animation3d(),
    const EmergencyPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        pages[selectedIndex],
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: FFNavigationBar(
            theme: FFNavigationBarTheme(
              barBackgroundColor: Colors.white,
              selectedItemBorderColor: kPrimaryColor.withOpacity(0.7),
              selectedItemBackgroundColor: kPrimaryColor,
              selectedItemIconColor: Colors.white,
              selectedItemLabelColor: Colors.black,
            ),
            selectedIndex: selectedIndex,
            onSelectTab: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            items: [
              FFNavigationBarItem(
                iconData: Icons.assessment_rounded,
                label: 'Chart',
              ),
              FFNavigationBarItem(
                iconData: Icons.format_list_numbered_rounded,
                label: 'Numeric',
              ),
              FFNavigationBarItem(
                iconData: Icons.home,
                label: 'Home',
              ),
              FFNavigationBarItem(
                iconData: Icons.view_in_ar,
                label: '3D',
              ),
              FFNavigationBarItem(
                iconData: Icons.emergency_share,
                label: 'SOS',
              ),
            ],
          ),
        ),
      ],
    );
  }
}