import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque/core/utils/assets.dart';
import 'package:jobsque/features/notifications/text_field_messages.dart';

class NotificationUpperBar extends StatelessWidget {
  const NotificationUpperBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: SearchTextfieldNotifications()),
        const SizedBox(width: 12),
        SvgPicture.asset(Assets.imagesFilternoti)
      ],
    );
  }
}
