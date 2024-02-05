import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/styles.dart';

class ModalLocationTextField extends StatelessWidget {
  const ModalLocationTextField({super.key, this.jobLocationController});

  final TextEditingController? jobLocationController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(
          "Location",
          style: AppStyles.mediumFont16.copyWith(color: Colors.black),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: jobLocationController,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            prefixIcon: const Icon(Icons.badge, color: Colors.black),
            hintText: 'Cairo, Egypt',
            hintStyle: AppStyles.normalFont16.copyWith(
              color: Colors.black,
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFD1D5DB), width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}
