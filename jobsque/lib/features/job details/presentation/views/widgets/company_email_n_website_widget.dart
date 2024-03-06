import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/styles.dart';

class CompanyEmailAndPasswordContainer extends StatelessWidget {
  const CompanyEmailAndPasswordContainer({
    super.key,
    required this.companyEmail,
  });

  final String companyEmail;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFE5E7EB)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Email",
            style: AppStyles.normalFont12.copyWith(
              color: const Color(0xFF9CA3AF),
            ),
          ),
          const SizedBox(height: 2),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Text(
              companyEmail,
              style: AppStyles.mediumFont14
                  .copyWith(color: const Color(0xFF111827)),
            ),
          ),
        ],
      ),
    );
  }
}
