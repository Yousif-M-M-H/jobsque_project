import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/styles.dart';

class ProfileCompletionContainer extends StatelessWidget {
  final String containerTitle;
  final String containerDescription1;
  final String containerDescription2;
  final bool isCompleted;
  final VoidCallback onTap;

  const ProfileCompletionContainer({
    super.key,
    required this.containerTitle,
    required this.containerDescription1,
    required this.containerDescription2,
    required this.onTap,
    this.isCompleted = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isCompleted ? null : onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: isCompleted ? const Color(0xFFE0EAFF) : Colors.white,
          border: Border.all(color: const Color(0xFFD1D5DB), width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundColor: isCompleted
                      ? const Color(0xff3366FF)
                      : const Color(0xff9CA3AF),
                  child: const Center(
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      containerTitle,
                      style: AppStyles.mediumFont16
                          .copyWith(color: const Color(0xFF111827)),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      containerDescription1,
                      style: AppStyles.normalFont12,
                    ),
                    Text(
                      containerDescription2,
                      style: AppStyles.normalFont12,
                    ),
                  ],
                ),
              ],
            ),
            const Icon(Icons.arrow_forward),
          ],
        ),
      ),
    );
  }
}
