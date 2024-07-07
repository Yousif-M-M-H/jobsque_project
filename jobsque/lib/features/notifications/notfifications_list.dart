// Correctly defining the NotificationData class
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

// List of notifications with the defined NotificationData class
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
