import 'package:flutter/material.dart';

class SignUpWorkTypeBox extends StatelessWidget {
  final Widget icon;
  final String title;
  final void Function()? onTap;
  final bool active;
  const SignUpWorkTypeBox(
      {super.key,
      required this.icon,
      required this.title,
      required this.onTap,
      required this.active});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: active
              ? const Color.fromRGBO(214, 228, 255, 1)
              : const Color.fromRGBO(250, 250, 250, 1),
          border: Border.all(
              color: active
                  ? const Color.fromRGBO(51, 102, 255, 1)
                  : const Color.fromRGBO(214, 228, 255, 1)),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: active
                        ? const Color.fromRGBO(51, 102, 255, 1)
                        : const Color.fromRGBO(209, 213, 219, 1)),
                borderRadius: BorderRadius.circular(1000),
              ),
              child: Container(
                child: icon,
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    title,
                    style: const TextStyle(fontSize: 16),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
