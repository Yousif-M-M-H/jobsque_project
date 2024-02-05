import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/styles.dart';

class CreateNewPasswordIntroduction extends StatelessWidget {
  const CreateNewPasswordIntroduction({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Create new password",
          style: AppStyles.mediumFont28,
        ),
        SizedBox(height: 8),
        Text(
          "Set your new password so you can login and acces Jobsque",
          style: AppStyles.normalFont16,
        )
      ],
    );
  }
}
