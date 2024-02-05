import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/features/home/presentation/model%20views/all_jobs_cubit/all_jobs_cubit.dart';
import 'package:jobsque/features/home/presentation/views/widgets/home_introduction.dart';
import 'package:jobsque/features/home/presentation/views/widgets/recent_job_widget.dart';
import 'package:jobsque/features/home/presentation/views/widgets/row_suggest_job.dart';
import 'package:jobsque/features/home/presentation/views/widgets/suggest_job_container.dart';
import 'package:jobsque/features/login/presentation/views/widgets/login_password_textfield.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    final double horizontalPadding = screenSize.width * 0.05;
    final double verticalPadding = screenSize.height * 0.07; //

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
            const LoginPasswordTextField(),
            SizedBox(height: screenSize.height * 0.05),
            const SuggestedJobRow(),
            SizedBox(height: screenSize.height * 0.03),
            SizedBox(
              width: double.infinity,
              height: 200,
              child: BlocBuilder<AllJobsCubit, AllJobsState>(
                builder: (context, state) {
                  print("current state is $state");
                  if (state is AllJobsInitial) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is AllJobsLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is AllJobsFailure) {
                    return Center(
                      child: Text(state.errMessage),
                    );
                  } else if (state is AllJobsSuccess) {
                    if (state.jobs.data != null) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.jobs.data!.length,
                        itemBuilder: (context, index) {
                          final job = state.jobs.data![index];
                          return Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: SuggestedJobContainer(
                              jobName: job.name ?? "Nothing",
                              salary: job.salary ?? "0",
                              jobType: job.jobTimeType ?? "fully",
                            ),
                          );
                        },
                      );
                    } else {
                      return const Text("Data is null");
                    }
                  }
                  return const Text("empty");
                },
              ),
            ),
            SizedBox(height: screenSize.height * 0.025),
            const SuggestedJobRow(),
            SizedBox(height: screenSize.height * 0.02),
            const RecentJobWidget(),
          ],
        ),
      ),
    );
  }
}
