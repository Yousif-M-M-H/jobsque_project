import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/styles.dart';

class CompanyWebsiteContainer extends StatelessWidget {
  const CompanyWebsiteContainer({
    super.key,
    required this.companyWebsite,
  });

  final String companyWebsite;

  @override
  Widget build(BuildContext context) {
    // Function to check if the URL needs to be split and to do so
    String formatWebsite(String url) {
      final int splitLength = 20; // Example split length, adjust as needed
      if (url.length > splitLength) {
        final int lastDotIndex = url.lastIndexOf('.');
        if (lastDotIndex != -1 && lastDotIndex > splitLength) {
          // Insert a newline character before the last dot
          return url.substring(0, lastDotIndex) +
              '\n' +
              url.substring(lastDotIndex);
        }
      }
      return url; // Return the original URL if no modifications are needed
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFE5E7EB)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Website",
            style: AppStyles.normalFont12.copyWith(
              color: const Color(0xFF9CA3AF),
            ),
          ),
          const SizedBox(height: 2),
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Text(
              formatWebsite(companyWebsite),
              style: AppStyles.mediumFont14
                  .copyWith(color: const Color(0xFF111827)),
              overflow: TextOverflow.visible,
            ),
          ),
        ],
      ),
    );
  }
}
