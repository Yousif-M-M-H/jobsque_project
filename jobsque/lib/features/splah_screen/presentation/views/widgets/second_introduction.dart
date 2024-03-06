import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/styles.dart';

class SecondJobViewIntroduction1 extends StatelessWidget {
  const SecondJobViewIntroduction1({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Hundreds of jobs are",
            style: AppStyles.mediumFont32,
          ),
          const Text(
            "Waiting for you to join",
            style: AppStyles.mediumFont32,
          ),
          const Text(
            "together",
            style: AppStyles.mediumFont32,
          ),
          const SizedBox(height: 12),
          Text(
            "Immediately join us and start applying for the",
            style: AppStyles.mediumFont16.copyWith(
              color: const Color(0xFF6B7280),
            ),
          ),
          Text(
            "job you are interested in",
            style: AppStyles.mediumFont16.copyWith(
              color: const Color(0xFF6B7280),
            ),
          ),
        ],
      ),
    );
  }
}
