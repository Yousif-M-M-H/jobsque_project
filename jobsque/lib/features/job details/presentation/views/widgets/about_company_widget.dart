import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/styles.dart';

class AboutComapnyWidget extends StatelessWidget {
  const AboutComapnyWidget({super.key, required this.companyDesc});
  final String companyDesc;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "About Company",
          style:
              AppStyles.mediumFont14.copyWith(color: const Color(0xFF111827)),
        ),
        const SizedBox(height: 16),
        Text(
          companyDesc,
          style: AppStyles.normalFont12.copyWith(
            color: const Color(0xFF4B5563),
          ),
        ),
      ],
    );
  }
}
