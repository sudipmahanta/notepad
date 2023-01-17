import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class SubTaskInputField extends StatelessWidget {
  final double? width;
  final String? hintText;
  final TextStyle? style;
  final TextEditingController? controller;

  const SubTaskInputField(
      {Key? key,
        this.width,
        this.hintText,
        this.style,
        this.controller
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      color: Colors.grey.shade100,
      margin: const EdgeInsets.only(top: 5, bottom: 10),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.text,
        textCapitalization: TextCapitalization.sentences,
        cursorColor: secoundaryColor,
        cursorWidth: 1.5,
        cursorHeight: 20,
        cursorRadius: const Radius.circular(8),
        textAlignVertical: TextAlignVertical.center,
        style: style,
        minLines: 1,
        maxLines: 4,
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: Colors.grey.shade100,
          border: const OutlineInputBorder(
            borderSide: BorderSide.none
          ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide.none
          ),
          focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide.none
          ),
          disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide.none
          ),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide.none
          ),
        ),
      ),
    );
  }
}
