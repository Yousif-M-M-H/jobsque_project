import 'package:flutter/material.dart';

import 'package:jobsque/features/profile/presentation/views/widgets/about_row_text.dart';
import 'package:jobsque/features/profile/presentation/views/widgets/general_column_widget.dart';
import 'package:jobsque/features/profile/presentation/views/widgets/general_text_container.dart';
import 'package:jobsque/features/profile/presentation/views/widgets/information_row_widget.dart';
import 'package:jobsque/features/profile/presentation/views/widgets/name_job_column.dart';
import 'package:jobsque/features/profile/presentation/views/widgets/other_column_widget.dart';
import 'package:jobsque/features/profile/presentation/views/widgets/portfolio_page/profile_picture_container.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ProfilePictureContainer(),
            SizedBox(height: 16),
            NameAndJobColumn(),
            SizedBox(height: 24),
            InformationRow(),
            SizedBox(height: 28),
            AboutTextRow(),
            SizedBox(height: 36),
            ProfileGeneralContainer(
              title: "General",
            ),
            SizedBox(height: 16),
            GeneralColumn(),
            SizedBox(height: 32),
            ProfileGeneralContainer(
              title: "Others",
            ),
            SizedBox(height: 16),
            OtherColumn()
          ],
        ),
      ),
    );
  }
}
