import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/features/apply_job/presentation/views/widgets/apply_job_view_body.dart';

class ApplyJobView extends StatelessWidget {
  const ApplyJobView({super.key, required this.jobId});

  final int jobId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Padding(
          padding: EdgeInsets.only(top: 15),
          child: Text(
            "Apply Job",
            style: AppStyles.mediumFont20,
          ),
        ),
      ),
      body: ApplyJobViewBody(
        jobId: jobId,
      ),
    );
  }
}
