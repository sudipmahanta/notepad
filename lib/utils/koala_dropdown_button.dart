import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class KoalaDropDownButton extends StatefulWidget {
  const KoalaDropDownButton({Key? key}) : super(key: key);

  @override
  State<KoalaDropDownButton> createState() => _KoalaDropDownButtonState();
}

class _KoalaDropDownButtonState extends State<KoalaDropDownButton> {

  int? selectedIndex;
  String? initialDropDownVal;
  String dropdownValue = 'Workout';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.grey
        )
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: dropdownValue,
          // isExpanded: true,
          isDense: true,
          elevation: 1,
          icon: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: Icon(LineIcons.angleDown),
          ),
          borderRadius: BorderRadius.circular(10),
          iconSize: 14,
          items: <String>['All','Azure','Workout', 'Professional', 'Home', 'Ticket Booking']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: const TextStyle(fontSize: 12),
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
        ),
      ),
    );
  }
}
