import 'package:flutter/material.dart';
import 'package:recipie_app/presentation/constants.dart';

class CircleButtonWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  CircleButtonWidget({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final hieght = MediaQuery.of(context).size.height;
    return Column(
      children: [
        CircleAvatar(
          radius: width * 0.06,
          backgroundColor: sigInPageBg,
          child: Center(
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          height: hieght * 0.005,
        ),
        Text(
          label,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
