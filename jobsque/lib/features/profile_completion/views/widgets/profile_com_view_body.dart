import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jobsque/core/storage/token_storage.dart';
import 'package:jobsque/features/profile_completion/views/widgets/completion_text.dart';
import 'package:jobsque/features/profile_completion/views/widgets/education/education_view_body.dart';
import 'package:jobsque/features/profile_completion/views/widgets/experince/experince_view_body.dart';
import 'package:jobsque/features/profile_completion/views/widgets/percent_indicator.dart';
import 'package:jobsque/features/profile_completion/views/widgets/personal_details/personal_details_view_body.dart';
import 'package:jobsque/features/profile_completion/views/widgets/portfolio/portfolio_view_body.dart';
import 'package:jobsque/features/profile_completion/views/widgets/profile_completion_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileCompletionViewBody extends StatefulWidget {
  final VoidCallback? onProfileCompleted;

  const ProfileCompletionViewBody({Key? key, this.onProfileCompleted})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProfileCompletionViewBodyState createState() =>
      _ProfileCompletionViewBodyState();
}

class _ProfileCompletionViewBodyState extends State<ProfileCompletionViewBody> {
  List<bool> completionStatus = [false, false, false, false];
  Map<String, String> personalDetails = {};
  final TokenStorage tokenStorage = TokenStorage();

  @override
  void initState() {
    super.initState();
    loadCompletionStatus();
  }

  Future<void> loadCompletionStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final userId = await tokenStorage
        .getUserId(); // Assuming this method exists and is async
    final String completionStatusString =
        prefs.getString('completionStatus_$userId') ?? '[]';
    final List<bool> loadedStatus =
        List<bool>.from(json.decode(completionStatusString));

    if (loadedStatus.length != completionStatus.length) {
      loadedStatus.addAll(
          List.filled(completionStatus.length - loadedStatus.length, false));
    }

    setState(() {
      completionStatus = loadedStatus;
    });
  }

  Future<void> updateCompletionStatus(int index, bool status) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final userId = await tokenStorage.getUserId();
    completionStatus[index] = status;
    await prefs.setString(
        'completionStatus_$userId', json.encode(completionStatus));

    if (!completionStatus.contains(false)) {
      widget.onProfileCompleted?.call(); // Call the callback here
    }

    setState(() {});
  }

  int get completedCount => completionStatus.where((status) => status).length;
  double get completionPercent => completedCount / completionStatus.length;

  void navigateToPersonalDetails() async {
    final result = await Navigator.push<Map<String, String>>(
      context,
      MaterialPageRoute(
          builder: (context) => const PersonalDetailsViewBody(index: 0)),
    );

    if (result != null) {
      setState(() {
        personalDetails = result;
        completionStatus[0] = true;
      });
      updateCompletionStatus(0, true); // Update and save completion status
    }
  }

  void navigateToEducation() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            EducationViewBody(personalDetails: personalDetails),
      ),
    );

    if (result == true) {
      setState(() {
        completionStatus[1] = true;
      });
      updateCompletionStatus(1, true); // Update and save completion status
    }
  }

  void navigateToExperience() async {
    // ignore: unused_local_variable
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ExperienceViewBody(
          onUpdate: (isUpdated) {
            if (isUpdated) {
              setState(() {
                completionStatus[2] = true;
              });
              updateCompletionStatus(
                  2, true); // Update and save completion status
            }
          },
        ),
      ),
    );
  }

  void navigateToPortfolio() async {
    final bool result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            PortfolioViewBody2(imagePath: personalDetails['imagePath'] ?? ''),
      ),
    );

    if (result) {
      // Check if the result is true
      setState(() {
        completionStatus[3] = true;
      });
      updateCompletionStatus(3, true); // Update and save completion status
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Complete Profile")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              PercentIndicator(completionPercent: completionPercent),
              CompletionText(
                  completedCount: completedCount,
                  completionStatus: completionStatus),
              ProfileCompletionContainer(
                containerTitle: "Personal Details",
                containerDescription1:
                    "Full name, email, phone number, and your",
                containerDescription2: "address",
                onTap: navigateToPersonalDetails,
                isCompleted: completionStatus[0],
              ),
              const SizedBox(height: 10),
              ProfileCompletionContainer(
                containerTitle: "Education",
                containerDescription1: "Enter your education history to be",
                containerDescription2: "considered by the recruiters",
                onTap: navigateToEducation,
                isCompleted: completionStatus[1],
              ),
              const SizedBox(height: 10),
              ProfileCompletionContainer(
                containerTitle: "Experience",
                containerDescription1:
                    "Enter your work experience to be considered",
                containerDescription2: "by the recruiter",
                onTap: navigateToExperience,
                isCompleted: completionStatus[2],
              ),
              const SizedBox(height: 10),
              ProfileCompletionContainer(
                containerTitle: "Portfolio",
                containerDescription1:
                    "Create your portfolio. Applying for various",
                containerDescription2: "types of jobs is easier",
                onTap: navigateToPortfolio,
                isCompleted: completionStatus[3],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
