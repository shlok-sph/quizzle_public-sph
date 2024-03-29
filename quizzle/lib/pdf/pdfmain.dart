import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:quizzle/configs/configs.dart';
import 'package:quizzle/controllers/controllers.dart';
import 'package:quizzle/pdf/pdfveiwer.dart';
import 'package:quizzle/screens/screens.dart';
import 'package:quizzle/screens/home/dashboard.dart';
import 'package:quizzle/widgets/widgets.dart';
import 'package:quizzle/controllers/quiz_paper/pdf_controller.dart';
import 'package:quizzle/widgets/home/pdf_paper_card.dart';
import 'package:quizzle/models/pdf_model.dart';
import 'package:quizzle/qrscan/qrcode.dart';


class pdfmain extends GetView<MyDrawerController> {
  const pdfmain({Key? key}) : super(key: key);

  static const String routeName = '/pdfmain';

  @override
  Widget build(BuildContext context) {
    PdfController _quizePprContoller2 = Get.find();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.qr_code_outlined,
          ),
          onPressed: () => Get.offAndToNamed(qrcode.routeName),
        ),
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
                          // child: const Icon(AppIcons.menu),
                          child: const Icon(
                            Icons.home,
                            size: 25,
                          ),
                          onTap: () => Get.offAndToNamed(dashboard.routeName),
                        ),
                        // child: CircularButton(
                        //   child: const Icon(AppIcons.menuleft),
                        //   onTap: controller.toggleDrawer,
                        // ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(),
                      ),
                      const Text('My Books', style: kHeaderTS),
                      const SizedBox(height: 15),
                      const Divider(
                        color: Colors.white,
                        thickness: 2,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: ContentArea(
                      addPadding: false,
                      child: Obx(
                        () => LiquidPullToRefresh(
                          height: 150,
                          springAnimationDurationInMilliseconds: 500,
                          //backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.5),
                          onRefresh: () async {
                            _quizePprContoller2.getAllPapers();
                          },
                          child: ListView.separated(
                            padding: UIParameters.screenPadding,
                            shrinkWrap: true,
                            itemCount: _quizePprContoller2.allPapers.length,
                            itemBuilder: (BuildContext context, int index) {
                              return QuizPaperCard1(
                                model: _quizePprContoller2.allPapers[index],
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(
                                height: 20,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
