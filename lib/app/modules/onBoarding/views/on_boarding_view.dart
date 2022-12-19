import 'package:coba/app/modules/onBoarding/controllers/on_boarding_controller.dart';
import 'package:coba/app/styles/styles.dart';
import 'package:coba/app/utils/app_asset.dart';
import 'package:coba/app/widgets/buttons/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OnBoardingView extends GetView<OnBoardingController> {
  const OnBoardingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            AppAsset.image('img_onBoard.png'),
            width: Get.width,
            height: Get.height,
            fit: BoxFit.fill,
          ),
          Positioned(
            top: 396.h,
            child: Container(
              width: Get.width,
              height: 416.h,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 82.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'cook\n#WithMe',
                  textAlign: TextAlign.center,
                  style: TextStyles.title.copyWith(
                    height: 1.2,
                    fontSize: 56.w,
                    fontWeight: FontWeights.semiBold,
                    color: Colors.white,
                  ),
                ),
                verticalSpace(15.h),
                Text(
                  'Find best recipes for cooking',
                  textAlign: TextAlign.center,
                  style: TextStyles.title.copyWith(
                    fontSize: 16.w,
                    fontWeight: FontWeights.regular,
                    color: Colors.white,
                  ),
                ),
                verticalSpace(32.h),
                ButtonPrimary(
                  width: 156.w,
                  height: 56.h,
                  radius: 8.w,
                  label: 'Get Started',
                  textStyle: TextStyles.title.copyWith(
                    fontSize: 16.w,
                    fontWeight: FontWeights.regular,
                    color: Colors.white,
                  ),
                  onTap: () => controller.goToMainPage(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
