import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/styles.dart';

class SearchResultTextField extends StatelessWidget {
  const SearchResultTextField({
    super.key,
    this.controller,
    this.onChanged,
  });
  final TextEditingController? controller;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      controller: controller,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        prefixIcon: const Icon(Icons.search, color: Color(0xFF9CA3AF)),
        hintText: 'Type something',
        hintStyle: AppStyles.normalFont16.copyWith(
          color: const Color(0xFF9CA3AF),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFD1D5DB), width: 1),
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}
