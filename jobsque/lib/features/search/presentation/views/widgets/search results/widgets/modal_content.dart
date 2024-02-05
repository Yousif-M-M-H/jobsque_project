import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/features/search/presentation/model%20views/search_job_cubit/search_job_cubit.dart';
import 'package:jobsque/features/search/presentation/views/widgets/search%20results/widgets/chip_choice.dart';
import 'package:jobsque/features/search/presentation/views/widgets/search%20results/widgets/modal_custom_app_bar.dart';
import 'package:jobsque/features/search/presentation/views/widgets/search%20results/widgets/modal_job_title_text_field.dart';
import 'package:jobsque/features/search/presentation/views/widgets/search%20results/widgets/modal_location_text_field.dart';
import 'package:jobsque/features/search/presentation/views/widgets/search%20results/widgets/modal_salary_text_field.dart';

class SearchModalContent extends StatelessWidget {
  const SearchModalContent({
    Key? key,
    required this.jobTitleController,
    required this.locationController,
    required this.salaryController,
  }) : super(key: key);

  final TextEditingController jobTitleController;
  final TextEditingController locationController;
  final TextEditingController salaryController;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.9,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchBottomModalCustomAppBar(),
            const SizedBox(height: 24),
            ModalJobTitleSearchFields(
              jobTitleController: jobTitleController,
            ),
            ModalLocationTextField(
              jobLocationController: locationController,
            ),
            ModalSalaryTextField(
              salaryController: salaryController,
            ),
            const SizedBox(height: 16),
            const Text(
              "Job Type",
              style: AppStyles.mediumFont16,
            ),
            const InlineScrollableX(),
            const Expanded(child: SizedBox()),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  try {
                    final salaryInput = salaryController.text.trim().isEmpty
                        ? '0'
                        : salaryController.text.trim();

                    final salary = int.parse(salaryInput);

                    context.read<SearchJobCubit>().searchJob(
                          name: jobTitleController.text.trim(),
                          location: locationController.text.trim(),
                          salary: salary,
                        );

                    Navigator.pop(context);
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Invalid salary input'),
                      ),
                    );
                  }
                },
                child: const Text("Show Results"),
              ),
            ),
            const SizedBox(height: 9),
          ],
        ),
      ),
    );
  }
}
