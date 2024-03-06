import 'package:flutter/material.dart';

class RecentJobSalary extends StatelessWidget {
  const RecentJobSalary({
    super.key,
    required this.salary,
  });
  final String salary;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            // ignore: prefer_adjacent_string_concatenation
            text: '\$$salary' + 'k',
            style: const TextStyle(
              color: Color(0xFF2E8E18),
              fontSize: 16,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.16,
            ),
          ),
          const TextSpan(
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
