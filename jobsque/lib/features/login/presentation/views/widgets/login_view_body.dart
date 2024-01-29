import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/features/login/presentation/views/widgets/already_have_account_row.dart';
import 'package:jobsque/features/login/presentation/views/widgets/forgot_password.dart';
import 'package:jobsque/features/login/presentation/views/widgets/login_button.dart';
import 'package:jobsque/features/login/presentation/views/widgets/login_divder.dart';
import 'package:jobsque/features/login/presentation/views/widgets/login_password_textfield.dart';
import 'package:jobsque/features/login/presentation/views/widgets/login_username_textfield.dart';
import 'package:jobsque/features/signup/presentation/views/widgets/sign_with_google_face.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

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
          const Text('Login', style: AppStyles.mediumFont28),
          SizedBox(height: screenHeight * 0.01),
          const Text('Please login to find your dream job',
              style: AppStyles.normalFont16),
          SizedBox(height: screenHeight * 0.05),
          const LoginUserNameTextField(),
          SizedBox(height: screenHeight * 0.02),
          const LoginPasswordTextField(),
          SizedBox(height: screenHeight * 0.015),
          const ForgotPasswordRow(),
          const Expanded(child: SizedBox()),
          const Center(
            child: LoginAlreadyHaveAnAccWidget(),
          ),
          SizedBox(height: screenHeight * 0.02),
          const LoginAccountButton(),
          SizedBox(height: screenHeight * 0.025),
          const LoginRowDivderWidget(),
          SizedBox(height: screenHeight * 0.03),
          SignInWithGoogleNFaceRow(screenWidth: screenWidth),
          SizedBox(height: screenHeight * 0.05),
        ],
      ),
    );
  }
}
