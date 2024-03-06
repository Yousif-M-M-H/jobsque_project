import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/styles.dart';

class SaveButtonEditProfileWidget extends StatelessWidget {
  const SaveButtonEditProfileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            const Color(0xFF3366FF),
          ),
        ),
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 13.5),
          child: Text(
            "Save",
            style: AppStyles.mediumFont16.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
