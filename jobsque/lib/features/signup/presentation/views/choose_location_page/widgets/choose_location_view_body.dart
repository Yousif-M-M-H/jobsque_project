import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/features/signup/presentation/views/choose_location_page/widgets/choose_location_intro.dart';
import 'package:jobsque/features/signup/presentation/views/choose_location_page/widgets/country_container.dart';
import 'package:jobsque/features/signup/presentation/views/choose_location_page/widgets/job_switch_button.dart';

class ChooseLocationViewBody extends StatelessWidget {
  const ChooseLocationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 45),
      child: Column(
        children: [
          const ChooseLocationIntroduction(),
          const SizedBox(height: 32),
          const JobSwitchButton(),
          const SizedBox(height: 27),
          const Text(
            "Select the country you want for your job",
            style: AppStyles.normalFont16,
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 16,
              ),
              itemCount: 13,
              itemBuilder: (context, index) {
                return AspectRatio(
                  aspectRatio: 2 / 1, // Maintain the aspect ratio
                  child: CountryContainer(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
