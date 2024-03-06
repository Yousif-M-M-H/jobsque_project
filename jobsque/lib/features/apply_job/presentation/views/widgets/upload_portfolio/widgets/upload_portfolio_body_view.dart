import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque/core/utils/assets.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/features/apply_job/presentation/views/widgets/upload_portfolio/widgets/cv_container_list_tile.dart';
import 'package:jobsque/features/apply_job/presentation/views/widgets/upload_portfolio/widgets/introduction_text_upload_port.dart';

class UploadPortfolioViewBody extends StatelessWidget {
  const UploadPortfolioViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const UploadCVIntroduction(),
        const SizedBox(height: 12),
        const CvContainerListTile(),
        const Text(
          "Other File",
          style: AppStyles.mediumFont16,
        ),
        const SizedBox(height: 12),
        Container(
          decoration: ShapeDecoration(
            color: const Color(0xFFEBF2FF),
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1.50, color: Color(0xFF6690FF)),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 20),
            child: Column(
              children: [
                SvgPicture.asset(Assets.imagesUploadImageIcon),
                const SizedBox(height: 16),
                const Text(
                  "Upload your other file",
                  style: AppStyles.mediumFont18,
                ),
                const SizedBox(height: 8),
                Text(
                  "Max. file size 10 MB",
                  style: AppStyles.normalFont12.copyWith(
                    color: const Color(0xFF6B7280),
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  decoration: ShapeDecoration(
                    color: const Color(0xFFD6E4FF),
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(width: 1, color: Color(0xFF3366FF)),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.upload_file),
                      const SizedBox(width: 10),
                      Text(
                        "Add file",
                        style: AppStyles.normalFont16.copyWith(
                          color: const Color(0xFF3366FF),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
