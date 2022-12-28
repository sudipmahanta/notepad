import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'colors.dart';

class TextInputField extends StatelessWidget {
  final double? width;
  final String? hintText;
  final TextEditingController controller;
  const TextInputField({Key? key, this.width, this.hintText, required this.controller}) : super(key: key);

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

class PickerInputField extends StatefulWidget {
  final String pick;
  final double? width;
  final TextEditingController controller;
  final String? hintText;
  final IconData? prefixIcon;
  const PickerInputField({Key? key,
    required this.pick, required this.controller, this.prefixIcon, this.width, this.hintText}) : super(key: key);

  @override
  State<PickerInputField> createState() => _PickerInputFieldState();
}

class _PickerInputFieldState extends State<PickerInputField> {
  Future<void> reminderDate(String pick) async{
    if(pick == 'Date') {
      DateTime initialDate = DateTime.now();
      DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: initialDate, lastDate: DateTime(4000),
          firstDate: initialDate);
      if(pickedDate != null) {
        String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
        setState(() {
          widget.controller.text = formattedDate; //set output date to TextField value.
        });
      }else {
        widget.controller.text =  DateFormat('dd-MM-yyyy').format( DateTime.now()).toString();
      }
    }else if (pick == 'Time') {
      TimeOfDay? initialTime = TimeOfDay.now();
      TimeOfDay? pickedTime = await showTimePicker(
          context: context,
          initialTime: initialTime,
          initialEntryMode: TimePickerEntryMode.dial
      );
      if(pickedTime != null) {
        setState(() {
          widget.controller.text = pickedTime.format(context); //set output date to TextField value.
        });
      }else {
        widget.controller.text =  TimeOfDay.now().toString();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      margin: const EdgeInsets.only(top: 5, bottom: 10),
      child: TextFormField(
        onTap: () {
          reminderDate(widget.pick.toString());
        },
        controller: widget.controller,
        keyboardType: TextInputType.text,
        textAlign: TextAlign.center,
        textCapitalization: TextCapitalization.sentences,
        cursorColor: secoundaryColor,
        cursorWidth: 1.5,
        cursorHeight: 20,
        readOnly: true,
        cursorRadius: const Radius.circular(8),
        validator: (value){
          if(value == null || value.isEmpty){
            return 'Please Enter ${widget.hintText}';
          }else{
            return null;
          }
        },
        decoration: InputDecoration(
          hintText: widget.hintText,
          prefixIcon: Icon(widget.prefixIcon,
            size: 20,
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}

class MultiLineTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;

  const MultiLineTextField({Key? key, required this.controller, this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 10),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.text,
        textCapitalization: TextCapitalization.sentences,
        cursorColor: secoundaryColor,
        cursorWidth: 1.5,
        cursorHeight: 20,
        minLines: 4,
        maxLines: 10,
        cursorRadius: const Radius.circular(8),
        validator: (value){
          if(value == null || value.isEmpty){
            return 'Please Enter $hintText';
          }else{
            return null;
          }
        },
        decoration: InputDecoration(
          hintText: hintText
        ),
      ),
    );
  }
}