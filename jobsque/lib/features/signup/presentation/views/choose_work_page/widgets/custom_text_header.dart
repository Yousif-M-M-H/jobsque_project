import 'package:flutter/material.dart';

class CustomTextHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final double? height;
  final Color? color;
  const CustomTextHeader(
      {super.key,
      required this.title,
      required this.subtitle,
      this.height,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      height: height ?? 68,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
          ),
          Text(
            subtitle,
            style: const TextStyle(
                fontSize: 16, color: Color.fromRGBO(107, 114, 128, 1)),
          ),
        ],
      ),
    );
  }
}
