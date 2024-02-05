import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/styles.dart';

class ModalSalaryTextField extends StatelessWidget {
  const ModalSalaryTextField({super.key, this.salaryController});

  final TextEditingController? salaryController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(
          "Salary",
          style: AppStyles.mediumFont16.copyWith(color: Colors.black),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: salaryController,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            prefixIcon: const Icon(Icons.monetization_on, color: Colors.black),
            hintText: '\$5k - \$10k',
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
