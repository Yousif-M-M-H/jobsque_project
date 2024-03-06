import 'package:flutter/material.dart';
import 'package:jobsque/features/apply_job/presentation/views/widgets/bio_data/bio_intro_widget.dart';
import 'package:jobsque/features/apply_job/presentation/views/widgets/bio_data/button_bio_data.dart';
import 'package:jobsque/features/apply_job/presentation/views/widgets/bio_data/text_field_bio_data.dart';

class BioDataViewBody extends StatelessWidget {
  const BioDataViewBody(
      {super.key,
      this.bioDataNameController,
      this.bioDataEmailController,
      this.bioDataPhoneController});

  final TextEditingController? bioDataNameController;
  final TextEditingController? bioDataEmailController;
  final TextEditingController? bioDataPhoneController;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const BioDataIntroText(),
        SizedBox(height: screenHeight * 0.025),
        BioDataTextField(
          controller: bioDataNameController,
          hintText: 'Rafif Dian Axelingga',
          title: 'Name',
        ),
        SizedBox(height: screenHeight * 0.016),
        BioDataTextField(
          controller: bioDataEmailController,
          hintText: 'Rafif Dian Axelingga',
          title: 'email',
        ),
        SizedBox(height: screenHeight * 0.016),
        BioDataTextField(
          controller: bioDataPhoneController,
          hintText: 'Rafif Dian Axelingga',
          title: 'No.Handphone',
        ),
        const Expanded(child: SizedBox()),
        const SaveButtonApplyJob(),
        SizedBox(height: screenHeight * 0.016),
      ],
    );
  }
}
