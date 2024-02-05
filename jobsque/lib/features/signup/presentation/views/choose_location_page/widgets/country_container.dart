import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/styles.dart';

class CountryContainer extends StatelessWidget {
  const CountryContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: const Color(0xFFFAFAFA),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFE5E7EB)),
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      child: IntrinsicWidth(
        child: Row(
          children: [
            Container(
              width: 26,
              height: 26,
              decoration: const ShapeDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://via.placeholder.com/26x26"),
                  fit: BoxFit.fill,
                ),
                shape: OvalBorder(),
              ),
            ),
            const SizedBox(width: 8),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 14),
              child: Text(
                "United States",
                style: AppStyles.normalFont16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
