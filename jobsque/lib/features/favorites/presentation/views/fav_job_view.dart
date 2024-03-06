import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/features/favorites/presentation/views/widgets/fav_job_view_body.dart';

class FavJobView extends StatelessWidget {
  const FavJobView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Padding(
          padding: EdgeInsets.only(top: 25),
          child: Text(
            "Saved",
            style: AppStyles.mediumFont20,
          ),
        ),
      ),
      body: FavJobViewBody(),
    );
  }
}
