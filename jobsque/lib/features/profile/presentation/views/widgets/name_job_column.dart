import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/styles.dart';

class NameAndJobColumn extends StatelessWidget {
  const NameAndJobColumn({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          name,
          style:
              AppStyles.mediumFont20.copyWith(color: const Color(0xFF111827)),
        ),
        const SizedBox(height: 4),
        Text(
          "'Senior UI/UX Designer",
          style: AppStyles.normalFont14.copyWith(
            color: const Color(0xFF6B7280),
          ),
        ),
      ],
    );
  }
}
