import 'package:flutter/material.dart';

class CircleAvatarIcon extends StatelessWidget {
  const CircleAvatarIcon({
    super.key,
    this.icon,
  });

  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 25,
      backgroundColor: const Color(0xFFD6E4FF),
      child: Center(
        child: Icon(
          icon,
          color: const Color(0xff3366FF),
        ),
      ),
    );
  }
}
