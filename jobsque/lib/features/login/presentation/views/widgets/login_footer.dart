import 'package:flutter/material.dart';
import 'package:jobsque/features/login/presentation/views/widgets/login_divder.dart';
import 'package:jobsque/features/signup/presentation/views/widgets/sign_with_google_face.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: screenHeight * 0.025),
        const LoginRowDivderWidget(),
        SizedBox(height: screenHeight * 0.03),
        SignInWithGoogleNFaceRow(screenWidth: screenWidth),
        SizedBox(height: screenHeight * 0.05),
      ],
    );
  }
}
