import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/styles.dart';

class ProfileGeneralContainer extends StatelessWidget {
  const ProfileGeneralContainer({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      decoration: const ShapeDecoration(
        color: Color(0xFFF4F4F5),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFFE5E7EB)),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Text(
          title,
          style: AppStyles.mediumFont14,
        ),
      ),
    );
  }
}
