import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';

class CustomInputField extends StatelessWidget {
  final IconData prefixIcon;
  final String label;
  final obscureText;

  const CustomInputField(
      {Key key,
      @required this.prefixIcon,
      @required this.label,
      @required this.obscureText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(paddingM),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.12),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.12),
          ),
        ),
        hintText: label,
        hintStyle: TextStyle(
          color: black.withOpacity(0.5),
          fontWeight: FontWeight.w500,
        ),
        prefixIcon: Icon(
          prefixIcon,
          color: black.withOpacity(0.5),
        ),
      ),
      obscureText: obscureText,
    );
  }
}
