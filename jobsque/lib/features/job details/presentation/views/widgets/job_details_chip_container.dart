import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/styles.dart';

class JobDetailsChip extends StatelessWidget {
  const JobDetailsChip({
    super.key,
    required this.title,
  });

  final String title;
  @override
  Widget build(BuildContext context) {
    return Chip(
      side: BorderSide.none,
      labelStyle: AppStyles.normalFont12.copyWith(
        color: const Color(0xFF3366FF),
      ),
      backgroundColor: const Color(0xFFD6E4FF),
      label: Text(title),
    );
  }
}
