import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/utils/app_router.dart';
import 'package:jobsque/core/utils/styles.dart';

class SeachTextfieldHome extends StatelessWidget {
  const SeachTextfieldHome({super.key, this.passwordController});
  final TextEditingController? passwordController;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(AppRouter.ksearchView);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0xFFD1D5DB)),
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.search,
              color: Color(0xFF9CA3AF),
            ),
            const SizedBox(width: 14),
            Text(
              "Search",
              style: AppStyles.normalFont16.copyWith(
                color: const Color(0xFF9CA3AF),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
