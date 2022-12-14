import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:notepad/home/home_appbar.dart';
import 'package:notepad/home/home_modal_sheet.dart';
import 'package:notepad/utils/button.dart';
import '../task/task_list.dart';
import '../utils/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime lastExitTime = DateTime.now();

    double width = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async{
        if (DateTime.now().difference(lastExitTime) >= const Duration(seconds: 2)) {
          const snack =  SnackBar(
            backgroundColor: primaryColor,
            content:  Text("Press the back button again to exist the app"),
            duration: Duration(seconds: 2),
          );
          ScaffoldMessenger.of(context).showSnackBar(snack);
          lastExitTime = DateTime.now();
          return false; // disable back press
        } else {
          return true; //  exit the app
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  HomeHeader(),

                  Text('Previous'),
                  TaskList(),

                  Text('Today'),
                  TaskList(),

                  Text('Upcoming'),
                  TaskList(),
                ],
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: KoalaFloatingActionButton(
          width: width * 0.95,
          height: 47,
          onPressed: () {
            debugPrint('Pressed');
            showModalBottomSheet(
              barrierColor: Colors.black38,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
            ),
              context: context,
              builder: (BuildContext context) {
                // Decoration of Modal BottomSheet
                return const HomeModalSheetScreen();
              },
            );
            },
          icon: LineIcons.plus,
          label: 'Add Task',
        ),
      ),
    );
  }
}
