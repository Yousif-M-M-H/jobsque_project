import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque/core/utils/assets.dart';
import 'package:jobsque/features/home/presentation/views/widgets/recent_job_salary.dart';

class RecentJobWidget extends StatelessWidget {
  const RecentJobWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: SvgPicture.asset(
            Assets.imagesZoom,
            height: 60,
            width: 60,
          ),
          title: const Text("Senior UI desingner"),
          subtitle: const Text("twitter hello"),
          trailing: SvgPicture.asset(
            Assets.imagesSaveIcon,
            color: Colors.red,
          ),
        ),
        const SizedBox(height: 16),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Chip(
                    backgroundColor: Color(0xffD6E4FF),
                    label: Text("ahmed"),
                  ),
                  SizedBox(width: 8),
                  Chip(
                    backgroundColor: Color(0xffD6E4FF),
                    label: Text("Hello"),
                  ),
                ],
              ),
              RecentJobSalary(),
            ],
          ),
        ),
      ],
    );
  }
}
