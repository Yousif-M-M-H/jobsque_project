import 'package:flutter/material.dart';
import 'package:jobsque/features/forget/presentation/views/widgets/reset_password_widgets/forget_password_introduction.dart';
import 'package:jobsque/features/forget/presentation/views/widgets/reset_password_widgets/forgot_password_email_text_field.dart';
import 'package:jobsque/features/forget/presentation/views/widgets/reset_password_widgets/request_password_button.dart';
import 'package:jobsque/features/forget/presentation/views/widgets/reset_password_widgets/rich_text_widget.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double horizontalPadding = screenWidth * 0.05;
    double verticalPadding = screenHeight * 0.05;

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding, vertical: verticalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ForgetPasswordIntroduction(),
          SizedBox(height: screenHeight * 0.05),
          const ForgotPasswordEmailTextField(),
          const Expanded(child: SizedBox()),
          const Center(child: ForgetPasswordRichText()),
          SizedBox(height: screenHeight * 0.02),
          const RequestPasswordLogin(),
        ],
      ),
    );
  }
}
