import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/utils/styles.dart';

class LoginAlreadyHaveAnAccWidget extends StatelessWidget {
  const LoginAlreadyHaveAnAccWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Need an account? ',
        style: AppStyles.mediumFont14,
        children: [
          TextSpan(
            text: 'Register',
            style: TextStyle(
              color: Color(0xFF3366FF),
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                GoRouter.of(context)
                    .go('/'); // Assuming '/' is your SignUpView route
              },
          ),
        ],
      ),
    );
  }
}
