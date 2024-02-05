import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/styles.dart';

class SearchBottomModalCustomAppBar extends StatelessWidget {
  const SearchBottomModalCustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(Icons.arrow_back_outlined),
        Text(
          "Set filter",
          style: AppStyles.mediumFont18.copyWith(fontSize: 20),
        ),
        Text(
          "Reset",
          style:
              AppStyles.normalFont16.copyWith(color: const Color(0xFF3366FF)),
        )
      ],
    );
  }
}
