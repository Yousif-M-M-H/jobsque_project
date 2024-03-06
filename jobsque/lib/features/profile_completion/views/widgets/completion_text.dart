import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/styles.dart';

class CompletionText extends StatelessWidget {
  const CompletionText({
    super.key,
    required this.completedCount,
    required this.completionStatus,
  });

  final int completedCount;
  final List<bool> completionStatus;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "$completedCount/${completionStatus.length} Completed",
          style: AppStyles.mediumFont16.copyWith(
            color: const Color(0xff3366FF),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Complete your profile before applying for a job',
          style: AppStyles.normalFont16.copyWith(
            color: const Color(0xFF6B7280),
          ),
        ),
        const SizedBox(height: 34),
      ],
    );
  }
}
