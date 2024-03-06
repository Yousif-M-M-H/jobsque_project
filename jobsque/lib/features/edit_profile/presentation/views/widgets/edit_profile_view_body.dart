import 'package:flutter/material.dart';
import 'package:jobsque/features/edit_profile/presentation/views/widgets/button_edit_profile.dart';
import 'package:jobsque/features/edit_profile/presentation/views/widgets/edit_profile_image_widget.dart';
import 'package:jobsque/features/edit_profile/presentation/views/widgets/text_field_edit_profile.dart';

class EditProfileViewBody extends StatelessWidget {
  const EditProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: screenHeight * 0.05),
          const EditProfileImageWidget(),
          SizedBox(height: screenHeight * 0.025),
          const EditProfileTextField(
            hintText: 'Rafif Dian Axelingga',
            title: 'Name',
          ),
          SizedBox(height: screenHeight * 0.016),
          const EditProfileTextField(
            hintText: 'Rafif Dian Axelingga',
            title: 'Bio',
          ),
          SizedBox(height: screenHeight * 0.016),
          const EditProfileTextField(
            hintText: 'Rafif Dian Axelingga',
            title: 'Address',
          ),
          SizedBox(height: screenHeight * 0.016),
          const EditProfileTextField(
            hintText: 'Rafif Dian Axelingga',
            title: 'No.Handphone',
          ),
          const Expanded(child: SizedBox()),
          const SaveButtonEditProfileWidget(),
          SizedBox(height: screenHeight * 0.016),
        ],
      ),
    );
  }
}
