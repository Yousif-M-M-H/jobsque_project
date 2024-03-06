import 'package:flutter/widgets.dart';
import 'package:jobsque/core/utils/styles.dart';

class BioDataIntroText extends StatelessWidget {
  const BioDataIntroText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Bio Data",
          style: AppStyles.mediumFont20,
        ),
        const SizedBox(height: 4),
        Text(
          "Fill in your bio data correctly",
          style:
              AppStyles.normalFont14.copyWith(color: const Color(0xFF6B7280)),
        ),
      ],
    );
  }
}
