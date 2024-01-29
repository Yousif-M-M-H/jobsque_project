import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/styles.dart';

class IntroductionWidget extends StatelessWidget {
  const IntroductionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Text("What type of work are you interested in?",
            style: AppStyles.mediumFont28.copyWith(fontSize: 24)),
        SizedBox(height: screenHeight * 0.02),
        Text(
          "Tell us what you’re interested in so we can customise the app for your needs.",
          style:
              AppStyles.normalFont16.copyWith(color: const Color(0xFF737379)),
        ),
      ],
    );
  }
}
