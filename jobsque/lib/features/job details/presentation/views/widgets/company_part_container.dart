import 'package:flutter/material.dart';
import 'package:jobsque/features/job%20details/presentation/views/widgets/about_company_widget.dart';
import 'package:jobsque/features/job%20details/presentation/views/widgets/company_row_widget.dart';

class CompanyInformationWidget extends StatelessWidget {
  const CompanyInformationWidget(
      {super.key,
      required this.companyEmail,
      required this.companyWebsite,
      required this.companyDesc});

  final String companyEmail;
  final String companyWebsite;
  final String companyDesc;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        const Text("Contact Us"),
        const SizedBox(height: 12),
        CompanyWidgetRow(
          companyEmail: companyEmail,
          companyWebsite: companyWebsite,
        ),
        const SizedBox(height: 24),
        AboutComapnyWidget(
          companyDesc: companyDesc,
        )
      ],
    );
  }
}
