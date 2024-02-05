import 'package:flutter/material.dart';

import 'package:jobsque/core/utils/styles.dart';

class LoginPasswordTextField extends StatelessWidget {
  const LoginPasswordTextField({super.key, this.passwordController});
  final TextEditingController? passwordController;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: passwordController,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        prefixIcon: const Icon(Icons.lock, color: Color(0xFF9CA3AF)),
        hintText: 'Password',
        hintStyle: AppStyles.normalFont16.copyWith(
          color: const Color(0xFF9CA3AF),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFD1D5DB), width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
