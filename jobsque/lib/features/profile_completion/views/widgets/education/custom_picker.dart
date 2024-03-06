import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/styles.dart'; // Import your styles

class CustomDatePicker extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController controller;

  const CustomDatePicker({
    Key? key,
    required this.title,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != DateTime.now()) {
      controller.text = "${picked.toLocal()}".split(' ')[0];
    }
  }

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
        GestureDetector(
          onTap: () => _selectDate(context),
          child: AbsorbPointer(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                hintText: hintText,
                hintStyle: AppStyles.mediumFont18.copyWith(
                  color: const Color(0xFF9CA3AF),
                ),
                border: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color(0xFFD1D5DB), width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
