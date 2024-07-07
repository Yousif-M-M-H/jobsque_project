import 'package:flutter/material.dart';
import 'package:jobsque/features/signup/presentation/views/choose_work_page/widgets/choose_work_view_body.dart';

class ChooseWorkView extends StatelessWidget {
  const ChooseWorkView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SignUpWorkTypeScreen(),
      ),
    );
  }
}
