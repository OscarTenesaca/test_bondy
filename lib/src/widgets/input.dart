import 'package:flutter/material.dart';
import 'package:test_bondy/src/utils/utils_colors.dart';

class CustomInput extends StatefulWidget {
  final TextInputType textInputType;
  final double fontSize;
  final String labelText;
  final String hintText;
  final bool? filled;
  final bool readOnly;
  final bool obscured;
  final Color? filledColor;
  final TextEditingController? textEditingController;
  final TextCapitalization textCapitalization;
  final dynamic validator;

  const CustomInput({
    Key? key,
    required this.hintText,
    required this.validator,
    this.labelText = '',
    this.textEditingController,
    this.textCapitalization = TextCapitalization.none,
    this.obscured = false,
    this.readOnly = false,
    this.filled = true,
    this.filledColor = Colors.grey,
    this.textInputType = TextInputType.text,
    this.fontSize = 14,
  }) : super(key: key);

  @override
  State<CustomInput> createState() => _InputState();
}

class _InputState extends State<CustomInput> {
  bool _obscured = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: widget.textEditingController,
      autofocus: false,
      obscureText: _obscured,
      cursorColor: primaryColor(),
      keyboardType: widget.textInputType,
      textCapitalization: widget.textCapitalization,
      readOnly: widget.readOnly,
      style: TextStyle(
        color: Colors.black,
        // 12px
        fontSize: widget.fontSize,
        fontWeight: FontWeight.w300,
      ),
      decoration: InputDecoration(
        fillColor: widget.filledColor,
        filled: widget.filled,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontSize: widget.fontSize,
          color: Colors.grey,
        ),
        labelText: widget.labelText,
        labelStyle:
            const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)
              // Radius.circular(sizeWidth(context) * 0.1),
              ),
        ),
      ),
    );
  }
}
