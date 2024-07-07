// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque/core/storage/token_storage.dart';
import 'package:jobsque/core/utils/assets.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/features/home/presentation/views/widgets/recent_job_salary.dart';
import 'package:jobsque/features/job%20details/presentation/views/job_details_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchResultsJobContainer extends StatelessWidget {
  const SearchResultsJobContainer({
    super.key,
    required this.jobName,
    required this.companyName,
    required this.jobType,
    required this.salary,
    required this.jobImage,
    required this.jobId,
  });

  final String jobName;
  final String companyName;
  final String jobType;
  final String salary;
  final String jobImage;
  final int jobId;

  Future<bool> _loadFavState(int jobId) async {
    final prefs = await SharedPreferences.getInstance();
    final tokenStorage = TokenStorage();
    final userId = await tokenStorage.getUserId();
    final isFav = prefs.getBool('fav_${jobId}_user_$userId') ?? false;
    return isFav;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: FutureBuilder<bool>(
            future: _loadFavState(jobId),
            builder: (context, snapshot) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => JobDetailsView(jobId: jobId),
                    ),
                  );
                },
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      jobImage,
                      width: 45,
                      height: 45,
                    ),
                  ),
                  title: Text(
                    jobName,
                    style: AppStyles.mediumFont18,
                  ),
                  subtitle: Text(
                    "$companyName • Cairo, Egypt ",
                    style: AppStyles.normalFont12,
                  ),
                  trailing: snapshot.connectionState == ConnectionState.done &&
                          snapshot.hasData
                      ? SvgPicture.asset(
                          snapshot.data!
                              ? Assets.imagesSaveIconFilled
                              : Assets.imagesSaveIcon,
                          color: const Color(0xff3366FF),
                        )
                      : const SizedBox(width: 24, height: 24),
                ),
              );
            },
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
              child: RecentJobSalary(
                salary: salary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
