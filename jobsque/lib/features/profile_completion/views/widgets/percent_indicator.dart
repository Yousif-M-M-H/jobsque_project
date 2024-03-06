import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PercentIndicator extends StatelessWidget {
  const PercentIndicator({
    super.key,
    required this.completionPercent,
  });

  final double completionPercent;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 33,
        ),
        CircularPercentIndicator(
          radius: 60.0,
          lineWidth: 10.0,
          percent: completionPercent,
          center: Text(
            "${(completionPercent * 100).toInt()}%",
            style: AppStyles.mediumFont24.copyWith(
              color: const Color(0xff3366FF),
            ),
          ),
          progressColor: const Color(0xff3366FF),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
