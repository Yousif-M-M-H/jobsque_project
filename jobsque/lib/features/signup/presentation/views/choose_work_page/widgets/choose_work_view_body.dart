import 'package:flutter/material.dart';

class FlagSelector extends StatelessWidget {
  const FlagSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> flags = [
      const FlagWidget(countryCode: 'US'),
      const FlagWidget(countryCode: 'US'),
      const FlagWidget(countryCode: 'US'),
      const FlagWidget(countryCode: 'US'),
      const FlagWidget(countryCode: 'US'),
      const FlagWidget(countryCode: 'US'),
      const FlagWidget(countryCode: 'US'),
      const FlagWidget(countryCode: 'US'),
      const FlagWidget(countryCode: 'US'),
      const FlagWidget(countryCode: 'US'),
      const FlagWidget(countryCode: 'US'),
      const FlagWidget(countryCode: 'US'),
      const FlagWidget(countryCode: 'MY'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flag Selector'),
      ),
      body: SingleChildScrollView(
        child: Wrap(
          spacing: 8.0,
          runSpacing: 4.0,
          children: _buildFlagRows(flags),
        ),
      ),
    );
  }

  List<Widget> _buildFlagRows(List<Widget> flags) {
    List<Widget> rows = [];
    int count = 0;
    List<Widget> rowChildren = [];
    for (var flag in flags) {
      rowChildren.add(flag);
      count++;
      if (count == 2 || count == 3) {
        rows.add(Row(
          children: rowChildren,
        ));
        rowChildren = [];
        count = 0;
      }
    }
    if (rowChildren.isNotEmpty) {
      rows.add(Row(
        children: rowChildren,
      ));
    }
    return rows;
  }
}

class FlagWidget extends StatelessWidget {
  final String countryCode;

  const FlagWidget({Key? key, required this.countryCode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: const CircleAvatar(
        backgroundImage: NetworkImage(
            "https://freepngdesign.com/content/uploads/images/united-states-rounded-flag-4280.png"),
      ),
      label: Text(countryCode),
      onDeleted: () {},
    );
  }
}
