import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notepad/auth/widget/auth_input.dart';
import 'package:notepad/home/home_screen.dart';
import 'package:notepad/utils/koala_progress_indicator.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/button.dart';
import '../utils/colors.dart';
import '../utils/utils.dart';
import 'create_account.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool progressIndicator = false;

  final emailController = TextEditingController();
  final pwdController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height-
        (MediaQuery.of(context).padding.bottom +
            MediaQuery.of(context).padding.top);
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              height: height,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: progressIndicator == true ? const KoalaProgressIndicator() : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                 const Spacer(),

                  // Koala Image
                  SizedBox(
                    width: 165,
                    height: 165,
                    child: Image.asset(koalaImg,
                      fit: BoxFit.contain,
                    ),
                  ),

                  Text('Let start planning!',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text('People never became successful by',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),

                  Form(
                    key: formKey,
                      child: Column(
                        children: [
                          EmailTextField(
                              hintText: 'Email',
                              controller: emailController
                          ),

                          PasswordTextField(
                              hintText: 'Password',
                              controller: pwdController
                          ),
                        ],
                      )
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                        onPressed: (){},
                        child: const Text('Forget Password?',
                          style: TextStyle(
                            color: secoundTextColor,
                            fontWeight: FontWeight.w500
                          ),
                        )
                    ),
                  ),

                  PrimaryButton(
                    width: double.maxFinite,
                    height: height * 0.070,
                    label: 'Login',
                    onPressed: () {
                      login();
                    },
                  ),
                  const Spacer(),

                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: RichText(
                          text: TextSpan(
                              children: [
                                const TextSpan(
                                  text: 'Don\'t have an account? ',
                                  style: TextStyle(
                                      color: primaryTextColor,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w500
                                  )
                                ),
                                WidgetSpan(
                                    child: InkWell(
                                        onTap: () {
                                          Navigator.push(context, PageTransition(
                                              child: const CreateAccountScreen(),
                                              type: PageTransitionType.leftToRight));
                                        },
                                        child: const Text('Create Account',
                                            style: TextStyle(
                                                color: secoundTextColor,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w500
                                            )
                                        ))
                                )
                              ]
                          )
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
  void login() async{
    if(formKey.currentState!.validate()) {
      try{
        setState(() {
          progressIndicator = true;
        });
        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: pwdController.text);
        final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.setString('email', emailController.text);
        Navigator.push(context, PageTransition(
            child: const HomeScreen(),
            duration: Duration(milliseconds: 450),
            type: PageTransitionType.leftToRight)
        );
        final userDetails = credential.user;
        debugPrint(userDetails!.email);
        setState(() {
          progressIndicator = false;
        });
      }catch(e) {
        debugPrint(e.toString());
      }
    }
  }
}
