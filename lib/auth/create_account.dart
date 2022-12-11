import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notepad/auth/auth_model/auth_model.dart';
import 'package:notepad/auth/widget/auth_input.dart';
import 'package:notepad/utils/koala_progress_indicator.dart';
import '../utils/button.dart';
import '../utils/colors.dart';
import '../utils/input_field.dart';
import 'package:page_transition/page_transition.dart';

import 'login.dart';


class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {

  bool progressIndicator = false;

  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController(text: '+91-');
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final AuthenticationServices _authenticationServices = AuthenticationServices();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height-
        (MediaQuery.of(context).padding.bottom +
            MediaQuery.of(context).padding.top);
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: progressIndicator == true ? const KoalaProgressIndicator() :
            Container(
              width: double.maxFinite,
              height: height,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Spacer(),

                  Text('Welcome to nKoala!',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text('People never became successful by',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),

                  Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextInputField(
                            controller: nameController,
                            hintText: 'Name',
                          ),

                          MobileNumberInputField(
                            controller: phoneNumberController,
                            hintText: 'Mobile Number',
                          ),

                          EmailTextField(
                              hintText: 'Email',
                              controller: emailController
                          ),

                          PasswordTextField(
                              hintText: 'Password',
                              controller: passwordController
                          ),

                          PasswordTextField(
                              hintText: 'Confirm Password',
                              controller: confirmPasswordController
                          ),
                        ],
                      )
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                        onPressed: (){

                        },
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
                      debugPrint('Pressed');
                      if(formKey.currentState!.validate()) {
                        createKoala();
                      }else if(confirmPasswordController.toString() != passwordController.toString()) {
                        'Password does\'t match';
                      }else {
                        return;
                      }
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
                                    text: 'Already have an account? ',
                                    style: TextStyle(
                                        color: primaryTextColor,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w500
                                    )
                                ),
                                WidgetSpan(
                                    child: InkWell(
                                        onTap: () {

                                        },
                                        child: const Text('Login',
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
          ),
      ),
    );
  }

  void createKoala() async{
    try{
      setState(() {
        progressIndicator = true;
      });
      dynamic result = await _authenticationServices.createKoalaCredentials(
          nameController.text,
          phoneNumberController.text,
          emailController.text,
          passwordController.text
      );
      debugPrint(result.toString());
      Navigator.push(context, PageTransition(
          child:  const LoginScreen(),
          type: PageTransitionType.leftToRight)
      );
      setState(() {
        progressIndicator = false;
      });
    }on FirebaseAuthException catch(e) {
      setState(() {
        progressIndicator = true;
      });
      if(e.code == 'email-already-in-use') {
        const SnackBar(content: Text('User Already Exist'));
      } else if(e.code == 'invalid-email') {
        const SnackBar(content: Text('Invalid User'));
      } else if(e.code == 'weak-password') {
        const SnackBar(content: Text('Weak Password'));
      }else{

      }
      setState(() {
        progressIndicator = false;
      });
    }catch(e){
      debugPrint(e.toString());
    }
  }
}
