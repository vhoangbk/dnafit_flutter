import 'dart:ffi';

import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  final String? hintText;
  final Function(String value)? onChanged;

  const TextInput({super.key, this.hintText, this.onChanged});

  @override
  State<TextInput> createState() => TextInputState();
}

class TextInputState extends State<TextInput> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(
        color: Colors.white,
      ),
      controller: _controller,
      onChanged: (value) {
        widget.onChanged!(value);
      },
      decoration: InputDecoration(
        hintStyle: const TextStyle(color: Colors.white30),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1.0),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1.0),
        ),
        hintText: widget.hintText,
      ),
    );
  }
}
