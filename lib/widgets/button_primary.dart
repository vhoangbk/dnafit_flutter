import 'package:flutter/material.dart';

class ButtonPrimary extends StatelessWidget {
  String? text;
  Color? backgroundColor;
  Color? textColor;
  TextStyle? textStyle;
  double? height;
  void Function()? onPress;

  final Color textColorDefault = Colors.white;
  final Color backgroundColorDefault = const Color(0xFFF36E2E);
  final double heightDefault = 40;

  ButtonPrimary(
      {super.key,
      this.text,
      this.backgroundColor,
      this.textColor,
      this.onPress,
      this.textStyle,
      this.height});

  @override
  Widget build(BuildContext context) {
    TextStyle textStyleDefault = TextStyle(
      color: textColor ?? textColorDefault,
    );
    TextStyle textStyleCopy = textStyle != null
        ? textStyle!.copyWith(color: textStyle!.color ?? textColorDefault)
        : textStyleDefault;

    return (FilledButton(
      style: ButtonStyle(
        backgroundColor:
            MaterialStatePropertyAll(backgroundColor ?? backgroundColorDefault),
      ),
      onPressed: onPress,
      child: Text(
        text ?? '',
        style: textStyleCopy,
      ),
    ));
    // return (TextButton(
    //   style:
    //       const ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.zero)),
    //   onPressed: onPress,
    //   child: Container(
    //       height: height ?? heightDefault,
    //       width: double.infinity,
    //       decoration: BoxDecoration(
    //           color: backgroundColor ?? backgroundColorDefault,
    //           borderRadius: const BorderRadius.all(Radius.circular(5))),
    //       child: Center(
    //         child: Text(
    //           text ?? '',
    //           style: textStyleCopy,
    //         ),
    //       )),
    // ));
  }
}
