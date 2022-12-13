import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:notepad/utils/button.dart';
import 'package:notepad/utils/input_field.dart';

import '../utils/koala_dropdown_button.dart';

class HomeModalSheetScreen extends StatefulWidget {
  const HomeModalSheetScreen({Key? key}) : super(key: key);

  @override
  State<HomeModalSheetScreen> createState() => _HomeModalSheetScreenState();
}

class _HomeModalSheetScreenState extends State<HomeModalSheetScreen> {

  final titleController = TextEditingController();
  final reminderDateController = TextEditingController(text: DateFormat('dd-MM-yyyy').format( DateTime.now()).toString());
  final reminderTimeController = TextEditingController(text: TimeOfDay.now().toString());
  final descController = TextEditingController();
  String dropdownValue = 'Workout';


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height-
        (MediaQuery.of(context).padding.bottom +
            MediaQuery.of(context).padding.top);
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 10, top: 10, right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom),
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
              const KoalaDropDownButton(),


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

              Text('Description', style: Theme.of(context).textTheme.titleMedium),
              MultiLineTextField(
                  hintText: 'Desc',
                  controller: descController
              ),

              PrimaryButton(width: width, height: 47, onPressed: (){ }, label: 'SUBMIT')
            ],
          ),
        ),
      ),
    );
  }
}
