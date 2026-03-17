import 'package:flutter/material.dart';

class MyTab extends StatelessWidget {
  final IconData iconPath;
  final String iconName;

  const MyTab({
    super.key,
    required this.iconPath,
    required this.iconName,

  });


  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(iconPath, size: 28),
          const SizedBox(height: 6),
          Text(
            iconName.toUpperCase(),
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}