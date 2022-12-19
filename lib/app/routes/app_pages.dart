import 'package:coba/app/modules/detailRecipe/bindings/detail_recipe_binding.dart';
import 'package:coba/app/modules/detailRecipe/views/detail_recipe_view.dart';
import 'package:coba/app/modules/home/bindings/home_binding.dart';
import 'package:coba/app/modules/home/views/home_view.dart';
import 'package:coba/app/modules/login/bindings/login_binding.dart';
import 'package:coba/app/modules/login/views/login_view.dart';
import 'package:coba/app/modules/onBoarding/bindings/on_boarding_binding.dart';
import 'package:coba/app/modules/onBoarding/views/on_boarding_view.dart';
import 'package:coba/app/modules/setting/bindings/setting_binding.dart';
import 'package:coba/app/modules/setting/views/setting_view.dart';
import 'package:get/get.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ON_BOARDING;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ON_BOARDING,
      page: () => const OnBoardingView(),
      binding: OnBoardingBinding(),
    ),
    GetPage(
      name: _Paths.SETTING,
      page: () => const SettingView(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_RECIPE,
      page: () => const DetailRecipeView(),
      binding: DetailRecipeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
  ];
}
