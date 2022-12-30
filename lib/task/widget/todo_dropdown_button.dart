import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:notepad/utils/colors.dart';

class KoalaDropDownButton extends StatefulWidget {
  final double width;
  final double height;
  final Icon? suffixIcon;
  final List<Widget> items;
  String value;

  KoalaDropDownButton({Key? key,
    required this.width,
    required this.height,
    this.suffixIcon,
    required this.value,
    required this.items
  }) : super(key: key);

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
      child: TextField(
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Align(
                  alignment: const Alignment(-0.90, 0.28),
                  child: Material(
                    shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10, top: 10),
                      child: SizedBox(
                        width: width * 0.40,
                        height: 220,
                        child: Column(
                          children: [
                            Container(
                              height: 170,
                              constraints: const BoxConstraints(minHeight: 80),
                              child: ListView(
                                  shrinkWrap: true,
                                  primary: true,
                                  physics: const AlwaysScrollableScrollPhysics(),
                                  children: widget.items,
                              ),
                            ),
                            SizedBox(
                              width: width,
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  setState(() {
                                    // widget.items.add('Jogging');
                                  });
                                  },
                                icon: const Icon(LineIcons.plus,
                                  size: 10,
                                ), label: const Text('Add More',), style: ElevatedButton.styleFrom(
                                  textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w500
                                  ),
                                  backgroundColor: secoundaryColor.withOpacity(0.4)
                              ),),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              });
          setState(() {
            widget.items;
          });
          },
        onChanged: (String value) {
          widget.value = value;
        },
        keyboardType: TextInputType.text,
        textCapitalization: TextCapitalization.sentences,
        cursorColor: secoundaryColor,
        cursorWidth: 1.5,
        cursorHeight: 20,
        readOnly: true,
        cursorRadius: const Radius.circular(8),
        decoration: InputDecoration(
          hintText: widget.value,
          hintStyle: const TextStyle(
            color: Colors.black
          ),
          suffixIcon: widget.suffixIcon,
        ),
      ),
    );
  }
}