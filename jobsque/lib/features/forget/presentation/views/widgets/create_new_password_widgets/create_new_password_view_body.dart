import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/features/forget/presentation/views/widgets/create_new_password_widgets/button_reset_password.dart';
import 'package:jobsque/features/forget/presentation/views/widgets/create_new_password_widgets/introduction_create_new_pass.dart';
import 'package:jobsque/features/forget/presentation/views/widgets/create_new_password_widgets/new_password_text_field.dart';

class CreateNewPasswordViewBody extends StatelessWidget {
  const CreateNewPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05, vertical: screenHeight * 0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CreateNewPasswordIntroduction(),
          SizedBox(height: screenHeight * 0.055),
          const CreateNewPasswordTextField(),
          SizedBox(height: screenHeight * 0.02),
          const Text(
            "Password must be at least 8 characters",
            style: AppStyles.normalFont16,
          ),
          SizedBox(height: screenHeight * 0.036),
          const CreateNewPasswordTextField(),
          SizedBox(height: screenHeight * 0.02),
          const Text(
            "Both passwords must match",
            style: AppStyles.normalFont16,
          ),
          const Expanded(child: SizedBox()),
          const ResetPasswordButton(),
        ],
      ),
    );
  }
}
