import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/styles.dart';

class OtherListTileWidget extends StatelessWidget {
  const OtherListTileWidget({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: AppStyles.normalFont16,
      ),
      trailing: const Icon(Icons.arrow_forward),
    );
  }
}
