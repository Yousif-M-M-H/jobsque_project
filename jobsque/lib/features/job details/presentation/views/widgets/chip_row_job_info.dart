import 'package:flutter/material.dart';
import 'package:jobsque/features/job%20details/presentation/views/widgets/job_details_chip_container.dart';

class ChipsRowRowJobDetails extends StatelessWidget {
  const ChipsRowRowJobDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        JobDetailsChip(
          title: "Fulltime",
        ),
        SizedBox(width: 8),
        JobDetailsChip(
          title: "Onsite",
        ),
        SizedBox(width: 8),
        JobDetailsChip(
          title: "Senior",
        ),
      ],
    );
  }
}
