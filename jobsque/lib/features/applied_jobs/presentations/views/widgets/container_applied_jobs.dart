import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque/core/utils/assets.dart';
import 'package:jobsque/core/utils/styles.dart';

class AppliedJobContainer extends StatelessWidget {
  const AppliedJobContainer({
    super.key,
    required this.jobTitle,
    required this.compName,
    required this.jobImage,
  });

  final String jobTitle;
  final String compName;
  final String jobImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        children: [
          ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                jobImage,
                width: 45,
                height: 45,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              jobTitle,
              style: AppStyles.mediumFont18,
            ),
            subtitle: Text(
              "$compName • Cairo, Egypt",
              style: AppStyles.normalFont12,
            ),
            trailing: SvgPicture.asset(Assets.imagesOptionsIcon),
          ),
          const SizedBox(height: 5),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Divider(),
          ),
        ],
      ),
    );
  }
}
