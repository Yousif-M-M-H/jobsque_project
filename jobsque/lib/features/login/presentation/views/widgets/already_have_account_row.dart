import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/features/signup/presentation/views/sign_up_view.dart';

class LoginAlreadyHaveAnAccWidget extends StatelessWidget {
  const LoginAlreadyHaveAnAccWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Already have an account? ',
        style: AppStyles.mediumFont14,
        children: [
          TextSpan(
            text: 'Register',
            style: const TextStyle(
              color: Color(0xFF3366FF),
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SignUpView(),
                ));
              },
          ),
        ],
      ),
    );
  }
}
