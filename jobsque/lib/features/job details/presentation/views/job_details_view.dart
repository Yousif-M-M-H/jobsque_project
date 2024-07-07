// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque/core/utils/assets.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/features/apply_job/presentation/views/apply_job_view.dart';
import 'package:jobsque/core/storage/token_storage.dart';
import 'package:jobsque/features/job%20details/presentation/views/widgets/job_details_view_body.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JobDetailsView extends StatelessWidget {
  const JobDetailsView({Key? key, required this.jobId}) : super(key: key);

  final int jobId;

  Future<bool> _loadFavState() async {
    final prefs = await SharedPreferences.getInstance();
    final tokenStorage = TokenStorage();
    final userId = await tokenStorage.getUserId();
    final isFav = prefs.getBool('fav_${jobId}_user_$userId') ?? false;
    return isFav;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Job Detail",
          style: AppStyles.mediumFont20,
        ),
        actions: [
          FutureBuilder<bool>(
            future: _loadFavState(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: SvgPicture.asset(
                    snapshot.data!
                        ? Assets.imagesSaveIconFilled
                        : Assets.imagesSaveIcon,
                    color: Colors.black,
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
      body: JobDetailsViewBody(
        jobId: jobId,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: BottomAppBar(
          elevation: 0,
          child: SizedBox(
            height: kBottomNavigationBarHeight +
                MediaQuery.of(context).padding.bottom,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ApplyJobView(jobId: jobId)),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(double.infinity),
                  backgroundColor: const Color(0xFF3366FF),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1000),
                  ),
                ),
                child: const Text('Apply now'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
