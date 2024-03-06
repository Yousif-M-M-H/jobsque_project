import 'package:flutter/material.dart';
import 'package:jobsque/features/job%20details/presentation/views/widgets/company_email.dart';
import 'package:jobsque/features/job%20details/presentation/views/widgets/company_email_n_website_widget.dart';

class CompanyWidgetRow extends StatelessWidget {
  const CompanyWidgetRow({
    super.key,
    required this.companyEmail,
    required this.companyWebsite,
  });

  final String companyEmail;
  final String companyWebsite;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CompanyEmailAndPasswordContainer(
          companyEmail: companyEmail,
        ),
        CompanyWebsiteContainer(
          companyWebsite: companyWebsite,
        ),
      ],
    );
  }
}
