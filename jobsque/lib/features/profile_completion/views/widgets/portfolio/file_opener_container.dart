import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque/core/utils/assets.dart';
import 'package:jobsque/core/utils/styles.dart';

class FileOpenerContainer extends StatelessWidget {
  const FileOpenerContainer({
    super.key,
    this.onTap,
  });
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 17),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0xFFD1D5DB)),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(Assets.imagesPdfProblem),
                const SizedBox(width: 14),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "UI/UX Designer",
                      style: AppStyles.mediumFont18,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "CV.pdf 300KB",
                      style: AppStyles.normalFont12.copyWith(
                        color: const Color(0xFF6B7280),
                      ),
                    )
                  ],
                )
              ],
            ),
            const Row(
              children: [
                Icon(
                  Icons.edit,
                  color: Colors.blue,
                  size: 28,
                ),
                SizedBox(width: 10),
                Icon(
                  Icons.cancel_outlined,
                  color: Colors.red,
                  size: 28,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
