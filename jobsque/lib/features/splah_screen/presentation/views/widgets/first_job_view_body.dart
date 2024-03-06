import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque/core/utils/assets.dart';
import 'package:jobsque/core/utils/styles.dart';

class FirstScreenSplash extends StatelessWidget {
  const FirstScreenSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          height: 400,
          child: SvgPicture.asset(Assets.imagesSplashImage),
        ),
        const SizedBox(height: 10),
        const SplahPageOneIntroFirst(),
        const SizedBox(height: 12),
        const SplashOneIntroductionTwo()
      ],
    );
  }
}

class SplahPageOneIntroFirst extends StatelessWidget {
  const SplahPageOneIntroFirst({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Find a job, and start",
            style: AppStyles.mediumFont32,
          ),
          Text(
            "building your career",
            style: AppStyles.mediumFont32,
          ),
          Text(
            "from now on",
            style: AppStyles.mediumFont32,
          ),
        ],
      ),
    );
  }
}

class SplashOneIntroductionTwo extends StatelessWidget {
  const SplashOneIntroductionTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Explore over 25,942 available job roles and",
            style: AppStyles.mediumFont16.copyWith(
              color: const Color(0xFF6B7280),
            ),
          ),
          Text(
            "upgrade your operator now.",
            style: AppStyles.mediumFont16.copyWith(
              color: const Color(0xFF6B7280),
            ),
          )
        ],
      ),
    );
  }
}
