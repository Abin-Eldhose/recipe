import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:recipie_app/presentation/constants.dart';

class BottomNavBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onTap;
  const BottomNavBar(
      {super.key, required this.onTap, required this.selectedIndex});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.015, vertical: height * 0.01),
        child: GNav(
          gap: 10,
          tabBorderRadius: 20,
          activeColor: Colors.white,
          color: sigInPageBg,
          tabBackgroundGradient: const LinearGradient(
              colors: [sigInPageBg, sigInPageBg2],
              begin: Alignment.topLeft,
              end: Alignment.topRight),
          iconSize: 30,
          textSize: 18,
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.07, vertical: height * 0.01),
          tabs: const [
            GButton(
              icon: Icons.home_outlined,
              text: "Home",
            ),
            GButton(
              icon: Icons.category,
              text: "Categories",
            ),
            GButton(
              icon: Icons.bookmark_sharp,
              text: "Saved",
            ),
          ],
          onTabChange: widget.onTap,
          selectedIndex: 0,
        ),
      ),
    );
  }
}
