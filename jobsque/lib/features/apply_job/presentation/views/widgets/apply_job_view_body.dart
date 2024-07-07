// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/models/home_models/apply_job_model.dart';
import 'package:jobsque/core/storage/token_storage.dart';
import 'package:jobsque/core/utils/app_router.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/features/apply_job/presentation/views/widgets/bio_data/bio_data_view_body.dart';
import 'package:jobsque/features/apply_job/presentation/views/widgets/upload_portfolio/widgets/cv_other_file_container.dart';

class ApplyJobViewBody extends StatelessWidget {
  const ApplyJobViewBody({Key? key, required this.jobId}) : super(key: key);

  final int jobId;

  @override
  Widget build(BuildContext context) {
    final TextEditingController bioDataNameController = TextEditingController();
    final TextEditingController bioDataEmailController =
        TextEditingController();
    final TextEditingController bioDataPhoneController =
        TextEditingController();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Expanded(
            child: PageView(
              children: [
                BioDataViewBody(
                  bioDataEmailController: bioDataEmailController,
                  bioDataNameController: bioDataNameController,
                  bioDataPhoneController: bioDataPhoneController,
                ),
                UploadCvAndOtherFileColumn(
                  jobId: jobId,
                  bioDataNameController: bioDataNameController,
                  bioDataEmailController: bioDataEmailController,
                  bioDataPhoneController: bioDataPhoneController,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UploadCvAndOtherFileColumn extends StatefulWidget {
  final TextEditingController bioDataNameController;
  final TextEditingController bioDataEmailController;
  final TextEditingController bioDataPhoneController;
  final int jobId;

  const UploadCvAndOtherFileColumn({
    Key? key,
    required this.jobId,
    required this.bioDataNameController,
    required this.bioDataEmailController,
    required this.bioDataPhoneController,
  }) : super(key: key);

  @override
  State<UploadCvAndOtherFileColumn> createState() =>
      _UploadCvAndOtherFileColumnState();
}

class _UploadCvAndOtherFileColumnState
    extends State<UploadCvAndOtherFileColumn> {
  String? _cvFilePath;
  String? _otherFilePath;
  String baseUrl = "https://project2.amit-learning.com/api/";
  final TokenStorage tokenStorage = TokenStorage();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          GestureDetector(
            onTap: _pickCvFile,
            child: UploadCvAndOtherFileContainer(
              title: "CV",
              filePath: _cvFilePath,
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: _pickOtherFile,
            child: UploadCvAndOtherFileContainer(
              title: "Other File",
              filePath: _otherFilePath,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _applyForJob,
            child: const Text("Apply"),
          ),
        ],
      ),
    );
  }

  Future<void> _pickCvFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        _cvFilePath = result.files.single.path;
      });
    }
  }

  Future<void> _pickOtherFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        _otherFilePath = result.files.single.path;
      });
    }
  }

  Future<void> _applyForJob() async {
    if (_cvFilePath == null || _otherFilePath == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please pick both CV and other files")),
      );
      return;
    }

    String cvFileName = _cvFilePath!.split('/').last;
    String otherFileName = _otherFilePath!.split('/').last;
    int? userId = await tokenStorage.getUserId();

    FormData formData = FormData.fromMap({
      "name": widget.bioDataNameController.text,
      "email": widget.bioDataEmailController.text,
      "mobile": widget.bioDataPhoneController.text,
      "work_type": "full",
      "jobs_id": widget.jobId.toString(),
      "user_id": userId.toString(),
      "cv_file":
          await MultipartFile.fromFile(_cvFilePath!, filename: cvFileName),
      "other_file": await MultipartFile.fromFile(_otherFilePath!,
          filename: otherFileName),
    });

    Dio dio = Dio();

    try {
      String? bearerToken = await tokenStorage.getToken();

      final response = await dio.post(
        "${baseUrl}apply",
        data: formData,
        options: Options(headers: {"Authorization": "Bearer $bearerToken"}),
      );

      if (response.statusCode == 200) {
        ApplyJob applyJobResponse = ApplyJob.fromJson(response.data);
        print("Application successful: ${applyJobResponse.data?.id}");

        // Store the applied job ID and user ID
        await tokenStorage.saveAppliedJobId(widget.jobId);
        GoRouter.of(context).go(AppRouter.ksuccessapplicationpageView);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.green,
          content: Text(
            "Application sent successfully",
            style: AppStyles.mediumFont14.copyWith(color: Colors.white),
          ),
        ));
      } else {
        print("Application failed with status code: ${response.statusCode}");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Application failed")),
        );
      }
    } catch (e) {
      print("Error during application: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error during application: $e")),
      );
    }
  }
}
