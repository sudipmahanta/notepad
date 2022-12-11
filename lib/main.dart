import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notepad/auth/login.dart';
import 'package:notepad/home/home_screen.dart';
import 'package:notepad/utils/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences pref = await SharedPreferences.getInstance();
  var email = pref.getString("email");
  debugPrint('Login Email: $email');
  runApp(MyApp(email: email,));
}

class MyApp extends StatelessWidget {
  final String? email;
  const MyApp({super.key, this.email});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.lightTheme,
        home: email == null ? const SplashScreen() : const HomeScreen()
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    Timer(
        const Duration(seconds: 4), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const  Spacer(),
          Image.asset('assets/images/nKoala.gif'),
          Text('Day start when you plan it!',
              style: Theme.of(context).textTheme.bodyMedium
          ),
          const Spacer(),
          Text('Powered by nSloth',
              style: Theme.of(context).textTheme.bodySmall
          ),
        ],
      ),
    );
  }
}