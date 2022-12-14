import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class SubTaskInputField extends StatelessWidget {
  final double? width;
  final String? hintText;
  final TextEditingController controller;

  const SubTaskInputField(
      {Key? key,
        this.width,
        this.hintText,
        required this.controller
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: const EdgeInsets.only(top: 5, bottom: 10),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.text,
        textCapitalization: TextCapitalization.sentences,
        cursorColor: secoundaryColor,
        cursorWidth: 1.5,
        cursorHeight: 20,
        cursorRadius: const Radius.circular(8),
        // validator: (value){
        //   if(value == null || value.isEmpty){
        //     return 'Please Enter $hintText';
        //   }else{
        //     return null;
        //   }
        // },
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: hintText,
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
