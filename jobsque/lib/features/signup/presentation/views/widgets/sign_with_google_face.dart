import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque/core/utils/assets.dart';

class SignInWithGoogleNFaceRow extends StatelessWidget {
  const SignInWithGoogleNFaceRow({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(Assets.imagesGoogleContainer),
        SizedBox(width: screenWidth * 0.025),
        SvgPicture.asset(Assets.imagesFacebookContainer),
      ],
    );
  }
}
