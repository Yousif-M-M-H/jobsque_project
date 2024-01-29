import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/styles.dart';

class AlreadyHaveAnAccWidget extends StatelessWidget {
  const AlreadyHaveAnAccWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        text: 'Already have an account? ',
        style: AppStyles.mediumFont14,
        children: [
          TextSpan(
            text: 'Login',
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
