import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/styles.dart';

class RecentSearchesWidget extends StatelessWidget {
  const RecentSearchesWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      decoration: const ShapeDecoration(
        color: Color(0xFFF4F4F5),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFFE5E7EB)),
        ),
      ),
      width: double.infinity,
      child: Text(
        title,
        style: AppStyles.normalFont14.copyWith(
            color: const Color(0xFF6B7280), fontWeight: FontWeight.w500),
      ),
    );
  }
}
