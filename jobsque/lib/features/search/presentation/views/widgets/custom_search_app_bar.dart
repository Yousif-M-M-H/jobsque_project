import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/utils/app_router.dart';
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
      padding: const EdgeInsets.only(top: 35, left: 24, right: 24),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              GoRouter.of(context).go(AppRouter.knavbarView);
            },
            child: const Icon(Icons.arrow_back_outlined),
          ),
          const SizedBox(width: 12),
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
