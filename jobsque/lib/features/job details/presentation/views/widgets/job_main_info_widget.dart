import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/features/job%20details/presentation/views/widgets/chip_row_job_info.dart';

class JobMainInformationWidget extends StatelessWidget {
  const JobMainInformationWidget({
    super.key,
    required this.jobName,
    required this.jobLocation,
    required this.url,
  });

  final String jobName;
  final String jobLocation;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          CircleAvatar(
            child: Image.network(url),
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
