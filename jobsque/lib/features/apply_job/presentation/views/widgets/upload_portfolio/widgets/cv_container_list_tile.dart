import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque/core/utils/assets.dart';
import 'package:jobsque/core/utils/styles.dart';

class CvContainerListTile extends StatelessWidget {
  const CvContainerListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
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
              SvgPicture.asset(Assets.imagesZoom),
              const SizedBox(width: 8),
              const Column(
                children: [
                  Text(
                    "Rafif Dian.cv",
                    style: AppStyles.mediumFont14,
                  ),
                  SizedBox(height: 4),
                  Text("CV.pdf 300KB")
                ],
              )
            ],
          ),
          const Row(
            children: [
              Icon(Icons.edit),
              SizedBox(height: 8),
              Icon(Icons.cancel),
            ],
          )
        ],
      ),
    );
  }
}
