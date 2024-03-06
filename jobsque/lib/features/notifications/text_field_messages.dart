import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/styles.dart';

class SearchTextfieldNotifications extends StatelessWidget {
  const SearchTextfieldNotifications({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        prefixIcon: const Icon(Icons.search, color: Color(0xFF9CA3AF)),
        hintText: 'Search messages',
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
