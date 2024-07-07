import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/features/search/presentation/model%20views/search_job_cubit/search_job_cubit.dart';
import 'package:jobsque/features/search/presentation/views/widgets/recent_searches_widget.dart';
import 'package:jobsque/features/search/presentation/views/widgets/search%20results/widgets/modal_content.dart';
import 'package:jobsque/features/search/presentation/views/widgets/search%20results/widgets/search_chip_filter.dart';
import 'package:jobsque/features/search/presentation/views/widgets/search%20results/widgets/search_result_container.dart';
import 'package:jobsque/features/search/presentation/views/widgets/search%20results/widgets/search_result_text_field.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({Key? key, required this.jobName}) : super(key: key);

  final String jobName;

  @override
  Widget build(BuildContext context) {
    TextEditingController jobTitleController =
        TextEditingController(text: jobName);

    context.read<SearchJobCubit>().searchJob(
          name: jobName,
          location: "",
          salary: 0,
        );

    return Scaffold(
      appBar: AppBar(
        title: SearchResultTextField(
          controller: jobTitleController,
          onChanged: (value) {
            context.read<SearchJobCubit>().searchJob(
                  name: value,
                  location: "",
                  salary: 0,
                );
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SizedBox(
              height: 25,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (BuildContext context) {
                          return SearchModalContent(
                            jobTitleController: jobTitleController,
                            locationController: TextEditingController(),
                            salaryController: TextEditingController(),
                          );
                        },
                      );
                    },
                    icon: const Icon(Icons.manage_search_outlined),
                  ),
                  const SearchChipFilter(),
                ],
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<SearchJobCubit, SearchJobState>(
              builder: (context, state) {
                if (state is SearchJobLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is SearchJobFailure) {
                  return const Center(child: Text('Failed to load jobs.'));
                } else if (state is SearchJobSuccess) {
                  if (state.jobsModel.data!.isEmpty) {
                    return const Center(child: Text('No jobs found.'));
                  }
                  return Column(
                    children: [
                      const SizedBox(height: 20),
                      const RecentSearchesWidget(
                        title: 'Featuring 120+ jobs',
                      ),
                      Expanded(
                        child: ListView.separated(
                          padding: const EdgeInsets.all(24),
                          itemCount: state.jobsModel.data!.length,
                          itemBuilder: (context, index) {
                            final job = state.jobsModel.data![index];
                            return SearchResultsJobContainer(
                              jobId: job.id!,
                              jobImage: job.image!,
                              jobName: job.name ?? "",
                              companyName: job.compName ?? "",
                              jobType: job.jobTimeType ?? "",
                              salary: job.salary?.substring(0, 2) ?? "",
                            );
                          },
                          separatorBuilder: (context, index) => const Divider(),
                        ),
                      )
                    ],
                  );
                }
                return Container(); // Fallback for unhandled states
              },
            ),
          ),
        ],
      ),
    );
  }
}
