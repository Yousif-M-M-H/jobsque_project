import 'package:flutter/material.dart';

class PageViewNextButton extends StatelessWidget {
  const PageViewNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF3366FF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 13.5),
            child: Text(
              'Next',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
