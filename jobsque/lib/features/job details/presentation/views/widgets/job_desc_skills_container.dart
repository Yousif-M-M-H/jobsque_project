import 'package:flutter/material.dart';
import 'package:jobsque/features/job%20details/presentation/views/widgets/job_description_widget.dart';
import 'package:jobsque/features/job%20details/presentation/views/widgets/job_skills_info.dart';

class JobDescriptionAndSkillPage extends StatelessWidget {
  const JobDescriptionAndSkillPage(
      {super.key, required this.jobDescription, required this.jobSkils});

  final String jobDescription;
  final String jobSkils;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        JobDescription(
          jobDescription: jobDescription,
        ),
        JobSkills(
          jobSkils: jobSkils,
        ),
      ],
    );
  }
}
