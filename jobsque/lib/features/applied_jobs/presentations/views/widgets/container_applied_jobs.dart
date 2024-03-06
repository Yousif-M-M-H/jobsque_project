import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque/core/utils/assets.dart';
import 'package:jobsque/core/utils/styles.dart';

class AppliedJobContainer extends StatelessWidget {
  const AppliedJobContainer({
    super.key,
    required this.jobTitle,
    required this.compName,
  });

  final String jobTitle;
  final String compName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        children: [
          ListTile(
            leading: SvgPicture.asset(
              Assets.imagesZoom,
              width: 70,
              height: 70,
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
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Posted 2 days ago",
                  style: AppStyles.normalFont12,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.watch_later_outlined,
                      color: Colors.green,
                      size: 15,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Be an early Applicant",
                      style: AppStyles.normalFont12,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
