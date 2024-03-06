import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/features/notifications/noti_upper_part.dart';

// Data model class for notifications
class NotificationData {
  final String companyName;
  final String companyDescription;
  final String time;

  NotificationData({
    required this.companyName,
    required this.companyDescription,
    required this.time,
  });
}

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
        child: Column(
          children: [
            const NotificationUpperBar(),
            const SizedBox(height: 28),
            ...notifications.map((notification) {
              return Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Container(
                        color: Colors.black,
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
                  ),
                ],
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}

// List of notification data
final List<NotificationData> notifications = [
  NotificationData(
    companyName: "Twitter",
    companyDescription: "Here is the link: http://zoom.com/abcdeefg",
    time: "12:39",
  ),
  NotificationData(
    companyName: "Gojek Indonesia",
    companyDescription: "Let's keep in touch",
    time: "12:39",
  ),
  NotificationData(
    companyName: "Shopee",
    companyDescription: "Thank you David!",
    time: "9:45",
  ),
  NotificationData(
    companyName: "Dana",
    companyDescription: "Thank you for your attention!",
    time: "Yesterday",
  ),
  NotificationData(
    companyName: "Slack",
    companyDescription: "You: I look forward to hearing from you",
    time: "12/8",
  ),
  NotificationData(
    companyName: "Facebook",
    companyDescription: "You: What about the interview stage?",
    time: "12/8",
  ),
];
