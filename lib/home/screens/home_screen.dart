import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:notepad/home/widget/home_appbar.dart';
import 'package:notepad/home/widget/home_modal_sheet.dart';
import 'package:notepad/utils/button.dart';
import '../../task/screens/task_list.dart';
import '../../utils/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime lastExitTime = DateTime.now();

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

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
        appBar: const HomeHeader(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text('Previous',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const TaskList(),
                  SizedBox(
                    height: height * 0.025,
                  ),

                  Text('Today',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const TaskList(),
                  SizedBox(
                    height: height * 0.025,
                  ),

                  Text('Upcoming',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const TaskList(),
                  SizedBox(
                    height: height * 0.1,
                  )
                ],
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: KoalaFloatingActionButton(
          width: width * 0.85,
          height: 47,
          onPressed: () {
            debugPrint('Pressed');
            showModalBottomSheet(
              barrierColor: Colors.black38,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20)
            )),
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
