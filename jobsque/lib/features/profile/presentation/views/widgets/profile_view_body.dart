// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jobsque/core/models/home_models/get_portfolio_mode.dart';
import 'package:jobsque/core/storage/token_storage.dart';
import 'package:jobsque/features/profile/presentation/views/widgets/about_row_text.dart';
import 'package:jobsque/features/profile/presentation/views/widgets/general_column_widget.dart';
import 'package:jobsque/features/profile/presentation/views/widgets/general_text_container.dart';
import 'package:jobsque/features/profile/presentation/views/widgets/information_row_widget.dart';
import 'package:jobsque/features/profile/presentation/views/widgets/name_job_column.dart';
import 'package:jobsque/features/profile/presentation/views/widgets/other_column_widget.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  final TokenStorage tokenStorage = TokenStorage();
  String? imageUrl;
  String? name;

  bool isError = false;

  @override
  void initState() {
    super.initState();
    _fetchPortfolioData();
  }

  Future<void> _fetchPortfolioData() async {
    String? bearerToken = await tokenStorage.getToken();

    final dio = Dio();
    const String url =
        'https://project2.amit-learning.com/api/user/profile/portofolios';

    try {
      final response = await dio.get(
        url,
        options: Options(headers: {'Authorization': 'Bearer $bearerToken'}),
      );

      if (response.data['data'] != null && response.data['data'] is List) {
        print(response.data);
        List<Data> portfolioItems = List<Data>.from(
            response.data['data'].map((item) => Data.fromJson(item)));

        if (portfolioItems.isNotEmpty) {
          setState(() {
            imageUrl = portfolioItems.first.image;
            name = portfolioItems.first.name;
          });
        }
      } else {
        setState(() {
          isError = true;
        });
        print("No portfolio data available");
      }
    } catch (e) {
      setState(() {
        isError = true;
      });
      print("Error fetching portfolio data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (imageUrl != null)
                CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(imageUrl!),
                  backgroundColor: Colors.transparent,
                )
              else if (isError)
                const CircleAvatar(
                  radius: 60,
                  child: Icon(Icons.error, size: 60),
                ),
              const SizedBox(height: 16),
              NameAndJobColumn(
                name: name ?? "rafif",
              ),
              const SizedBox(height: 24),
              const InformationRow(),
              const SizedBox(height: 28),
              const AboutTextRow(),
              const SizedBox(height: 36),
              const ProfileGeneralContainer(
                title: "General",
              ),
              const SizedBox(height: 16),
              const GeneralColumn(),
              const SizedBox(height: 32),
              const ProfileGeneralContainer(
                title: "Others",
              ),
              const SizedBox(height: 16),
              const OtherColumn()
            ],
          ),
        ),
      ),
    );
  }
}
