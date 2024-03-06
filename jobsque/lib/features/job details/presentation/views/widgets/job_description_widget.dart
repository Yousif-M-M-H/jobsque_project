import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/styles.dart';

class JobDescription extends StatelessWidget {
  const JobDescription({super.key, required this.jobDescription});

  final String jobDescription;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Job Description",
          style: AppStyles.mediumFont14.copyWith(
            color: const Color(0xFF111827),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          jobDescription,
          style: AppStyles.normalFont12,
        ),
      ],
    );
  }
}
