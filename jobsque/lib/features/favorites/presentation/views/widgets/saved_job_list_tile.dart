import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque/core/utils/assets.dart';
import 'package:jobsque/core/utils/styles.dart';

class SavedJobListTileWidget extends StatelessWidget {
  const SavedJobListTileWidget({
    super.key,
    required this.jobTitle,
    required this.companyName,
  });

  final String jobTitle;
  final String companyName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: SvgPicture.asset(
            Assets.imagesZoom,
            height: 60,
            width: 60,
          ),
          title: Text(jobTitle),
          subtitle: Text("$companyName . Cairo"),
          trailing: SvgPicture.asset(
            Assets.imagesOptionsIcon,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: const Row(
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
                    size: 18,
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Be an early applicant",
                    style: AppStyles.normalFont12,
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
