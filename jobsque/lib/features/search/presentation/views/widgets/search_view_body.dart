import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/features/search/presentation/model%20views/search_job_cubit/search_job_cubit.dart';
import 'package:jobsque/features/search/presentation/views/widgets/custom_search_app_bar.dart';
import 'package:jobsque/features/search/presentation/views/widgets/search%20results/widgets/search_result_view.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
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
        ],
      ),
    );
  }
}
