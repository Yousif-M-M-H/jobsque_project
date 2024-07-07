import 'package:flutter/material.dart';

class SalaryRichText extends StatelessWidget {
  const SalaryRichText({
    super.key,
    required this.salary,
  });

  final String salary;

  @override
  Widget build(BuildContext context) {
    String fullSal = "\$${salary}k";
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: fullSal,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w500,
              letterSpacing: 0.20,
            ),
          ),
          TextSpan(
            text: '/Month',
            style: TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontSize: 12,
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w500,
              letterSpacing: 0.12,
            ),
          ),
        ],
      ),
    );
  }
}
