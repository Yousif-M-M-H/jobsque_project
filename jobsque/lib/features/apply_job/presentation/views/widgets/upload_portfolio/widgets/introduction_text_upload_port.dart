import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/styles.dart';

class UploadCVIntroduction extends StatelessWidget {
  const UploadCVIntroduction({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          "Upload Portfolio",
          style: AppStyles.mediumFont20,
        ),
        Text(
          "Fill in your bio data correctly",
          style: AppStyles.mediumFont14.copyWith(
            color: const Color(0xFF6B7280),
          ),
        ),
        const SizedBox(height: 28),
        Text(
          "Upload CV",
          style: AppStyles.mediumFont16.copyWith(
            color: const Color(0xFF111827),
          ),
        ),
      ],
    );
  }
}
