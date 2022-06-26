import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:quizzle/controllers/auth_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class MyDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();
  Rxn<User?> user = Rxn();

  void toggleDrawer() {
    zoomDrawerController.toggle?.call();
    update();
  }

  void signOut() {
    Get.find<AuthController>().signOut();
  }

  void signIn() {
    Get.find<AuthController>().navigateToLogin();
  }

  // void github() {
  //   _launch('https://github.com/CodeFoxLk');
  // }

  void email() {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'sales@shethbooks.com',
    );
    _launch(emailLaunchUri.toString());
  }

  void website() {
    _launch('https://www.shethbooks.com');
  }

  void address() {
    _launch('https://www.google.com/maps/dir//SHETH+Publishing+House,+Suyog+Industrial+Estate,+G%2F12,+Lal+Bahadur+Shastri+Rd,+opp.+Vitrum+Glass+Factory,+Vikhroli+(W,+Mumbai,+Maharashtra+400083/data=!4m6!4m5!1m1!4e2!1m2!1m1!1s0x3be7c7976aaaaaab:0x40309e7a620e3d31?sa=X&ved=2ahUKEwjExtDopMH4AhWECN4KHbhmApoQ48ADegQIAhAh');
  }

    void phone() {
    _launch('tel:+91 81693 27250');
  }


  @override
  void onReady() {
    user.value = Get.find<AuthController>().getUser();
    super.onReady();
  }

  Future<void> _launch(String url) async {
    if (!await launch(
      url,
    )) {
      throw 'Could not launch $url';
    }
  }
}
