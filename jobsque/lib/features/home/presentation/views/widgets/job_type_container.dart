import 'package:flutter/material.dart';

class JobTypeContainer extends StatelessWidget {
  const JobTypeContainer({
    super.key,
    required this.jobType,
  });

  final String jobType;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 6),
      decoration: ShapeDecoration(
        color: Colors.white.withOpacity(0.14000000059604645),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 6),
        child: Text(
          jobType,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w400,
            height: 0.12,
            letterSpacing: 0.12,
          ),
        ),
      ),
    );
  }
}
