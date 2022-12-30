import 'package:flutter/material.dart';
import 'package:notepad/utils/utils.dart';

class KoalaProgressIndicator extends StatelessWidget {
  final String text;
  const KoalaProgressIndicator({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(koalaImg,
          height: 220,
          width: 220,
        ),
        Text(text,
          style: Theme.of(context).textTheme.headlineMedium,
        )
      ],
    );
  }
}
