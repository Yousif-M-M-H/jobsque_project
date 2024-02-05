import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/features/login/presentation/views/login_view.dart';

class AlreadyHaveAnAccWidget extends StatelessWidget {
  const AlreadyHaveAnAccWidget({
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
            text: 'Login',
            style: const TextStyle(
              color: Color(0xFF3366FF),
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const LoginView(),
                ));
              },
          ),
        ],
      ),
    );
  }
}
