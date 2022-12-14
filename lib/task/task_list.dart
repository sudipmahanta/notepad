import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class TaskList extends StatefulWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(3, (index) => TaskCardView(
        onTap: () {
          debugPrint('TaskCardView');
        },
        title: 'Test',
        index: index,
        actions: Row(
          children: [
            Icon(LineIcons.clock,
              size: 12,
            )
          ],
        ),
        )
      ),
    );
  }
}

class TaskCardView extends StatefulWidget {
  final VoidCallback onTap;
  final String title;
  final Widget? actions;
  final int index;
  const TaskCardView({Key? key, required this.onTap, required this.title, this.actions, required this.index}) : super(key: key);

  @override
  State<TaskCardView> createState() => _TaskCardViewState();
}

class _TaskCardViewState extends State<TaskCardView> {

  bool? groupValue = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.2,
      color: Colors.grey.shade50,
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
            decoration: groupValue == false ? TextDecoration.lineThrough : TextDecoration.none,
          ),
        ),
        subtitle: widget.actions
      )
    );
  }
}

