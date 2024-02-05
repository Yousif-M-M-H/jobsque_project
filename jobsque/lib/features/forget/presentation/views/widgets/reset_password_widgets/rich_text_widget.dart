import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/styles.dart';

class ForgetPasswordRichText extends StatelessWidget {
  const ForgetPasswordRichText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        text: 'You remember your password',
        style: AppStyles.mediumFont14,
        children: [
          TextSpan(
            text: ' login',
            style: TextStyle(
              color: Color(0xFF3366FF),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
