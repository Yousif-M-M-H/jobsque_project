import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/features/notifications/notfifications_list.dart';
import 'package:jobsque/features/notifications/noti_upper_part.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 24),
          child: Text(
            "Messages",
            style: AppStyles.mediumFont20.copyWith(),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const NotificationUpperBar(),
              const SizedBox(height: 28),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  final notification = notifications[index];
                  return ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Icon(
                        Icons.facebook_rounded,
                        size: 40,
                      ),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          notification.companyName,
                          style: AppStyles.mediumFont16.copyWith(
                            color: const Color(0xFF111827),
                          ),
                        ),
                        Text(
                          notification.time,
                          style: AppStyles.normalFont12.copyWith(
                            color: const Color(0xFF3366FF),
                          ),
                        ),
                      ],
                    ),
                    subtitle: Text(
                      notification.companyDescription,
                      style: AppStyles.normalFont12.copyWith(
                        color: const Color(0xFF6B7280),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Divider(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
