import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskList extends StatefulWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(10, (index) => TaskCardView(
        onTap: () {  },
        category: 'Shopping',
        title: 'Title',
        description: 'Description that will be longer than this',
        date: '22-01-2022',
        time: '09:00 AM',
        )
      ),
    );
  }
}

class TaskCardView extends StatelessWidget {
  final VoidCallback onTap;
  final String category;
  final String title;
  final String? description;
  final String date;
  final String time;
  const TaskCardView({Key? key, required this.onTap, required this.title, this.description, required this.date, required this.time, required this.category}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.4,
      color: Colors.grey.shade50,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(category,
                    style: const TextStyle(
                      fontSize: 10,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      color: Colors.deepOrange
                    ),
                  ),
                  Text(title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(
                    width: 210,
                    child: Text(description!,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(date.toString(),
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  Text(time.toString(),
                    style: Theme.of(context).textTheme.labelSmall,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

