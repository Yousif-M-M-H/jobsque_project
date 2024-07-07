import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/styles.dart';

class SearchChipFilter extends StatelessWidget {
  const SearchChipFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      side: BorderSide.none,
      labelStyle: AppStyles.normalFont12.copyWith(
        color: Colors.white,
      ),
      backgroundColor: const Color(0XFF2C3A8D),
      label: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
        child: Row(
          children: [
            Text(
              "Remote",
              style: AppStyles.mediumFont14.copyWith(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
            const Icon(
              Icons.keyboard_arrow_down_outlined,
              color: Colors.white,
            )
          ],
        ),
      ),
      shape: const StadiumBorder(),
    );
  }
}
