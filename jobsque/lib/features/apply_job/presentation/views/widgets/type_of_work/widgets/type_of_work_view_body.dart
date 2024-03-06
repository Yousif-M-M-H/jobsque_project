import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jobsque/core/utils/styles.dart';

class TypeOfWorkViewBody extends StatelessWidget {
  const TypeOfWorkViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          "Type of Work",
          style: AppStyles.mediumFont20,
        ),
        Text(
          "Fill in your bio data correctly",
          style: AppStyles.normalFont14.copyWith(
            color: const Color(0xFF6B7280),
          ),
        ),
        const SizedBox(height: 28),
        const TypeOfWorkListTile(),
      ],
    );
  }
}

class TypeOfWorkListTile extends StatelessWidget {
  const TypeOfWorkListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.grey),
      ),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Senior UX Designer",
                    style: AppStyles.mediumFont16.copyWith(
                      color: const Color(0xFF111827),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        "CV.pdf",
                        style: AppStyles.mediumFont14.copyWith(
                          color: const Color(0xFF6B7280),
                        ),
                      ),
                      const Text(' • '),
                      Text(
                        "Portfolio.pdf",
                        style: AppStyles.mediumFont14.copyWith(
                          color: const Color(0xFF6B7280),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Radio(
                value: true,
                groupValue: "groupValue",
                onChanged: (index) {},
              )
            ],
          )),
    );
  }
}
