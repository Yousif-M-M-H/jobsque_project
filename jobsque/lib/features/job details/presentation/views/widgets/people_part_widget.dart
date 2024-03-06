import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque/core/utils/assets.dart';
import 'package:jobsque/core/utils/styles.dart';

class PeopleWidget extends StatelessWidget {
  const PeopleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "6 Employees For",
                  style: AppStyles.mediumFont14.copyWith(
                    color: const Color(0xFF111827),
                  ),
                ),
                Text(
                  "UI/UX Design",
                  style: AppStyles.normalFont12.copyWith(
                    color: const Color(0xFF6B7280),
                  ),
                ),
              ],
            ),
            SvgPicture.asset(Assets.imagesDropdown),
          ],
        ),
        const SizedBox(height: 24),
        ...List.generate(
            5,
            (index) => Column(
                  children: [
                    const PeopleRowContainer(),
                    if (index != 5)
                      const Column(
                        children: [
                          SizedBox(height: 12),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Divider(),
                          ),
                          SizedBox(height: 16),
                        ],
                      )
                  ],
                )),
        const PeopleRowContainer(),
      ],
    );
  }
}

class PeopleRowContainer extends StatelessWidget {
  const PeopleRowContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(Assets.imagesGuy),
            const SizedBox(width: 12),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Dimas Adi Sapitro",
                  style: AppStyles.mediumFont14.copyWith(
                    color: const Color(0xFF111827),
                  ),
                ),
                Text(
                  "Senior UI/UX Designer at Twitter",
                  style: AppStyles.normalFont12.copyWith(
                    color: const Color(0xFF6B7280),
                  ),
                ),
              ],
            )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Work during",
              style: AppStyles.normalFont12.copyWith(
                color: const Color(0xFF6B7280),
              ),
            ),
            Text(
              "5 Years",
              textAlign: TextAlign.end,
              style: AppStyles.normalFont12.copyWith(
                color: const Color(0xFF3366FF),
              ),
            ),
          ],
        )
      ],
    );
  }
}
