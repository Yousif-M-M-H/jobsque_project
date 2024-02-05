import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque/core/utils/assets.dart';
import 'package:jobsque/features/forget/presentation/views/widgets/reset_password_widgets/forget_password_view_body.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Icon(Icons.arrow_back),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: SvgPicture.asset(Assets.imagesLogo),
          )
        ],
      ),
      body: const ForgetPasswordViewBody(),
    );
  }
}
