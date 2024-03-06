import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque/core/utils/assets.dart';
import 'package:jobsque/core/utils/styles.dart';

class ThirdJobView extends StatelessWidget {
  const ThirdJobView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          height: 400,
          child: SvgPicture.asset(Assets.imagesGuyImage),
        ),
        const SizedBox(height: 15),
        const ThirdJobIntroduction()
      ],
    );
  }
}

class ThirdJobIntroduction extends StatelessWidget {
  const ThirdJobIntroduction({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Get the best choice for",
            style: AppStyles.mediumFont32,
          ),
          const Text(
            "the job you've always",
            style: AppStyles.mediumFont32,
          ),
          const Text(
            "dreamed of",
            style: AppStyles.mediumFont32,
          ),
          const SizedBox(height: 12),
          Text(
            "The better the skills you have, the greater the",
            style: AppStyles.mediumFont16.copyWith(
              color: const Color(0xFF6B7280),
            ),
          ),
          Text(
            "good job opportunities for you",
            style: AppStyles.mediumFont16.copyWith(
              color: const Color(0xFF6B7280),
            ),
          ),
        ],
      ),
    );
  }
}
