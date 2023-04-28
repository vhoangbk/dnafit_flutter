import 'package:flutter/material.dart';

class ButtonOutline extends StatelessWidget {
  String? text;
  Color? borderColor;
  Color? textColor;
  TextStyle? textStyle;
  double? height;
  void Function()? onPress;

  final Color textColorDefault = const Color(0xFFF36E2E);
  final Color borderColorDefault = const Color(0xFFF36E2E);
  final double heightDefault = 40;

  ButtonOutline(
      {super.key,
      this.text,
      this.borderColor,
      this.textColor,
      this.onPress,
      this.textStyle,
      this.height});

  @override
  Widget build(BuildContext context) {
    TextStyle textStyleDefault =
        TextStyle(color: textColor ?? textColorDefault);
    TextStyle textStyleCopy = textStyle != null
        ? textStyle!.copyWith(
            color: textStyle!.color ?? textColorDefault,
          )
        : textStyleDefault;

    return (TextButton(
      style:
          const ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.zero)),
      onPressed: onPress,
      child: Container(
        height: height ?? heightDefault,
        decoration: BoxDecoration(
            border: Border.all(color: borderColor ?? borderColorDefault),
            borderRadius: const BorderRadius.all(Radius.circular(5))),
        child: Center(
          child: Text(
            text ?? '',
            style: textStyleCopy,
          ),
        ),
      ),
    ));
  }
}
