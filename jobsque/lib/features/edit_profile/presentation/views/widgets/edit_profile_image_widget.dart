import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque/core/utils/assets.dart';
import 'package:jobsque/core/utils/styles.dart';

class EditProfileImageWidget extends StatelessWidget {
  const EditProfileImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: SvgPicture.asset(
            Assets.imagesProfilePicImg,
            // ignore: deprecated_member_use
            color: Colors.red,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "Change Photo",
          style: AppStyles.mediumFont16.copyWith(
            color: const Color(0xFF3366FF),
          ),
        )
      ],
    );
  }
}
