import 'package:coba/app/modules/home/component/bottombar.dart';
import 'package:coba/app/modules/home/controllers/home_controller.dart';
import 'package:coba/app/modules/home/tabs/tab_favorite.dart';
import 'package:coba/app/modules/home/tabs/tab_home.dart';
import 'package:coba/app/modules/home/tabs/tab_notification.dart';
import 'package:coba/app/modules/home/tabs/tab_profile.dart';
import 'package:coba/app/styles/colors.dart';
import 'package:coba/app/utils/app_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      backgroundColor: AppColors.backgroundColor,
      floatingActionButton: SizedBox(
        height: 48.w,
        width: 48.w,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: AppColors.primaryColor,
            child: Image.asset(
              AppAsset.icon('Plus.png'),
              width: 14.w,
              height: 14.w,
              fit: BoxFit.fill,
            ),
            onPressed: () {
              //
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const BottomMenuBar(),
      body: SafeArea(
        bottom: false,
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (value) {
            controller.setPage(value);
          },
          controller: controller.pageController,
          children: const [
            TabHome(),
            TabFavorite(),
            TabNotification(),
            TabProfile(),
          ],
        ),
      ),
    );
  }
}
