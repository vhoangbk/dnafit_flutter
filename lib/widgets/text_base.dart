import 'package:flutter/material.dart';

class TextBase extends Text {

  String text = '';
  TextStyle? style;

  TextBase({required String text, TextStyle? style}) : super(text, style: style?.copyWith(fontFamily: 'AvenirNext')){
  }

}


