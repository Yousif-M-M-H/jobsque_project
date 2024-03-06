import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque/core/utils/assets.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/features/job%20details/presentation/views/widgets/chip_row_job_info.dart';

class JobMainInformationWidget extends StatelessWidget {
  const JobMainInformationWidget({
    super.key,
    required this.jobName,
    required this.jobLocation,
  });

  final String jobName;
  final String jobLocation;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          SvgPicture.asset(
            Assets.imagesZoom,
          ),
          const SizedBox(height: 12),
          Text(
            jobName,
            style: AppStyles.mediumFont20,
          ),
          const SizedBox(height: 4),
          Text(
            "$jobLocation • Cairo, Egypt",
            style: AppStyles.normalFont12,
          ),
          const SizedBox(height: 16),
          const ChipsRowRowJobDetails()
        ],
      ),
    );
  }
}
