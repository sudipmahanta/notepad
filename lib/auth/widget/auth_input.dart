import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:line_icons/line_icons.dart';

import '../../utils/colors.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  const EmailTextField({Key? key, required this.controller, this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        cursorColor: secoundaryColor,
        cursorWidth: 1.5,
        cursorHeight: 20,
        cursorRadius: const Radius.circular(8),
        validator: (value){
          if(value!.isEmpty){
            /*Fluttertoast.showToast(
                msg: "Please Enter $hintText",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0
            );*/
            return 'Please Enter $hintText';
          } else{
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

class PasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;
  const PasswordTextField({Key? key, required this.controller, this.hintText}) : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {

  bool showPwd = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        controller: widget.controller,
        obscureText: showPwd,
        cursorColor: secoundaryColor,
        cursorWidth: 1.5,
        cursorHeight: 20,
        cursorRadius: const Radius.circular(8),
        toolbarOptions: const ToolbarOptions(
          cut: false,
          copy: false,
          paste: false,
          selectAll: false,
        ),
        keyboardType: TextInputType.text,
        validator: (value){
          if(value == null || value.isEmpty){
            return 'Please Enter ${widget.hintText}';
          }else{
            return null;
          }
        },
        decoration: InputDecoration(
          hintText: widget.hintText,
          suffixIcon: IconButton(
            onPressed: (){
              setState(() {
                showPwd = !showPwd;
              });},
            icon: Icon(showPwd ? LineIcons.eyeSlash : LineIcons.eye,
              size: 22,
              // color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

class MobileNumberInputField extends StatelessWidget {
  final double? width;
  final double? height;
  final TextEditingController controller;
  final String? hintText;
  const MobileNumberInputField({Key? key, this.width, this.height, required this.controller, this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        cursorColor: secoundaryColor,
        cursorWidth: 1.5,
        cursorHeight: 20,
        maxLength: 14,
        cursorRadius: const Radius.circular(8),
        validator: (value){
          if(value == null || value.isEmpty){
            return 'Please your $hintText';
          }else if(value.length > 14 || value.length < 14){
            return 'Enter valid Mobile Number';
          }else{
            return null;
          }
        },
        decoration: InputDecoration(
          counterText: '',
          hintText: hintText,
        ),
      ),
    );
  }
}
