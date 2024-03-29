import 'package:get/get.dart';
import 'package:quizzle/controllers/controllers.dart';
import 'package:quizzle/controllers/quiz_paper/pdf_controller.dart';
import 'package:quizzle/pdf/pdfmain.dart';
import 'package:quizzle/pdf/pdfveiwer.dart';
import 'package:quizzle/screens/home/Dashboard.dart';
import 'package:quizzle/screens/screens.dart';
import 'package:quizzle/qrscan/qrcode.dart';

class AppRoutes {
  static List<GetPage> pages() => [
        GetPage(
          page: () => const SplashScreen(),
          name: SplashScreen.routeName,
        ),
        GetPage(
          page: () => const AppIntroductionScreen(),
          name: AppIntroductionScreen.routeName,
        ),
        GetPage(
            page: () => const dashboard(),
            name: dashboard.routeName,
            binding: BindingsBuilder(() {
              Get.put(MyDrawerController());
            })),
        GetPage(
            page: () => const pdfmain(),
            name: pdfmain.routeName,
            binding: BindingsBuilder(() {
              Get.put(PdfController());
            })),
        GetPage(
          page: () => const pdfpage(),
          name: pdfpage.routeName,
        ),
        GetPage(
          page: () => qrcode(),
          name: qrcode.routeName,
        ),
        GetPage(
            page: () => const HomeScreen(),
            name: HomeScreen.routeName,
            binding: BindingsBuilder(() {
              Get.put(QuizPaperController());
              // Get.put(MyDrawerController());
            })),
        GetPage(page: () => const LoginScreen(), name: LoginScreen.routeName),
        GetPage(
            page: () => const ProfileScreen(),
            name: ProfileScreen.routeName,
            binding: BindingsBuilder(() {
              Get.put(QuizPaperController());
              Get.put(ProfileController());
            })),
        GetPage(
            page: () => LeaderBoardScreen(),
            name: LeaderBoardScreen.routeName,
            binding: BindingsBuilder(() {
              Get.put(LeaderBoardController());
            })),
        GetPage(
            page: () => const QuizeScreen(),
            name: QuizeScreen.routeName,
            binding: BindingsBuilder(() {
              Get.put<QuizController>(QuizController());
            })),
        GetPage(
            page: () => const AnswersCheckScreen(),
            name: AnswersCheckScreen.routeName),
        GetPage(
            page: () => const QuizOverviewScreen(),
            name: QuizOverviewScreen.routeName),
        GetPage(page: () => const Resultcreen(), name: Resultcreen.routeName),
      ];
}
