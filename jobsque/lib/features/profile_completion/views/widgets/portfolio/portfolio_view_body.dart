// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:jobsque/features/profile/presentation/views/widgets/portfolio_page/add_file_container.dart';
import 'package:jobsque/features/profile_completion/views/widgets/portfolio/file_opener_container.dart';
import 'package:open_file/open_file.dart';

class PortfolioViewBody2 extends StatefulWidget {
  final String imagePath;

  const PortfolioViewBody2({Key? key, required this.imagePath})
      : super(key: key);

  @override
  _PortfolioViewBodyState createState() => _PortfolioViewBodyState();
}

class _PortfolioViewBodyState extends State<PortfolioViewBody2> {
  File? cvFile;

  Future<void> _pickCV() async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        cvFile = File(result.files.single.path!);
      });
    }
  }

  Future<bool> _submitPortfolio() async {
    const String url =
        'https://project2.amit-learning.com/api/user/profile/portofolios';
    Dio dio = Dio();

    FormData formData = FormData.fromMap({
      'cv_file': await MultipartFile.fromFile(cvFile!.path,
          filename: 'cv_file_name.docx'),
      'image': await MultipartFile.fromFile(widget.imagePath,
          filename: 'image_file_name.jpg'),
    });

    try {
      final response = await dio.post(
        url,
        data: formData,
        options: Options(
          headers: {
            'Authorization':
                'Bearer 8228|s6xgszK3YYzTjk7aUnW8pu8V4PlSxEqtcYozh2FR'
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Portfolio submitted successfully')));
        }
        return true; // Return true upon successful submission
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Failed to submit portfolio')));
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error submitting portfolio: $e')));
      }
    }
    return false; // Return false if submission failed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Portfolio")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 36),
              AddFileContainer(
                onTap: _pickCV,
              ),
              const SizedBox(height: 24),
              if (cvFile != null)
                FileOpenerContainer(onTap: () => OpenFile.open(cvFile!.path)),
              const Expanded(
                child: SizedBox(),
              ),
              ElevatedButton(
                onPressed: () async {
                  final bool success = await _submitPortfolio();
                  if (success && mounted) {
                    Navigator.pop(context, true); // Pass true back on success
                  }
                },
                child: const Text('Submit Portfolio'),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
