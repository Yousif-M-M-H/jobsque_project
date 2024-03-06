import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class JobDetailsTabBar extends StatelessWidget {
  const JobDetailsTabBar({
    super.key,
    this.onToggle,
  });

  final void Function(int?)? onToggle;

  @override
  Widget build(BuildContext context) {
    return ToggleSwitch(
      minWidth: 120.0,
      cornerRadius: 20.0,
      activeBgColors: const [
        [Color(0xff091A7A)],
        [Color(0xff091A7A)],
        [Color(0xff091A7A)],
      ],
      activeFgColor: Colors.white,
      inactiveBgColor: const Color(0xFFF4F4F5),
      inactiveFgColor: const Color(0xFF6B7280),
      initialLabelIndex: 1,
      totalSwitches: 3,
      labels: const ['Description', 'Company', 'People'],
      radiusStyle: true,
      onToggle: onToggle,
    );
  }
}
