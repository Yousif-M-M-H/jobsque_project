import 'package:flutter/material.dart';

class RecentJobSalary extends StatelessWidget {
  const RecentJobSalary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '\$15K',
            style: TextStyle(
              color: Color(0xFF2E8E18),
              fontSize: 16,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.16,
            ),
          ),
          TextSpan(
            text: '/Month',
            style: TextStyle(
              color: Color(0xFF6B7280),
              fontSize: 12,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.12,
            ),
          ),
        ],
      ),
    );
  }
}
