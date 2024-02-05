import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/styles.dart';

class ForgetPasswordIntroduction extends StatelessWidget {
  const ForgetPasswordIntroduction({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Reset Password",
          style: AppStyles.mediumFont28,
        ),
        SizedBox(height: 8),
        Text(
          "Enter the email address you used when you joined and we’ll send you instructions to reset your password.",
          style: AppStyles.normalFont16,
        ),
      ],
    );
  }
}
