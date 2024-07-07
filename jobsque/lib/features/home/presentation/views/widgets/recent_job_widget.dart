import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque/core/utils/assets.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/features/home/presentation/views/widgets/recent_job_salary.dart';
import 'package:jobsque/features/job%20details/presentation/views/widgets/job_details_chip_container.dart';

class RecentJobWidget extends StatelessWidget {
  const RecentJobWidget({
    super.key,
    required this.salary,
    required this.jobName,
    required this.location,
  });
  final String salary;
  final String jobName;
  final String location;

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
          title: Text(
            jobName,
            style: AppStyles.mediumFont18,
          ),
          subtitle: Text(
            "$location • Jakarta, Indonesia ",
            style: AppStyles.normalFont12.copyWith(
              color: const Color(0xFF374151),
            ),
          ),
          trailing: SvgPicture.asset(
            Assets.imagesSaveIcon,
            // ignore: deprecated_member_use
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  JobDetailsChip(
                    title: "Fulltime",
                  ),
                  SizedBox(width: 8),
                  JobDetailsChip(
                    title: "Onsite",
                  ),
                  SizedBox(width: 8),
                  JobDetailsChip(
                    title: "Senior",
                  ),
                ],
              ),
              RecentJobSalary(
                salary: salary,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class JobChipper extends StatelessWidget {
  const JobChipper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: const Color(0xFFD6E4FF),
      label: Text(
        "ahmed",
        style: AppStyles.normalFont12.copyWith(
          color: const Color(0xFF3366FF),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
        side: const BorderSide(
          color: Colors.transparent,
          style: BorderStyle.none,
          width: 0.0,
        ),
      ),
    );
  }
}
