import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque/core/utils/assets.dart';
import 'package:jobsque/core/utils/styles.dart';

class AddFileContainer extends StatelessWidget {
  const AddFileContainer({
    super.key,
    this.onTap,
  });

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Add portfolio here",
          style: AppStyles.mediumFont20,
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          decoration: ShapeDecoration(
            color: const Color(0xFFEBF2FF),
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1.50, color: Color(0xFF3366FF)),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              SvgPicture.asset(Assets.imagesUploadImageIcon),
              const SizedBox(height: 16),
              const Text(
                "Upload your other file",
                style: AppStyles.mediumFont20,
              ),
              const SizedBox(height: 8),
              Text(
                "Max. file size 10 MB",
                style: AppStyles.normalFont12.copyWith(
                  color: const Color(0xFF6B7280),
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: InkWell(
                  onTap: onTap,
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFD6E4FF),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          width: 1,
                          color: Color(0xFF3366FF),
                        ),
                        borderRadius: BorderRadius.circular(1000),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.upload_file_outlined,
                          color: Color(0xFF3366FF),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "Add File",
                          style: AppStyles.mediumFont14.copyWith(
                            color: const Color(0xFF3366FF),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
