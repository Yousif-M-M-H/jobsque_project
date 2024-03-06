import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/styles.dart';

class InformationRow extends StatelessWidget {
  const InformationRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text(
              "Applied",
              style: AppStyles.mediumFont14.copyWith(
                color: const Color(0xFF6B7280),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "46",
              style: AppStyles.mediumFont20,
            ),
          ],
        ),
        const SizedBox(width: 12),
        const VerticalDivider(
          color: Colors.black,
          thickness: 1,
        ),
        Column(
          children: [
            Text(
              "Reviewd",
              style: AppStyles.mediumFont14.copyWith(
                color: const Color(0xFF6B7280),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "23",
              style: AppStyles.mediumFont20,
            ),
          ],
        ),
        const SizedBox(width: 12),
        const VerticalDivider(
          color: Colors.black,
          thickness: 1,
        ),
        Column(
          children: [
            Text(
              "Contacted",
              style: AppStyles.mediumFont14.copyWith(
                color: const Color(0xFF6B7280),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "16",
              style: AppStyles.mediumFont20,
            ),
          ],
        ),
      ],
    );
  }
}
