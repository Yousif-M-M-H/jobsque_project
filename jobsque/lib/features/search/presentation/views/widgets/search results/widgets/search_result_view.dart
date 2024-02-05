import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/features/search/presentation/model%20views/search_job_cubit/search_job_cubit.dart';
import 'package:jobsque/features/search/presentation/views/widgets/recent_searches_widget.dart';
import 'package:jobsque/features/search/presentation/views/widgets/search%20results/widgets/modal_content.dart';
import 'package:jobsque/features/search/presentation/views/widgets/search%20results/widgets/search_result_container.dart';
import 'package:jobsque/features/search/presentation/views/widgets/search%20results/widgets/search_result_text_field.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({Key? key, required this.jobName}) : super(key: key);

  final String jobName;

  @override
  Widget build(BuildContext context) {
    TextEditingController jobTitleController = TextEditingController();
    TextEditingController locationController = TextEditingController();
    TextEditingController salaryController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Expanded(
          child: SearchResultTextField(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 22),
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
                              locationController: locationController,
                              salaryController: salaryController,
                            );
                          },
                        );
                      },
                      icon: const Icon(Icons.manage_search_outlined),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const RecentSearchesWidget(
              title: 'Featuring 120+ jobs',
            ),
            const SizedBox(height: 25),
            BlocBuilder<SearchJobCubit, SearchJobState>(
              builder: (context, state) {
                if (state is SearchJobLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is SearchJobFailure) {
                  return Center(
                    child: Text(state.errMessage),
                  );
                } else if (state is SearchJobSuccess) {
                  final jobsModel = (state).jobsModel;
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: jobsModel.data!.length,
                    itemBuilder: (context, index) {
                      final job = jobsModel.data![index];
                      return SearchResultsJobContainer(
                        jobName: job.name ?? "",
                        companyName: job.compName ?? "",
                        jobType: job.jobTimeType ?? "",
                        salary: job.salary ?? "",
                      );
                    },
                  );
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
