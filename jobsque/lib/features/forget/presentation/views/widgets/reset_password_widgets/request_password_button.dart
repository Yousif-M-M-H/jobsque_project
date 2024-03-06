import 'package:flutter/material.dart';

import 'package:jobsque/core/utils/styles.dart';

class RequestPasswordLogin extends StatelessWidget {
  const RequestPasswordLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: MaterialButton(
        onPressed: () {},
        color: const Color(0xFF3366FF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1000),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Text(
            "Request password reset",
            style: AppStyles.mediumFont16.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
