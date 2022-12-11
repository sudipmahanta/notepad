import 'package:flutter/material.dart';
import 'package:notepad/home/home_appbar.dart';
import '../utils/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime lastExitTime = DateTime.now();

    return WillPopScope(
      onWillPop: () async{
        if (DateTime.now().difference(lastExitTime) >= const Duration(seconds: 2)) {
          //showing message to user
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
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Column(
              children: const[
                HomeHeader(),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
