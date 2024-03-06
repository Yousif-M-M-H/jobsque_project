import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/styles.dart';

class JobSkills extends StatelessWidget {
  const JobSkills({super.key, required this.jobSkils});

  final String jobSkils;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          "Skill Required",
          style: AppStyles.mediumFont14.copyWith(
            color: const Color(0xFF111827),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          jobSkils,
          style: AppStyles.normalFont14.copyWith(
            color: const Color(0xFF111827),
          ),
        ),
      ],
    );
  }
}
