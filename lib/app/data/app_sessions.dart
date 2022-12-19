import 'package:coba/app/services/db_service.dart';

class AppSessions {
  static bool isOnBoarding = true;

  static load() async {
    isOnBoarding = mainStorage.get('isOnBoarding') ?? true;
  }

  static setOnBoarding({required bool onBoarding}) async {
    await mainStorage.put('isOnBoarding', onBoarding);
    AppSessions.isOnBoarding = onBoarding;
  }
}
