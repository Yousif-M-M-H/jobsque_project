import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:jobsque/features/splah_screen/presentation/views/widgets/button_next_page_view.dart';
import 'package:jobsque/features/splah_screen/presentation/views/widgets/first_job_view_body.dart';
import 'package:jobsque/features/splah_screen/presentation/views/widgets/second_job_view_body.dart';
import 'package:jobsque/features/splah_screen/presentation/views/widgets/third_job_view.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const pageLength = 3;
    const currentIndexPage = 0;

    return Stack(
      children: [
        PageView(
          children: const [
            FirstScreenSplash(),
            SecondJobView(),
            ThirdJobView(),
          ],
        ),
        Positioned(
          bottom: 40.0,
          left: 0,
          right: 0,
          child: Column(
            children: [
              DotsIndicator(
                dotsCount: pageLength,
                position: currentIndexPage,
                decorator: const DotsDecorator(
                  activeColor: Color(0xff3366FF),
                  color: Color(0xffADC8FF),
                ),
              ),
              const SizedBox(height: 37),
              const PageViewNextButton(),
            ],
          ),
        ),
      ],
    );
  }
}
