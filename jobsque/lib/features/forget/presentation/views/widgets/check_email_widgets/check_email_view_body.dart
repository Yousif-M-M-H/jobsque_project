import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque/core/utils/assets.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/features/forget/presentation/views/widgets/check_email_widgets/button_open_email.dart';

class CheckEmailViewBody extends StatelessWidget {
  const CheckEmailViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 230),
            child: SvgPicture.asset(Assets.imagesEmailIcon),
          ),
          const Text(
            "Check your Email",
            style: AppStyles.mediumFont24,
          ),
          const SizedBox(height: 12),
          const Text(
            "We have sent a reset password to your email address",
            style: AppStyles.normalFont16,
          ),
          const Expanded(child: SizedBox()),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: OpenEmailButton(),
          ),
          const SizedBox(height: 25)
        ],
      ),
    );
  }
}
