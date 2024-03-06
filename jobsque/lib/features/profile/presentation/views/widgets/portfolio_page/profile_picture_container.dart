// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:jobsque/core/models/home_models/get_portfolio_mode.dart';
import 'package:jobsque/core/storage/token_storage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TokenStorage tokenStorage = TokenStorage();

  String? imageUrl;

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
      final portfolioModel = GetPortfolioModel.fromJson(response.data);
      if (portfolioModel.data?.portfolio != null &&
          portfolioModel.data!.portfolio!.isNotEmpty) {
        setState(() {
          imageUrl = portfolioModel.data!.portfolio!.first.image;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: imageUrl == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ProfilePictureContainer(
              imageUrl: imageUrl!,
            ),
    );
  }
}

class ProfilePictureContainer extends StatelessWidget {
  final String? imageUrl;

  const ProfilePictureContainer({
    Key? key,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 57),
      child: CircleAvatar(
        radius: 60, // Adjust the size to fit your design
        backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
