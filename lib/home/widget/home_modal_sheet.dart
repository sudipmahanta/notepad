import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:notepad/home/widget/sub_task_ListTile.dart';
import 'package:notepad/utils/button.dart';
import 'package:notepad/utils/input_field.dart';

import '../../utils/todo_dropdown_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeModalSheetScreen extends StatefulWidget {
  const HomeModalSheetScreen({Key? key}) : super(key: key);

  @override
  State<HomeModalSheetScreen> createState() => _HomeModalSheetScreenState();
}

class _HomeModalSheetScreenState extends State<HomeModalSheetScreen> {

  final taskCategoryController = TextEditingController();
  final titleController = TextEditingController();
  final reminderDateController = TextEditingController(text: DateFormat('dd-MM-yyyy').format( DateTime.now()).toString());
  final reminderTimeController = TextEditingController(text: '12:00 AM');
  final descController = TextEditingController();
  String? defaultValue = 'All';
  List<String> dropDownItemList = ['All', 'Class', 'Gym', 'Groceries', 'Home', 'Meet Up', 'Shopping'];
  int listLength = 0;

  CollectionReference tasks = FirebaseFirestore.instance.collection('tasks');

  Future<void> addTasks() async {
    return tasks.add({
      'taskCategory': defaultValue.toString(),
      'title': titleController.text,
      'date': reminderDateController.text.toString(),
      'time': reminderTimeController.text.toString()
    }).then((value) => debugPrint('Updated')
   // const SnackBar(content: Text('Data Added Successfully'))
    ).catchError((error) => debugPrint('Failed')
    // const SnackBar(content: Text('Failed to add Task'))
    );
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 10, top: 10, right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom
          ),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text('New Task',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
                const Divider(),

                Text('Task Category', style: Theme.of(context).textTheme.titleMedium,),
                Container(
                  height: 47,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.0,
                      color: Colors.grey
                    ),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: defaultValue,
                      icon: const Icon(LineIcons.angleDown,
                        size: 14,
                      ),
                      items: dropDownItemList.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          defaultValue = newValue!;
                        });
                      },
                    ),
                  ),
                ),
                
                // KoalaDropDownButton(
                //   height: 40,
                //   width: width * 0.45,
                //   dialogPositionX: -0.90,
                //   dialogPositionY: 0.42,
                //   controller: taskCategoryController,
                //   suffixIcon: const Icon(LineIcons.angleDown,
                //     size: 18,
                //   ),
                //   defaultValue: defaultValue,
                //   dropDownItemList: dropDownItemList,
                // ),

                Text('Task Title', style: Theme.of(context).textTheme.titleMedium,),
                TextInputField(
                    width: double.maxFinite,
                    hintText: 'Task Title',
                    controller: titleController
                ),

                // DueDate & Time
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Date', style: Theme.of(context).textTheme.titleSmall),
                        PickerInputField(
                          pick: 'Date',
                          width: width * 0.45,
                          controller: reminderDateController,
                          prefixIcon: LineIcons.calendar
                        ),
                      ],
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Time', style: Theme.of(context).textTheme.titleSmall),
                        PickerInputField(
                          pick: 'Time',
                          width: width * 0.45,
                          controller: reminderTimeController,
                          prefixIcon: LineIcons.clock,
                        ),
                      ],
                    )
                  ],
                ),

                ConstrainedBox(
                  constraints: const BoxConstraints(minHeight: 110),
                  child: Column(
                    children: List.generate(listLength, (index) =>
                        SubTaskListTile(
                          controller: descController,
                          onPressTrailing: () {
                            setState(() {
                              listLength = listLength - 1;
                            });
                            debugPrint(listLength.toString());
                          },)
                    ),
                  ),
                ),

                TextButton.icon(
                    onPressed: () {
                      setState(() {
                        listLength = listLength + 1;
                      });
                      debugPrint(listLength.toString());
                    },
                    icon: const Icon(LineIcons.plus,
                      size: 18,
                    ),
                    label: const Text('Add Sub-Task')
                ),

                PrimaryButton(
                    width: width,
                    height: 47,
                    onPressed: () {
                      addTasks();
                      debugPrint(defaultValue.toString());
                      debugPrint(reminderDateController.toString());
                      debugPrint(reminderTimeController.toString());
                    },
                    // addTasks,
                    label: 'SUBMIT')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
