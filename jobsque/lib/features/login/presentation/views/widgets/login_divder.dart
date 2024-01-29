import 'package:flutter/material.dart';
import 'package:jobsque/core/utils/styles.dart';

class LoginRowDivderWidget extends StatelessWidget {
  const LoginRowDivderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          const Expanded(
            child: Divider(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              "Or Login With Account",
              style: AppStyles.normalFont16.copyWith(fontSize: 14),
            ),
          ),
          const Expanded(child: Divider())
        ],
      ),
    );
  }
}
