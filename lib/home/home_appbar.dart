import 'package:flutter/material.dart';
import 'package:notepad/auth/auth_model/auth_model.dart';
import '../auth/login.dart';
import '../utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {

  final AuthenticationServices _authenticationServices = AuthenticationServices();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text('Hello Sudip,\nGood Morning!',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        GestureDetector(
          onTap: () {
            logOutKoala();
          },
          child: SizedBox(
            height: 60,
            width: 55,
            child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(profileImg)
                    ),
                    borderRadius: BorderRadius.circular(7),
                  ),
                )
            ),
          ),
        )
      ],
    );
  }

  Future<void> logOutKoala() async{
    dynamic result = await _authenticationServices.logOutKoala();
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    debugPrint("Cleared : ${result.toString()}");
    sharedPreferences.clear();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }
}
