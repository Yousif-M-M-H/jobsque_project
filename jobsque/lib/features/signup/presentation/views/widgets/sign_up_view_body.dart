import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/features/signup/presentation/views/widgets/already_have_account.dart';
import 'package:jobsque/features/signup/presentation/views/widgets/create_account_button.dart';
import 'package:jobsque/features/signup/presentation/views/widgets/email_text_field.dart';
import 'package:jobsque/features/signup/presentation/views/widgets/password_text_field.dart';
import 'package:jobsque/features/signup/presentation/views/widgets/row_divder.dart';
import 'package:jobsque/features/signup/presentation/views/widgets/sign_with_google_face.dart';
import 'package:jobsque/features/signup/presentation/views/widgets/username_text_field.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(
        top: screenHeight * 0.05,
        left: screenWidth * 0.05,
        right: screenWidth * 0.05,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Create Account', style: AppStyles.mediumFont28),
          SizedBox(height: screenHeight * 0.01),
          const Text('Please create an account to find your dream job',
              style: AppStyles.normalFont16),
          SizedBox(height: screenHeight * 0.05),
          const UserNameTextField(),
          SizedBox(height: screenHeight * 0.02),
          const EmailTextfield(),
          SizedBox(height: screenHeight * 0.02),
          const PasswordTextField(),
          SizedBox(height: screenHeight * 0.015),
          Text(
            'Password must be at least 8 characters',
            style:
                AppStyles.normalFont16.copyWith(color: const Color(0xFF9CA3AF)),
          ),
          const Expanded(child: SizedBox()),
          const Center(child: AlreadyHaveAnAccWidget()),
          SizedBox(height: screenHeight * 0.02),
          const CreateAccountButton(),
          SizedBox(height: screenHeight * 0.025),
          const RowDivderWidget(),
          SizedBox(height: screenHeight * 0.03),
          SignInWithGoogleNFaceRow(screenWidth: screenWidth),
          SizedBox(height: screenHeight * 0.05),
        ],
      ),
    );
  }
}
