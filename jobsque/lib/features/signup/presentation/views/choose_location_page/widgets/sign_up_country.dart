import 'package:flutter/material.dart';

class SignUpCountryBox extends StatelessWidget {
  final bool acticve;
  final String countryName;
  final Widget flag;
  final void Function()? onTap;
  const SignUpCountryBox(
      {super.key,
      required this.acticve,
      required this.countryName,
      required this.flag,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: FittedBox(
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: acticve
                ? const Color.fromRGBO(214, 228, 255, 1)
                : const Color.fromRGBO(229, 231, 235, 1),
            border: Border.all(
                color: acticve
                    ? const Color.fromRGBO(51, 102, 255, 1)
                    : const Color.fromRGBO(229, 231, 235, 1)),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Row(
            children: [
              Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(26)),
                  child: flag),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(countryName),
              )
            ],
          ),
        ),
      ),
    );
  }
}
