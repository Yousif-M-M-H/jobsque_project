import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/features/applied_jobs/presentations/views/widgets/applied_jobs_view_body.dart';

class AppliedJobsView extends StatelessWidget {
  const AppliedJobsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Padding(
          padding: EdgeInsets.only(top: 15),
          child: Text(
            "Applied jobs",
            style: AppStyles.mediumFont20,
          ),
        ),
      ),
      body: const AppliedJobsViewBody(),
    );
  }
}
