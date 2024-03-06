import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque/core/utils/assets.dart';
import 'package:jobsque/features/splah_screen/presentation/views/widgets/second_introduction.dart';

class SecondJobView extends StatelessWidget {
  const SecondJobView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            width: double.infinity,
            height: 400,
            child: SvgPicture.asset(Assets.imagesPeopleImage)),
        const SizedBox(height: 15),
        const SecondJobViewIntroduction1(),
      ],
    );
  }
}
