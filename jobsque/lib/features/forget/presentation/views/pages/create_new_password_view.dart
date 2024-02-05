import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque/core/utils/assets.dart';
import 'package:jobsque/features/forget/presentation/views/widgets/create_new_password_widgets/create_new_password_view_body.dart';

class CreateNewPasswordView extends StatelessWidget {
  const CreateNewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SvgPicture.asset(Assets.imagesLogo),
          ),
        ],
      ),
      body: const CreateNewPasswordViewBody(),
    );
  }
}
