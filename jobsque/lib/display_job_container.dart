import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobsque/core/utils/assets.dart';
import 'package:jobsque/core/utils/styles.dart';

class DisplayJobContainer extends StatelessWidget {
  const DisplayJobContainer({
    Key? key,
    required this.jobName,
    required this.salary,
    required this.jobType,
    this.onIconTap,
  }) : super(key: key);

  final String jobName;
  final String salary;
  final String jobType;
  final void Function()? onIconTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: 18,
                top: 10,
              ),
              decoration: ShapeDecoration(
                color: const Color(0xFF091A7A),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ListTile(
                      leading: SvgPicture.asset(Assets.imagesZoom),
                      title: Text(
                        jobName,
                        style: AppStyles.mediumFont18.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      subtitle: Text(
                        "Zoom • United States",
                        style: AppStyles.normalFont12.copyWith(
                          color: const Color(0xFF9CA3AF),
                        ),
                      ),
                      trailing: GestureDetector(
                        onTap: onIconTap,
                        child: SvgPicture.asset(Assets.imagesSaveIcon),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SuggestedJobContainerChip(
                        title: jobType,
                      ),
                      const SizedBox(width: 8),
                      const SuggestedJobContainerChip(
                        title: "Onsite",
                      ),
                      const SizedBox(width: 8),
                      const SuggestedJobContainerChip(
                        title: "Senior",
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: salary,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'SF Pro Display',
                                fontWeight: FontWeight.w500,
                                height: 0.06,
                                letterSpacing: 0.20,
                              ),
                            ),
                            TextSpan(
                              text: '/Month',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 12,
                                fontFamily: 'SF Pro Display',
                                fontWeight: FontWeight.w500,
                                height: 0.12,
                                letterSpacing: 0.12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        decoration: ShapeDecoration(
                          color: const Color(0xFF3366FF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1000),
                          ),
                        ),
                        child: Text(
                          "Apply now",
                          style: AppStyles.mediumFont14.copyWith(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SuggestedJobContainerChip extends StatelessWidget {
  const SuggestedJobContainerChip({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Chip(
      side: BorderSide.none,
      labelStyle: AppStyles.normalFont12.copyWith(
        color: Colors.white.withOpacity(0.14000000059604645),
      ),
      backgroundColor: const Color(0XFF2C3A8D),
      label: Text(
        title,
        style: AppStyles.normalFont12.copyWith(color: Colors.white),
      ),
    );
  }
}
