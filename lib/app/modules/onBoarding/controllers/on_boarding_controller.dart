import 'package:coba/app/data/app_sessions.dart';
import 'package:coba/app/routes/app_pages.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  goToMainPage() {
    AppSessions.setOnBoarding(onBoarding: false);
    Get.offAllNamed(Routes.HOME);
  }
}
