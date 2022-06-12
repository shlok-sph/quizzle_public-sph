import 'package:flutter/material.dart';
import 'package:flutter_qr_bar_scanner/qr_bar_scanner_camera.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quizzle/screens/home/dashboard.dart';

class qrcode extends StatefulWidget {
  static const String routeName = '/qrcode';
  @override
  _qrcodeState createState() => _qrcodeState();
}

class _qrcodeState extends State<qrcode> {
  String? _qrInfo = 'Scan the code from your book';
  bool camState = false;

  qrCallback(String? code) {
    setState(() {
      camState = false;
      _qrInfo = code;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      camState = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.offAndToNamed(dashboard.routeName),
        ),
        title: const Text('Scan your Book'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (camState == true) {
            setState(() {
              camState = false;
            });
          } else {
            setState(() {
              camState = true;
            });
          }
        },
        child: const Icon(Icons.camera),
      ),
      
      body: camState
          ? Center(
              child: SizedBox(
                height: 1000,
                width: 500,
                child: QRBarScannerCamera(
                  onError: (context, error) => Text(
                    error.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.red),
                  ),
                  qrCodeCallback: (code) {
                    qrCallback(code);
                  },
                ),
              ),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Code :" + _qrInfo!,
                    style: const TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
