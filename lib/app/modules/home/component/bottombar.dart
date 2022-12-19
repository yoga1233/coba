import 'package:coba/app/modules/home/controllers/home_controller.dart';
import 'package:coba/app/modules/home/widgets/bottom_icon.dart';
import 'package:coba/app/styles/colors.dart';
import 'package:coba/app/utils/app_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BottomMenuBar extends GetView<HomeController> {
  const BottomMenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 14.w,
      color: AppColors.backgroundColor,
      child: SizedBox(
        height: 106.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BottomIcon(
              activeIcon: AppAsset.icon('HomeActive.png'),
              inActiveIcon: AppAsset.icon('HomeInactive.png'),
              index: 0,
            ),
            BottomIcon(
              activeIcon: AppAsset.icon('BookmarkActive.png'),
              inActiveIcon: AppAsset.icon('BookmarkInactive.png'),
              index: 1,
            ),
            BottomIcon(
              activeIcon: AppAsset.icon('NotificationActive.png'),
              inActiveIcon: AppAsset.icon('NotificationInactive.png'),
              index: 2,
            ),
            BottomIcon(
              activeIcon: AppAsset.icon('ProfileActive.png'),
              inActiveIcon: AppAsset.icon('ProfileInactive.png'),
              index: 3,
            ),
          ],
        ),
      ),
    );
  }
}
