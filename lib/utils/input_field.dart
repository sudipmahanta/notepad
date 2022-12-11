import 'package:flutter/material.dart';

import 'colors.dart';

class TextInputField extends StatelessWidget {
  final double? width;
  final double? height;
  final String? hintText;
  final TextEditingController controller;
  const TextInputField({Key? key, this.width, this.height, this.hintText, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.text,
        textCapitalization: TextCapitalization.sentences,
        cursorColor: secoundaryColor,
        cursorWidth: 1.5,
        cursorHeight: 20,
        cursorRadius: const Radius.circular(8),
        validator: (value){
          if(value == null || value.isEmpty){
            return 'Please Enter $hintText';
          }else{
            return null;
          }
        },
        decoration: InputDecoration(
          hintText: hintText,
        ),
      ),
    );
  }
}


