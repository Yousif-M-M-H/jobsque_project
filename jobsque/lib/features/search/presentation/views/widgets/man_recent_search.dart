import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/styles.dart';

class RecentSearchesContainerGrey extends StatelessWidget {
  const RecentSearchesContainerGrey({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 7),
      decoration: const ShapeDecoration(
        color: Color(0xFFF4F4F5),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Color(0xFFE5E7EB),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 24),
        child: Text(
          title,
          style: AppStyles.mediumFont14.copyWith(
            color: const Color(0xFF6B7280),
          ),
        ),
      ),
    );
  }
}
