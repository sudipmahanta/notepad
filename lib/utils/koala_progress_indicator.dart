import 'package:flutter/material.dart';
import 'package:notepad/utils/utils.dart';

class KoalaProgressIndicator extends StatelessWidget {
  const KoalaProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height-
        (MediaQuery.of(context).padding.bottom +
            MediaQuery.of(context).padding.top);
    return Container(
      width: double.maxFinite,
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(koalaImg,
            height: 220,
            width: 220,
          ),
          Text('Loading...',
            style: Theme.of(context).textTheme.headlineMedium,
          )
        ],
      ),
    );
  }
}
