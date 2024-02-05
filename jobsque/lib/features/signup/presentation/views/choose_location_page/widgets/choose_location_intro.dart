import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/styles.dart';

class ChooseLocationIntroduction extends StatelessWidget {
  const ChooseLocationIntroduction({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Where are you prefefred Location?",
          style: AppStyles.mediumFont24,
        ),
        const SizedBox(height: 12),
        Text(
          "Let us know, where is the work location you want at this time, so we can adjust it.",
          style: AppStyles.normalFont14
              .copyWith(color: const Color(0xFF737379), fontSize: 16),
        ),
      ],
    );
  }
}
