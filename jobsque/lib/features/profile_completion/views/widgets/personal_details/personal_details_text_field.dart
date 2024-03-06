import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/styles.dart';

class PersonalDetailTextField extends StatelessWidget {
  const PersonalDetailTextField(
      {super.key,
      this.controller,
      required this.hintText,
      required this.title});

  final String title;
  final TextEditingController? controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.mediumFont16.copyWith(
            color: const Color(0xFF9CA3AF),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            hintText: hintText,
            hintStyle: AppStyles.mediumFont18.copyWith(
              color: const Color(0xFF111827),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFD1D5DB), width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        )
      ],
    );
  }
}
