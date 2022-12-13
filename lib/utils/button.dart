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
              letterSpacing: 1.5,
              color: secoundTextColor,
              fontWeight: FontWeight.w600
            ),
          ),
      ),
    );
  }
}

class KoalaFloatingActionButton extends StatelessWidget {
  final double width;
  final double height;
  final VoidCallback onPressed;
  final IconData? icon;
  final String? label;
  const KoalaFloatingActionButton({Key? key, required this.width, required this.height, required this.onPressed, this.icon, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: FloatingActionButton.extended(
        onPressed: onPressed,
        splashColor: primaryColor,
        isExtended: true,
        extendedPadding: const EdgeInsets.symmetric(horizontal: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        icon: Icon(icon,
          size: 18,
          color: secoundaryColor,
        ),
        label: Text(label!,
          style: const TextStyle(
            letterSpacing: 1.5,
            fontWeight: FontWeight.w600,
            color: secoundTextColor,
          ),
        ),
      ),
    );
  }
}
