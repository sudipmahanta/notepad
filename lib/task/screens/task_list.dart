import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class TaskList extends StatefulWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {

  final key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(3, (index) => TaskCardView(
        index: index,
        onTap: () {
          debugPrint(index.toString());
        },
        title: 'Task -01',
        subtitle: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Icon(LineIcons.clock,
              size: 14,
            ),
            SizedBox(
              width: 10,
            ),
            Icon(LineIcons.calendar,
              size: 14,
            ),
            SizedBox(
              width: 10,
            ),
            Icon(LineIcons.bell,
              size: 14,
            ),
            SizedBox(
              width: 10,
            ),
            Icon(LineIcons.alternateRedo,
              size: 14,
            ),
            SizedBox(
              width: 10,
            ),
            Icon(LineIcons.paperclip,
              size: 14,
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        )
      ),
    );
  }
}

class TaskCardView extends StatefulWidget {
  final int index;
  final VoidCallback onTap;
  final String title;
  final Widget? subtitle;
  final Widget? trailing;

  const TaskCardView({Key? key,
    required this.onTap,
    required this.title,
    this.subtitle,
    this.trailing,
    required this.index}) : super(key: key);

  @override
  State<TaskCardView> createState() => _TaskCardViewState();
}

class _TaskCardViewState extends State<TaskCardView> {

  bool? groupValue = true;
  final key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.2,
      margin: const EdgeInsets.symmetric(vertical: 1.5),
      child: ListTile(
        onTap: widget.onTap,
        horizontalTitleGap: 0,
        minLeadingWidth: 0,
        contentPadding: EdgeInsets.zero,
        leading: Radio<bool>(
          toggleable: true,
            value: false,
            groupValue: groupValue,
            onChanged: (bool? value){
            setState(() {
              groupValue = value;
            });
          }),
        title: Text(widget.title,
          style: TextStyle(
            fontSize: Theme.of(context).textTheme.labelLarge!.fontSize,
            fontWeight: FontWeight.w500,
            decoration: groupValue == false ? TextDecoration.lineThrough : TextDecoration.none,
          ),
        ),
        subtitle: widget.subtitle,
        trailing: widget.trailing,
      )
    );
  }
}

