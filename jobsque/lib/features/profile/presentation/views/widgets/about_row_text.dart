import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/styles.dart';

class AboutTextRow extends StatelessWidget {
  const AboutTextRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "About",
              style: AppStyles.mediumFont16.copyWith(
                color: const Color(0xFF6B7280),
              ),
            ),
            Text(
              "Edit",
              style: AppStyles.mediumFont14.copyWith(
                color: const Color(0xFF3366FF),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          "I'm Rafif Dian Axelingga, I’m UI/UX Designer, I have experience designing UI Design for approximately 1 year. I am currently joining the Vektora studio team based in Surakarta, Indonesia.I am a person who has a high spirit and likes to work to achieve what I dream of.",
          style: AppStyles.normalFont14.copyWith(
            color: const Color(0xFF6B7280),
          ),
        )
      ],
    );
  }
}
