import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/styles.dart';

class UserNameTextField extends StatelessWidget {
  const UserNameTextField({super.key, this.userController, this.onChange});

  final TextEditingController? userController;
  final void Function(String)? onChange;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChange,
      controller: userController,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        prefixIcon: const Icon(Icons.person, color: Color(0xFF9CA3AF)),
        hintText: 'Username',
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
