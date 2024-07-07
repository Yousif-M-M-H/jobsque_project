import 'package:flutter/material.dart';

class CustomStanderButton extends StatelessWidget {
  final String? text;
  final EdgeInsets? margin;
  final Color? color;
  final Color? textColor;
  final double? height;
  final double? width;
  final void Function()? onPress;
  const CustomStanderButton(
      {super.key,
      this.text,
      this.onPress,
      this.margin,
      this.color,
      this.textColor,
      this.height,
      this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height ?? 48,
        width: width ?? 1000,
        margin: margin ?? const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: color ?? const Color.fromRGBO(51, 102, 255, 1),
          borderRadius: BorderRadius.circular(100),
        ),
        child: MaterialButton(
          onPressed: onPress,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              text ?? 'text',
              style: TextStyle(color: textColor ?? Colors.white, fontSize: 16),
            ),
          ),
        ));
  }
}
