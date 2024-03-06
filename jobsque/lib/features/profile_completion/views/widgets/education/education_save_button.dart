import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/styles.dart';

class EducationButton extends StatelessWidget {
  const EducationButton({
    super.key,
    this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SizedBox(
        width: double.infinity,
        child: MaterialButton(
          onPressed: onPressed,
          color: const Color(0xFF3366FF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1000),
          ),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Text(
              "Save",
              style: AppStyles.mediumFont16.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
