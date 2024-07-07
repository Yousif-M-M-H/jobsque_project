// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
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
