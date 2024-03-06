import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/styles.dart';

class GeneralListTileTitleWidget extends StatelessWidget {
  const GeneralListTileTitleWidget({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppStyles.normalFont16.copyWith(
        color: const Color(0xFF111827),
      ),
    );
  }
}
