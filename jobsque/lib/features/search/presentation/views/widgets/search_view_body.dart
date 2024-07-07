import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/utils/job_names_list.dart';
import 'package:jobsque/features/search/presentation/model%20views/search_job_cubit/search_job_cubit.dart';
import 'package:jobsque/features/search/presentation/views/widgets/custom_search_app_bar.dart';
import 'package:jobsque/features/search/presentation/views/widgets/man_recent_search.dart';
import 'package:jobsque/features/search/presentation/views/widgets/search%20results/widgets/search_result_view.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomSeachAppbar(
            onSubmitted: (value) {
              if (value.isNotEmpty) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchResults(jobName: value),
                  ),
                );
                context.read<SearchJobCubit>().searchJob(
                      name: value,
                      location: "",
                      salary: 0,
                    );
              }
            },
          ),
          const SizedBox(height: 22),
          const RecentSearchesContainerGrey(title: "Recent Searches"),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: jobsList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ListTile(
                  leading: const Icon(Icons.watch_later_outlined),
                  title: Text(jobsList[index]),
                  trailing: const Icon(
                    Icons.cancel_outlined,
                    color: Colors.red,
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 2),
          ),
          const SizedBox(height: 25),
          const RecentSearchesContainerGrey(title: "Popular Searches"),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: jobsList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ListTile(
                  leading: const Icon(Icons.watch_later_outlined),
                  title: Text(jobsList[index]),
                  trailing: const Icon(
                    Icons.arrow_forward,
                    color: Colors.blue,
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 2),
          ),
        ],
      ),
    );
  }
}
