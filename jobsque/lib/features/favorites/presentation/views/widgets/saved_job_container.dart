import 'package:flutter/widgets.dart';
import 'package:jobsque/core/utils/styles.dart';

class SavedJobContainerWidget extends StatelessWidget {
  const SavedJobContainerWidget({
    super.key,
    required this.jobLength,
  });

  final String jobLength;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const ShapeDecoration(
        color: Color(0xFFF4F4F5),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Color(0xFFE5E7EB),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Center(
          child: Text(
            "$jobLength Job Saved",
            style: AppStyles.normalFont14.copyWith(
              color: const Color(0xFF6B7280),
            ),
          ),
        ),
      ),
    );
  }
}
