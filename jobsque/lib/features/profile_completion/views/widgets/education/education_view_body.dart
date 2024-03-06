// ignore_for_file: use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jobsque/core/storage/token_storage.dart';
import 'package:jobsque/features/apply_job/presentation/views/widgets/bio_data/text_field_bio_data.dart';
import 'package:jobsque/features/profile_completion/views/widgets/education/education_save_button.dart';

class EducationViewBody extends StatefulWidget {
  final Map<String, String> personalDetails;

  const EducationViewBody({Key? key, required this.personalDetails})
      : super(key: key);

  @override
  State<EducationViewBody> createState() => _EducationViewBodyState();
}

class _EducationViewBodyState extends State<EducationViewBody> {
  TextEditingController universityController = TextEditingController();
  final Dio _dio = Dio();
  final TokenStorage tokenStorage = TokenStorage();

  Future<void> submitEducationDetails() async {
    const String url =
        'https://project2.amit-learning.com/api/user/profile/portofolios';
    try {
      String? bearerToken = await tokenStorage.getToken();

      final response = await _dio.put(
        url,
        data: {
          'bio': widget.personalDetails['bio'],
          'address': widget.personalDetails['address'],
          'mobile': widget.personalDetails['phone'],
          'education': universityController.text,
          'language': 'En',
          'interested_work': 'Programming',
          'offline_place': 'nowhere',
          'experience': '3 years',
          'personal_detailed': 'nothing goes here',
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $bearerToken',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (kDebugMode) {
          print('Success data: ${response.data}');
        }
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Education details submitted successfully'),
          ),
        );
        Navigator.pop(context, true); // Indicating success
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                  'Failed to submit education details. Status code: ${response.statusCode}')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error submitting education details: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Education Details'),
      ),
      body: SingleChildScrollView(
        // Make the page scrollable
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            BioDataTextField(
              title: "University*",
              hintText: 'Northern Michigan University',
              controller: universityController,
            ),
            const SizedBox(height: 16),
            const BioDataTextField(
              title: "Title",
              hintText: 'Bachelor',
            ),
            const SizedBox(height: 16),
            const BioDataTextField(
              title: "Start Year*",
              hintText: 'December 2019',
            ),
            const SizedBox(height: 16),
            const BioDataTextField(
              title: "End Year",
              hintText: 'December 2022',
            ),
            const SizedBox(height: 32),
            EducationButton(
              onPressed: submitEducationDetails,
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
