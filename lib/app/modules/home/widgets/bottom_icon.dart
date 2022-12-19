import 'package:coba/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class BottomIcon extends GetView<HomeController> {
  const BottomIcon({
    super.key,
    required this.activeIcon,
    required this.inActiveIcon,
    required this.index,
  });
  final String activeIcon;
  final String inActiveIcon;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          controller.goToPage(index);
        },
        child: Image.asset(
          controller.indexPage.value == index ? activeIcon : inActiveIcon,
          // color: controller.getIconColor(index),
          width: 24.w,
          height: 24.w,
          fit: BoxFit.fill,
        ),
      );
    });
  }
}
