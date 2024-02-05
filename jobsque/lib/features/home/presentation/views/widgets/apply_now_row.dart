import 'package:flutter/material.dart';
import 'package:jobsque/features/home/presentation/views/widgets/salary_rich_text_widget.dart';

class ApplyNowRow extends StatelessWidget {
  const ApplyNowRow({
    super.key,
    required this.salary,
  });

  final String salary;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SalaryRichText(
            salary: salary,
          ),
          MaterialButton(
            onPressed: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(1000.0),
            ),
            color: const Color(0xFF3366FF),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Text(
                "Apply now",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.12,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
