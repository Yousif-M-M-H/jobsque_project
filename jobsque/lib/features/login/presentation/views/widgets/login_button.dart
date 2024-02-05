import 'package:flutter/material.dart';

import 'package:jobsque/core/utils/styles.dart';

class LoginAccountButton extends StatelessWidget {
  const LoginAccountButton({
    super.key,
    this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: MaterialButton(
        onPressed: onPressed,
        color: const Color(0xFFD1D5DB), // Button color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1000), // Border radius
        ),
        child: const Padding(
          padding: EdgeInsets.all(14),
          child: Text(
            "Login",
            style: AppStyles.mediumFont16,
          ),
        ),
      ),
    );
  }
}
