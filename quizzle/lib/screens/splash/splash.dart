import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quizzle/configs/configs.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        // decoration: BoxDecoration(gradient: mainGradient(context)),
        child: Center(
          child: Container(
            height: 180.0,
            width: 180.0,
            margin: const EdgeInsets.only(right: 20),
            decoration: const BoxDecoration(
                // shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage('assets/images/Sheth.png'),
                    fit: BoxFit.cover)),
          ),
        ),
      ),
    );
  }
}
