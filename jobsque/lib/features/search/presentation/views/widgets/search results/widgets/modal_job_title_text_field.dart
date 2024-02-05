import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/styles.dart';

class ModalJobTitleSearchFields extends StatelessWidget {
  const ModalJobTitleSearchFields({super.key, this.jobTitleController});

  final TextEditingController? jobTitleController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Job title",
          style: AppStyles.mediumFont16.copyWith(color: Colors.black),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: jobTitleController,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            prefixIcon: const Icon(Icons.badge, color: Colors.black),
            hintText: 'Username',
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
