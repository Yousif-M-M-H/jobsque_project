import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:jobsque/core/models/home_models/applied_jobs_model.dart';
import 'package:jobsque/core/models/home_models/job_id_model.dart';
import 'package:jobsque/core/storage/token_storage.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/features/applied_jobs/presentations/views/widgets/container_applied_jobs.dart';

class AppliedJobsViewBody extends StatefulWidget {
  const AppliedJobsViewBody({Key? key}) : super(key: key);

  @override
  State<AppliedJobsViewBody> createState() => _AppliedJobsViewBodyState();
}

class _AppliedJobsViewBodyState extends State<AppliedJobsViewBody> {
  late Future<List<JobByIdData>> appliedJobs;
  final TokenStorage tokenStorage = TokenStorage();

  @override
  void initState() {
    super.initState();
    appliedJobs = getAppliedJobs();
  }

  Future<List<JobByIdData>> getAppliedJobs() async {
    String? bearerToken = await tokenStorage.getToken();
    int? userId = await tokenStorage.getUserId();

    var dio = Dio();
    dio.options.headers['Authorization'] = 'Bearer $bearerToken';
    final response =
        await dio.get('https://project2.amit-learning.com/api/apply/$userId');

    if (response.statusCode == 200) {
      var jobsData = AppliedJobsModel.fromJson(response.data);
      List<Future<JobByIdData>> jobDetailsFutures =
          jobsData.data!.map((appliedData) {
        return dio
            .get(
                'https://project2.amit-learning.com/api/jobs/${appliedData.jobsId}')
            .then((jobResponse) => JobIdModel.fromJson(jobResponse.data).data!);
      }).toList();

      return Future.wait(jobDetailsFutures);
    } else {
      throw Exception('Failed to load applied jobs');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        FutureBuilder<List<JobByIdData>>(
          future: appliedJobs,
          builder: (context, snapshot) {
            String jobCountText = " Applied Jobs";
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              jobCountText = "Applied Jobs: ${snapshot.data!.length}";
            }
            return Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: const ShapeDecoration(
                color: Color(0xFFF4F4F5),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    color: Color(0xFFE5E7EB),
                  ),
                ),
              ),
              child: Center(
                child: Text(
                  jobCountText, // Dynamically display the length of applied jobs here
                  style: AppStyles.mediumFont14.copyWith(
                    color: const Color(0xFF6B7280),
                  ),
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 25),
        Expanded(
          child: FutureBuilder<List<JobByIdData>>(
            future: appliedJobs,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                if (snapshot.hasData && snapshot.data!.isEmpty) {
                  return const Center(child: Text('No applied jobs'));
                } else {
                  return ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 20),
                    itemCount: snapshot.data!.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      final job = snapshot.data![index];
                      return AppliedJobContainer(
                        jobTitle: job.name!,
                        compName: job.compName!,
                        jobImage: job.image!,
                      );
                    },
                  );
                }
              }
            },
          ),
        ),
      ],
    );
  }
}
