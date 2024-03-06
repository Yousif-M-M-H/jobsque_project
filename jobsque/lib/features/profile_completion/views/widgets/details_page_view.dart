import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final int index;

  const DetailPage({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page for Container ${index + 1}'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Complete'),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
      ),
    );
  }
}
