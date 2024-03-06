import 'package:flutter/material.dart';
import 'package:jobsque/features/profile/presentation/views/widgets/other_list_tile_widget.dart';

class OtherColumn extends StatelessWidget {
  const OtherColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const OtherListTileWidget(
          title: "Accesibility",
        ),
        const SizedBox(height: 7),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Divider(
            color: Colors.grey[300],
          ),
        ),
        const SizedBox(height: 7),
        const OtherListTileWidget(
          title: "Help Center",
        ),
        const SizedBox(height: 7),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Divider(
            color: Colors.grey[300],
          ),
        ),
        const SizedBox(height: 7),
        const OtherListTileWidget(
          title: "Term & Conditions",
        ),
        const SizedBox(height: 7),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Divider(
            color: Colors.grey[300],
          ),
        ),
        const SizedBox(height: 7),
        const OtherListTileWidget(
          title: "Privacy Policy",
        ),
      ],
    );
  }
}
