import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/features/job%20details/presentation/model%20view/job_details_cubit/get_job_by_id_cubit.dart';
import 'package:jobsque/features/job%20details/presentation/views/widgets/company_part_container.dart';
import 'package:jobsque/features/job%20details/presentation/views/widgets/job_desc_skills_container.dart';
import 'package:jobsque/features/job%20details/presentation/views/widgets/job_main_info_widget.dart';
import 'package:jobsque/features/job%20details/presentation/views/widgets/people_part_widget.dart';
import 'package:toggle_switch/toggle_switch.dart';

class JobDetailsViewBody extends StatefulWidget {
  const JobDetailsViewBody({super.key, required this.jobId});

  final int jobId;
  @override
  // ignore: library_private_types_in_public_api
  _JobDetailsViewBodyState createState() => _JobDetailsViewBodyState();
}

class _JobDetailsViewBodyState extends State<JobDetailsViewBody> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    context.read<GetJobByIdCubit>().getJobByIdFunc(id: widget.jobId);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<GetJobByIdCubit, GetJobByIdState>(
              builder: (context, state) {
                if (state is GetJobByIdLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is GetJobByIdFailure) {
                  return Text(state.errMessage);
                } else if (state is GetJobByIdSuccess) {
                  final job = state.jobs.data!;

                  return JobMainInformationWidget(
                    url: job.image ?? "",
                    jobName: job.name ?? "",
                    jobLocation: job.compName ?? "",
                  );
                } else {
                  return Container();
                }
              },
            ),
            const SizedBox(height: 32),
            ToggleSwitch(
              minWidth: 120.0,
              cornerRadius: 20.0,
              activeBgColors: const [
                [Color(0xff091A7A)],
                [Color(0xff091A7A)],
                [Color(0xff091A7A)],
              ],
              activeFgColor: Colors.white,
              inactiveBgColor: const Color(0xFFF4F4F5),
              inactiveFgColor: const Color(0xFF6B7280),
              initialLabelIndex: _currentIndex,
              totalSwitches: 3,
              labels: const ['Description', 'Company', 'People'],
              radiusStyle: true,
              onToggle: (int? index) {
                setState(() {
                  _currentIndex = index!;
                });
              },
            ),
            IndexedStack(
              index: _currentIndex,
              children: [
                BlocBuilder<GetJobByIdCubit, GetJobByIdState>(
                  builder: (context, state) {
                    if (state is GetJobByIdLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is GetJobByIdFailure) {
                      return Text(state.errMessage);
                    } else if (state is GetJobByIdSuccess) {
                      final job = state.jobs.data!;

                      return JobDescriptionAndSkillPage(
                        jobDescription: job.jobDescription ?? "",
                        jobSkils: job.jobSkill ?? "",
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
                BlocBuilder<GetJobByIdCubit, GetJobByIdState>(
                  builder: (context, state) {
                    if (state is GetJobByIdLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is GetJobByIdFailure) {
                      return Text(state.errMessage);
                    } else if (state is GetJobByIdSuccess) {
                      final job = state.jobs.data!;

                      return CompanyInformationWidget(
                        companyEmail: job.compEmail ?? "",
                        companyWebsite: "amit-learn.com",
                        companyDesc: job.aboutComp ?? "",
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
                const PeopleWidget()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
