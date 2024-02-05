import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque/core/utils/assets.dart';
import 'package:jobsque/core/utils/styles.dart';

class SearchResultsJobContainer extends StatelessWidget {
  const SearchResultsJobContainer({
    super.key,
    required this.jobName,
    required this.companyName,
    required this.jobType,
    required this.salary,
  });
  final String jobName;
  final String companyName;
  final String jobType;
  final String salary;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: SvgPicture.asset(Assets.imagesZoom),
          title: Text(
            jobName,
            style: AppStyles.mediumFont18,
          ),
          subtitle: Text(
            "$companyName • Cairo, Egypt ",
            style: AppStyles.normalFont12,
          ),
          trailing: SvgPicture.asset(
            Assets.imagesSaveIcon,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
                decoration: ShapeDecoration(
                  color: const Color(0xFFD6E4FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                child: Text(
                  jobType,
                  style: AppStyles.normalFont14
                      .copyWith(color: const Color(0xFF3366FF)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text("$salary/Month"),
            )
          ],
        )
      ],
    );
  }
}
