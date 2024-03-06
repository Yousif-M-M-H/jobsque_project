import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart'; // For date formatting
import 'package:jobsque/core/models/home_models/exp_model.dart';
import 'package:jobsque/core/storage/token_storage.dart';
import 'package:jobsque/features/apply_job/presentation/views/widgets/bio_data/text_field_bio_data.dart';
import 'package:jobsque/features/profile_completion/views/widgets/education/education_save_button.dart';

class ExperienceViewBody extends StatefulWidget {
  final Function(bool) onUpdate; // Callback to notify about the update

  const ExperienceViewBody({Key? key, required this.onUpdate})
      : super(key: key);

  @override
  _ExperienceViewBodyState createState() => _ExperienceViewBodyState();
}

class _ExperienceViewBodyState extends State<ExperienceViewBody> {
  final TextEditingController _positionController = TextEditingController();
  final TextEditingController _typeOfWorkController = TextEditingController();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  String? _startYear;
  final Dio _dio = Dio();
  final TokenStorage tokenStorage = TokenStorage();

  Future<void> _selectStartYear(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _startYear = DateFormat('yyyy').format(picked);
      });
    }
  }

  Future<bool> _saveExperience() async {
    int? userId = await tokenStorage.getUserId();

    const String url = 'https://project2.amit-learning.com/api/experince';
    ExperienceData data = ExperienceData(
      userId: userId.toString(),
      postion: _positionController.text,
      typeWork: _typeOfWorkController.text,
      compName: _companyNameController.text,
      location: _locationController.text,
      start: _startYear,
    );

    try {
      String? bearerToken = await tokenStorage.getToken();

      final response = await _dio.post(
        url,
        data: data
            .toJson(), // Make sure your ExperienceData model has a toJson() method
        options: Options(
          headers: {
            'Authorization': 'Bearer $bearerToken',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Experience saved successfully')));
        return true; // Indicate success
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to save experience')));
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error: $e')));
    }
    return false; // Indicate failure
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Experience'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                width: 1,
                color: Color(0xFFD1D5DB),
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Column(
            children: [
              BioDataTextField(
                hintText: 'Product Designer',
                title: "Position*",
                controller: _positionController,
              ),
              const SizedBox(height: 16),
              BioDataTextField(
                hintText: 'Full time',
                title: "Type of work*",
                controller: _typeOfWorkController,
              ),
              const SizedBox(height: 16),
              BioDataTextField(
                hintText: 'Supfast Studio',
                title: "Company name*",
                controller: _companyNameController,
              ),
              const SizedBox(height: 16),
              BioDataTextField(
                hintText: 'Purwokerto, Banyumas',
                title: "Location",
                controller: _locationController,
              ),
              const SizedBox(height: 16),
              // Assuming CustomDatePicker allows date selection and conversion
              GestureDetector(
                onTap: () => _selectStartYear(context),
                child: AbsorbPointer(
                  child: BioDataTextField(
                    hintText: 'Select start year',
                    title: "Start Year",
                    controller: TextEditingController(text: _startYear),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              EducationButton(
                onPressed: () async {
                  bool success = await _saveExperience();
                  if (success) {
                    widget.onUpdate(true); // Notify about the update
                    // ignore: use_build_context_synchronously
                    Navigator.pop(
                        context); // Optionally pop the context if needed
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
