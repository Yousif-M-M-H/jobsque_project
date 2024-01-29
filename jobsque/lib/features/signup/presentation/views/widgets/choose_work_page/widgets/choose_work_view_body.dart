import 'package:flutter/material.dart';
import 'package:jobsque/features/signup/presentation/views/widgets/choose_work_page/widgets/introduction_widget.dart';
import 'package:jobsque/features/signup/presentation/views/widgets/choose_work_page/widgets/job_choose_container.dart';

class ChooseWorkViewBody extends StatelessWidget {
  const ChooseWorkViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.05,
        vertical: screenHeight * 0.05,
      ),
      child: Column(
        children: [
          const IntroductionWidget(),
          SizedBox(height: screenHeight * 0.05),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15.0,
              mainAxisSpacing: 20.0,
            ),
            itemCount: 6,
            itemBuilder: (BuildContext context, int index) {
              return const ChooseJobWidget();
            },
          ),
          const SizedBox(height: 40),
          Center(
            child: ElevatedButton(onPressed: () {}, child: const Text("Login")),
          )
        ],
      ),
    );
  }
}
