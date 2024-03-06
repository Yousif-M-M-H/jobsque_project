import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque/core/utils/assets.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/features/apply_job/presentation/views/apply_job_view.dart';
import 'package:jobsque/features/job%20details/presentation/views/widgets/job_details_view_body.dart';

class JobDetailsView extends StatelessWidget {
  const JobDetailsView({Key? key, required this.jobId}) : super(key: key);

  final int jobId;

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
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: SvgPicture.asset(
              Assets.imagesSaveIcon,
              // ignore: deprecated_member_use
              color: Colors.blue,
            ),
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
                      builder: (context) => ApplyJobView(
                        jobId: jobId,
                      ),
                    ),
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
