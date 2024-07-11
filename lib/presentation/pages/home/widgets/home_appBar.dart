import 'package:flutter/material.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Text(
          "What are you \ncooking today ?",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: width * 0.07, height: 1),
        ),
        const Spacer()
      ],
    );
  }
}
