import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/styles.dart';

class ForgotPasswordRow extends StatelessWidget {
  const ForgotPasswordRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              value: false,
              onChanged: (value) {},
            ),
            Text(
              'Remember me',
              style: AppStyles.normalFont16.copyWith(fontSize: 14),
            )
          ],
        ),
        const Text(
          "Forgot Password?",
          style: AppStyles.normalFont14,
        )
      ],
    );
  }
}
