import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/utils/app_router.dart';
import 'package:jobsque/core/utils/assets.dart';
import 'package:jobsque/core/utils/styles.dart';

class SuccessApplicationView extends StatelessWidget {
  const SuccessApplicationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Padding(
          padding: EdgeInsets.only(top: 16),
          child: Text(
            "Apply Job",
            style: AppStyles.mediumFont20,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            SvgPicture.asset(Assets.imagesApplicationSuccess),
            const SizedBox(height: 24),
            const Text(
              "Your data has been",
              style: AppStyles.mediumFont24,
              textAlign: TextAlign.center, // Center align text
            ),
            const Text(
              "successfully sent",
              style: AppStyles.mediumFont24,
              textAlign: TextAlign.center, // Center align text
            ),
            const SizedBox(height: 15),
            Text(
              "You will get a message from our team, about",
              style: AppStyles.normalFont16.copyWith(
                color: const Color(0xFF6B7280),
              ),
              textAlign: TextAlign.center, // Center align text
            ),
            Text(
              "the announcement of employee acceptance",
              style: AppStyles.normalFont16.copyWith(
                color: const Color(0xFF6B7280),
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color(0xFF3366FF),
                    ),
                  ),
                  onPressed: () {
                    GoRouter.of(context).go(AppRouter.knavbarView);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 13.5),
                    child: Text(
                      "Back to Home",
                      style:
                          AppStyles.mediumFont16.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
