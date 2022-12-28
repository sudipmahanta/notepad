import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:notepad/home/widget/home_input_field.dart';

class SubTaskListTile extends StatefulWidget {
  final VoidCallback onPressTrailing;
  final TextEditingController controller;
  const SubTaskListTile({Key? key, required this.controller, required this.onPressTrailing}) : super(key: key);

  @override
  State<SubTaskListTile> createState() => _SubTaskListTileState();
}

class _SubTaskListTileState extends State<SubTaskListTile> {
  bool check = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: ListTile(
        tileColor: Colors.grey.shade300,
        contentPadding: EdgeInsets.zero,
        horizontalTitleGap: 0,
        leading: Checkbox(
            value: check,
            onChanged: (value) {
              setState(() {
                check=!check;
              });
            }),
        title: SubTaskInputField(
            hintText: 'Add sub task',
            controller: widget.controller
        ),
        trailing: IconButton(
          onPressed: widget.onPressTrailing,
          icon: const Icon(LineIcons.times) ,
        ),
      ),
    );
  }
}
