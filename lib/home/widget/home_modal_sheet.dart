import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:notepad/home/widget/sub_task_ListTile.dart';
import 'package:notepad/utils/button.dart';
import 'package:notepad/utils/input_field.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notepad/utils/todo_progress_indicator.dart';

import '../../task/widget/todo_dropdown_button.dart';
import '../../utils/colors.dart';

class HomeModalSheetScreen extends StatefulWidget {
  const HomeModalSheetScreen({Key? key}) : super(key: key);

  @override
  State<HomeModalSheetScreen> createState() => _HomeModalSheetScreenState();
}

class _HomeModalSheetScreenState extends State<HomeModalSheetScreen> {

  final taskCategoryController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController reminderDateController = TextEditingController(text: DateFormat('dd-MM-yyyy').format( DateTime.now()).toString());
  TextEditingController reminderTimeController = TextEditingController(text: '12:00 AM');
  TextEditingController descController = TextEditingController();
  String defaultValue = 'All';
  List<String> dropDownItemList = ['All', 'Class', 'Gym', 'Groceries', 'Home', 'Meet Up', 'Shopping'];
  int listLength = 0;

  bool progressIndicator = false;

  CollectionReference tasks = FirebaseFirestore.instance.collection('tasks');

  Future<void> addTasks() async{
    return tasks.add({
      'taskCategory': defaultValue.toString(),
      'title': titleController.text,
      'date': reminderDateController.text.toString(),
      'time': reminderTimeController.text.toString(),
    }).then((value) => debugPrint('Updated')
   // const SnackBar(content: Text('Data Added Successfully'))
    ).catchError((error) => debugPrint('Failed')
    // const SnackBar(content: Text('Failed to add Task'))
    );
  }

  void clearField() {
    defaultValue = 'All';
    titleController.clear();
    reminderDateController = TextEditingController(text: DateFormat('dd-MM-yyyy').format( DateTime.now()).toString());
    reminderTimeController = TextEditingController(text: '12:00 AM');
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only( bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: height * 0.75,
            padding: const EdgeInsets.only(left: 10, top: 10, right: 10,),
            color: Colors.white,
            child:  progressIndicator == true ? const Center(
                child: KoalaProgressIndicator(text: 'Uploading Task',)):
            Form(
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

                  Text('Task Category',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),

                  KoalaDropDownButton(
                    height: 40,
                    width: width * 0.45,
                    suffixIcon: const Icon(LineIcons.angleDown,
                      size: 18,
                    ),
                    value: defaultValue,
                    items: dropDownItemList.map((e) => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                      margin: const EdgeInsets.symmetric(vertical: 2.0),
                      decoration: BoxDecoration(
                          color: e.toString() == 'All' ?
                          secoundaryColor.withOpacity(0.4): primaryColor.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: GestureDetector(
                          onTap: (){
                            defaultValue = e;
                            setState(() { });
                            Navigator.pop(context);
                          },
                          child: Text(e,
                            style: TextStyle(
                                color: (e.toString() == 'All') ? Colors.white : Colors.black
                            ),)
                      ),)
                    ).toList(growable: true),
                  ),

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

                  Container(
                    height: 110,
                    constraints: const BoxConstraints(minHeight: 115),
                    child: ListView.builder(
                        itemCount: listLength,
                        itemBuilder: (context, index) {
                          return SubTaskListTile(
                            // controller: descController,
                            onPressTrailing: () {
                              setState(() {
                                listLength = listLength - 1;
                              });
                              debugPrint(listLength.toString());
                            });
                        })
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
                      onPressed: () async{
                        // if()
                        setState(() {
                          progressIndicator = true;
                        });
                        await addTasks();
                        clearField();
                        setState(() {
                          progressIndicator = false;
                        });
                      },
                      label: 'SUBMIT')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
