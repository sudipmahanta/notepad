import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:notepad/utils/colors.dart';

class KoalaDropDownButton extends StatefulWidget {
  final double width;
  final double height;
  final double dialogPositionX;
  final double dialogPositionY;
  final TextEditingController controller;
  final Icon? suffixIcon;
  final List<String> dropDownItemList;
  String defaultValue;
  KoalaDropDownButton({Key? key, required this.width, required this.height, required this.dialogPositionX, required this.dialogPositionY, required this.controller, this.suffixIcon, required this.defaultValue,required this.dropDownItemList}) : super(key: key);

  @override
  State<KoalaDropDownButton> createState() => _KoalaDropDownButtonState();
}

class _KoalaDropDownButtonState extends State<KoalaDropDownButton> {

  bool dialogOpen = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: widget.height,
      width: widget.width,
      margin: const EdgeInsets.only(top: 5, bottom: 10),
      child: TextFormField(
        onTap: () {
          showDialog(context: context, builder: (BuildContext context) {
            return Align(
              alignment: Alignment(widget.dialogPositionX,widget.dialogPositionY),
              child: Material(
                shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10, top: 10),
                  child: SizedBox(
                    width: width * 0.35,
                    height: 220,
                    child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        Container(
                          height: 170,
                          constraints: const BoxConstraints(minHeight: 80),
                          child: ListView(
                              shrinkWrap: true,
                              primary: true,
                              physics: const AlwaysScrollableScrollPhysics(),
                              children: widget.dropDownItemList.map((e) => Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                decoration: BoxDecoration(
                                    color: e.toString() == 'All' ? secoundaryColor.withOpacity(0.4) : primaryColor.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                child: InkWell(
                                    onTap: (){
                                      widget.defaultValue = e;
                                      setState(() { });
                                      Navigator.pop(context);
                                    },
                                    child: Text(e,
                                      style: TextStyle(
                                          color: (e.toString() == 'All') ? Colors.white : Colors.black
                                      ),

                                    )
                                ),
                              )).toList(growable: true)
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              widget.dropDownItemList.add('Jogging');
                            });
                          },
                          icon: const Icon(LineIcons.plus,
                            size: 10,
                          ),
                          label: const Text('Add More',),
                          style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w500
                              ),
                              backgroundColor: secoundaryColor.withOpacity(0.4)
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
          setState(() {
            widget.dropDownItemList;
          });
        },
        controller: widget.controller,
        keyboardType: TextInputType.text,
        textCapitalization: TextCapitalization.sentences,
        cursorColor: secoundaryColor,
        cursorWidth: 1.5,
        cursorHeight: 20,
        readOnly: true,
        cursorRadius: const Radius.circular(8),
        validator: (value){
          if(value == null || value.isEmpty){
            return 'Please choose a category';
          }else{
            return null;
          }
        },
        decoration: InputDecoration(
          hintText: widget.defaultValue,
          hintStyle: const TextStyle(
            color: Colors.black
          ),
          suffixIcon: widget.suffixIcon,
        ),
      ),
    );
  }
}