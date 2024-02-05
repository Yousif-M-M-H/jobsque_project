import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque/core/utils/assets.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/features/home/presentation/views/widgets/apply_now_row.dart';
import 'package:jobsque/features/home/presentation/views/widgets/job_type_container.dart';

class SuggestedJobContainer extends StatelessWidget {
  const SuggestedJobContainer({
    super.key,
    required this.jobName,
    required this.salary,
    required this.jobType,
  });

  final String jobName;
  final String salary;
  final String jobType;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: ShapeDecoration(
        color: const Color(0xFF091A7A),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SvgPicture.asset(Assets.imagesZoom),
              Column(
                children: [
                  Text(
                    jobName,
                    style: AppStyles.mediumFont18.copyWith(color: Colors.white),
                  ),
                  const Text(
                    'Zoom • United States',
                    style: TextStyle(
                      color: Color(0xFF9CA3AF),
                      fontSize: 12,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.12,
                    ),
                  ),
                ],
              ),
              SvgPicture.asset(Assets.imagesSaveIcon)
            ],
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                JobTypeContainer(
                  jobType: jobType,
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          ApplyNowRow(
            salary: salary,
          )
        ],
      ),
    );
  }
}
