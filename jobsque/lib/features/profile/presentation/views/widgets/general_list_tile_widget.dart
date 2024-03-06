import 'package:flutter/material.dart';
import 'package:jobsque/features/profile/presentation/views/widgets/circle_avatar_icon.dart';
import 'package:jobsque/features/profile/presentation/views/widgets/list_tile_title.dart';

class GeneralListTileWidget extends StatelessWidget {
  const GeneralListTileWidget({
    super.key,
    required this.title,
    this.icon,
  });
  final String title;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatarIcon(
        icon: icon,
      ),
      title: GeneralListTileTitleWidget(
        title: title,
      ),
      trailing: const Icon(Icons.arrow_forward),
    );
  }
}
