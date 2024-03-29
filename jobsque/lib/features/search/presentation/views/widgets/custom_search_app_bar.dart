import 'package:flutter/material.dart';
import 'package:jobsque/features/search/presentation/views/widgets/search_text_field.dart';

class CustomSeachAppbar extends StatelessWidget {
  const CustomSeachAppbar({
    super.key,
    this.onSubmitted,
  });

  final void Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: SearchTextfield(
              onSubmitted: onSubmitted,
            ),
          ),
        ],
      ),
    );
  }
}
