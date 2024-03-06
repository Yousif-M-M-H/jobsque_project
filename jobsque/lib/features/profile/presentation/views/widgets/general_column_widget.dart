import 'package:flutter/material.dart';
import 'package:jobsque/features/profile/presentation/views/widgets/general_list_tile_widget.dart';

class GeneralColumn extends StatelessWidget {
  const GeneralColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const GeneralListTileWidget(
          title: "Edit Profile",
          icon: Icons.account_box_outlined,
        ),
        const SizedBox(height: 7),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Divider(
            color: Colors.grey[300],
          ),
        ),
        const SizedBox(height: 7),
        const GeneralListTileWidget(
          title: "Portfolio",
          icon: Icons.file_copy,
        ),
        const SizedBox(height: 7),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Divider(
            color: Colors.grey[300],
          ),
        ),
        const SizedBox(height: 7),
        const GeneralListTileWidget(
          title: "Language",
          icon: Icons.language,
        ),
        const SizedBox(height: 7),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Divider(
            color: Colors.grey[300],
          ),
        ),
        const SizedBox(height: 7),
        const GeneralListTileWidget(
          title: "Notifications",
          icon: Icons.notifications,
        ),
        const SizedBox(height: 7),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Divider(
            color: Colors.grey[300],
          ),
        ),
        const SizedBox(height: 7),
        const GeneralListTileWidget(
          title: "Login and Security",
          icon: Icons.login,
        ),
        const SizedBox(height: 7),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Divider(
            color: Colors.grey[300],
          ),
        ),
      ],
    );
  }
}
