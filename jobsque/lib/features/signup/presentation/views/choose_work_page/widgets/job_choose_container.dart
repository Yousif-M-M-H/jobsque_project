import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque/core/utils/assets.dart';
import 'package:jobsque/core/utils/styles.dart';

class ChooseJobWidget extends StatelessWidget {
  const ChooseJobWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      decoration: ShapeDecoration(
        color: const Color(0xFFFAFAFA),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFD1D5DB)),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            Assets.imagesGoogleContainer,
          ),
          const SizedBox(height: 16),
          Text(
            "Management",
            style: AppStyles.normalFont16.copyWith(
                fontWeight: FontWeight.bold, color: const Color(0xFF111827)),
          ),
        ],
      ),
    );
  }
}
