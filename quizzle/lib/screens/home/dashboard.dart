import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:quizzle/configs/configs.dart';
import 'package:quizzle/controllers/controllers.dart';
import 'package:quizzle/pdf/pdfmain.dart';
import 'package:quizzle/pdf/pdfveiwer.dart';
import 'package:quizzle/qrscan/qrcode.dart';
import 'package:quizzle/screens/screens.dart';
import 'package:quizzle/widgets/widgets.dart';
import 'custom_drawer.dart';

class dashboard extends GetView<MyDrawerController> {
  const dashboard({Key? key}) : super(key: key);

  static const String routeName = '/dashboard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.qr_code_outlined,
          ),
          onPressed: () => Get.offAndToNamed(qrcode.routeName),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: GetBuilder<MyDrawerController>(
          builder: (_) => ZoomDrawer(
            controller: _.zoomDrawerController,
            borderRadius: 50.0,
            showShadow: true,
            angle: 0.0,
            style: DrawerStyle.DefaultStyle,
            menuScreen: const CustomDrawer(),
            backgroundColor: Colors.white.withOpacity(0.5),
            slideWidth: MediaQuery.of(context).size.width * 0.6,
            mainScreen: Container(
              decoration: BoxDecoration(gradient: mainGradient(context)),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(kMobileScreenPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Transform.translate(
                            offset: const Offset(-10, 0),
                            child: CircularButton(
                              child: const Icon(AppIcons.menuleft),
                              onTap: controller.toggleDrawer,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: [
                                const Icon(AppIcons.peace),
                                Builder(
                                  builder: (_) {
                                    final AuthController _auth = Get.find();
                                    final user = _auth.getUser();
                                    String _label = '  Hello mate';
                                    if (user != null) {
                                      _label = '  Hello ${user.displayName}';
                                    }
                                    return Text(_label,
                                        style: kDetailsTS.copyWith(
                                            color: kOnSurfaceTextColor));
                                  },
                                ),
                              ],
                            ),
                          ),
                          const Text('Dashboard', style: kHeaderTS),
                          const SizedBox(height: 15),
                        ],
                      ),
                    ),
                    Container(
                      height: 50.0,
                      margin: const EdgeInsets.all(40),
                      child: RaisedButton(
                        onPressed: () =>
                            Get.offAndToNamed(HomeScreen.routeName),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80.0)),
                        padding: const EdgeInsets.all(5.0),
                        child: Ink(
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 255, 255, 255),
                                  Color.fromARGB(255, 255, 255, 255)
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.circular(30.0)),
                          child: Container(
                            constraints: const BoxConstraints(
                                maxWidth: 500.0, minHeight: 50.0),
                            alignment: Alignment.center,
                            child: const Text(
                              "MCQs",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 50.0,
                      margin: const EdgeInsets.all(40),
                      child: RaisedButton(
                        onPressed: () => Get.offAndToNamed(pdfmain.routeName),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80.0)),
                        padding: const EdgeInsets.all(5.0),
                        child: Ink(
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 255, 255, 255),
                                  Color.fromARGB(255, 255, 255, 255)
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.circular(30.0)),
                          child: Container(
                            constraints: const BoxConstraints(
                                maxWidth: 500.0, minHeight: 50.0),
                            alignment: Alignment.center,
                            child: const Text(
                              "Books",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Container(
                    //   height: 50.0,
                    //   margin: const EdgeInsets.all(40),
                    //   child: FloatingActionButton(
                    //     child: const Icon(
                    //       Icons.qr_code_outlined,
                    //     ),
                    //     onPressed: () => Get.offAndToNamed(qrcode.routeName),
                    //   ),
                    // ),
                    // Expanded(
                    //   child: Padding(
                    //     padding: const EdgeInsets.symmetric(horizontal: 8),
                    //     child: ContentArea(
                    //       addPadding: false,
                    //       child: Obx(
                    //         () => LiquidPullToRefresh(
                    //           height: 150,
                    //           springAnimationDurationInMilliseconds: 500,
                    //           //backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
                    //           color:
                    //               Theme.of(context).primaryColor.withOpacity(0.5),
                    //           onRefresh: () async {
                    //             _quizePprContoller.getAllPapers();
                    //           },
                    //           child: ListView.separated(
                    //             padding: UIParameters.screenPadding,
                    //             shrinkWrap: true,
                    //             itemCount: _quizePprContoller.allPapers.length,
                    //             itemBuilder: (BuildContext context, int index) {
                    //               return QuizPaperCard(
                    //                 model: _quizePprContoller.allPapers[index],
                    //               );
                    //             },
                    //             separatorBuilder:
                    //                 (BuildContext context, int index) {
                    //               return const SizedBox(
                    //                 height: 20,
                    //               );
                    //             },
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
