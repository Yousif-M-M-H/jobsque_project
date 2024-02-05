import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class JobSwitchButton extends StatelessWidget {
  const JobSwitchButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ToggleSwitch(
      minWidth: 150.0,
      cornerRadius: 20.0,
      activeBgColors: const [
        [Color(0xFFF4F4F5)],
        [Color(0xff091A7A)]
      ],
      activeFgColor: Colors.white,
      inactiveBgColor: Colors.grey,
      inactiveFgColor: Colors.white,
      initialLabelIndex: 1,
      totalSwitches: 2,
      labels: const ['Work From Office', 'Remote Work'],
      radiusStyle: true,
    );
  }
}
