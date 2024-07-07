// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque/core/utils/assets.dart';
import 'package:jobsque/core/utils/styles.dart';

class NoJobSavedViewBody extends StatelessWidget {
  const NoJobSavedViewBody({Key? key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 100.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(Assets.imagesSavedPage),
            const SizedBox(height: 24),
            const Text(
              "Nothing has been saved yet",
              style: AppStyles.mediumFont24,
            ),
            const SizedBox(height: 8),
            const Text(
              "Press the star icon on the job you want to save",
              style: AppStyles.normalFont16,
            )
          ],
        ),
      ),
    );
  }
}
