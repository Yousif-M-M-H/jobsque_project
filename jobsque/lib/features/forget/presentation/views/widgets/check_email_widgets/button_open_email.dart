import 'package:flutter/material.dart';

import 'package:jobsque/core/utils/styles.dart';

class OpenEmailButton extends StatelessWidget {
  const OpenEmailButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: MaterialButton(
        onPressed: () {},
        color: const Color(0xFF3366FF), // Button color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1000), // Border radius
        ),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Text(
            "Open email app",
            style: AppStyles.mediumFont16.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
