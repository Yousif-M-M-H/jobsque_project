import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/features/home/presentation/model%20views/all_jobs_cubit/all_jobs_cubit.dart';
import 'package:jobsque/features/home/presentation/views/widgets/home_introduction.dart';
import 'package:jobsque/features/home/presentation/views/widgets/recent_job_widget.dart';
import 'package:jobsque/features/home/presentation/views/widgets/row_suggest_job.dart';
import 'package:jobsque/features/home/presentation/views/widgets/suggest_job_container.dart';
import 'package:jobsque/features/job%20details/presentation/views/job_details_view.dart';
import 'package:jobsque/features/login/presentation/views/widgets/search_text_field_home.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double horizontalPadding = screenSize.width * 0.05;
    final double verticalPadding = screenSize.height * 0.07;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding, vertical: verticalPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeIntroduction(),
            const SizedBox(height: 28),
            const SeachTextfieldHome(),
            SizedBox(height: screenSize.height * 0.05),
            const SuggestedJobRow(sugTitle: "Suggested Job"),
            SizedBox(height: screenSize.height * 0.03),
            BlocBuilder<AllJobsCubit, AllJobsState>(
              builder: (context, state) {
                if (state is AllJobsInitial || state is AllJobsLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is AllJobsFailure) {
                  return Center(child: Text(state.errMessage));
                } else if (state is AllJobsSuccess && state.jobs.data != null) {
                  return SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.jobs.data!.length,
                        itemBuilder: (context, index) {
                          final job = state.jobs.data![index];
                          return Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        JobDetailsView(jobId: job.id!),
                                  ),
                                );
                              },
                              child: SizedBox(
                                width: 350,
                                child: SuggestedJobContainer(
                                  jobId: job.id!,
                                  jobName: job.name ?? "Nothing",
                                  salary: job.salary!.substring(0, 2),
                                  jobType: job.jobTimeType ?? "full-time",
                                ),
                              ),
                            ),
                          );
                        },
                      ));
                } else {
                  return const Text("No data available");
                }
              },
            ),
            SizedBox(height: screenSize.height * 0.025),
            const SuggestedJobRow(sugTitle: "Recent Jobs"),
            SizedBox(height: screenSize.height * 0.02),
            BlocBuilder<AllJobsCubit, AllJobsState>(
              builder: (context, state) {
                if (state is AllJobsInitial || state is AllJobsLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is AllJobsFailure) {
                  return Center(child: Text(state.errMessage));
                } else if (state is AllJobsSuccess && state.jobs.data != null) {
                  return Column(
                    children: state.jobs.data!
                        .asMap()
                        .map((index, job) {
                          return MapEntry(
                              index,
                              Column(
                                children: [
                                  RecentJobWidget(
                                    salary: job.salary?.substring(0, 2) ?? "",
                                    jobName: job.name ?? "Job",
                                    location:
                                        "Location", // Adjust based on your model
                                  ),
                                  if (index != state.jobs.data!.length - 1)
                                    const Column(
                                      children: [
                                        SizedBox(height: 16),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 24),
                                          child: Divider(),
                                        ),
                                        SizedBox(height: 16)
                                      ],
                                    )
                                ],
                              ));
                        })
                        .values
                        .toList(),
                  );
                } else {
                  return const Text("No data available");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
