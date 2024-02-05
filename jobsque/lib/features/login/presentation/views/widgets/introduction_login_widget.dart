import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/styles.dart';

class LoginIntroduction extends StatelessWidget {
  const LoginIntroduction({
    super.key,
    required this.screenHeight,
  });

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Login', style: AppStyles.mediumFont28),
        SizedBox(height: screenHeight * 0.01),
        const Text('Please login to find your dream job',
            style: AppStyles.normalFont16),
        SizedBox(height: screenHeight * 0.05),
      ],
    );
  }
}
