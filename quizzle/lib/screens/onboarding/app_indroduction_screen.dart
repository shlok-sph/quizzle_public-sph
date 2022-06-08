import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quizzle/configs/configs.dart';
import 'package:quizzle/controllers/auth_controller.dart';
import 'package:quizzle/widgets/widgets.dart';
import 'package:quizzle/screens/home/dashboard.dart';

class AppIntroductionScreen extends GetView<AuthController> {
  const AppIntroductionScreen({Key? key}) : super(key: key);

  static const String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(),
      body: Container(
          constraints: const BoxConstraints(maxWidth: kTabletChangePoint),
          padding: const EdgeInsets.symmetric(horizontal: 30),
          alignment: Alignment.center,
          decoration: BoxDecoration(gradient: mainGradient(context)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 180.0,
                width: 180.0,
                margin: const EdgeInsets.only(right: 20),
                decoration: const BoxDecoration(
                    // shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/images/study_bg.png'),
                        fit: BoxFit.cover)),
              ),
              // SvgPicture.asset('assets/images/book.png'),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 60),
                child: Text(
                  'Welcome to SPH',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: kOnSurfaceTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
              ),
              MainButton(
                onTap: () {
                  controller.siginInWithGoogle();
                },
                color: Colors.white,
                child: Stack(
                  children: [
                    Positioned(
                        top: 0,
                        bottom: 0,
                        left: 0,
                        child: SvgPicture.asset(
                          'assets/icons/google.svg',
                        )),
                    Center(
                      child: Text(
                        'Sign in  with google',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              CircularButton(
                  onTap: () => Get.offAndToNamed(dashboard.routeName),
                  child: const Icon(
                    Icons.arrow_forward,
                    size: 35,
                  ))
            ],
          )),
    );
  }
}
