import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/styles.dart';

class SuggestedJobRow extends StatelessWidget {
  const SuggestedJobRow({
    super.key,
    required this.sugTitle,
  });

  final String sugTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          sugTitle,
          style: AppStyles.mediumFont18,
        ),
        Text(
          'View all',
          style: AppStyles.mediumFont14.copyWith(
            color: const Color(0xFF3366FF),
          ),
        ),
      ],
    );
  }
}
