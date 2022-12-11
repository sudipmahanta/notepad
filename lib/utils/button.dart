import 'package:flutter/material.dart';

import 'colors.dart';

class PrimaryButton extends StatelessWidget {
  final double width;
  final double height;
  final String label;
  final VoidCallback onPressed;
  const PrimaryButton({Key? key, required this.width, required this.height, required this.onPressed, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ElevatedButton(
          onPressed: onPressed,
          child: Text(label,
            style: const TextStyle(
              color: secoundTextColor,
              fontWeight: FontWeight.w600
            ),
          ),
      ),
    );
  }
}