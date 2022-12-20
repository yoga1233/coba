import 'package:coba/app/modules/home/controllers/home_controller.dart';
import 'package:coba/app/modules/home/widgets/card_recent.dart';
import 'package:coba/app/routes/app_pages.dart';
import 'package:coba/app/styles/styles.dart';
import 'package:coba/app/widgets/buttons/button_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RecentRecipes extends GetView<HomeController> {
  const RecentRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        padding: EdgeInsets.only(left: 16.w, bottom: 3),
        height: 258.h,
        width: 375.w,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent recipe',
                    style: TextStyles.title.copyWith(fontSize: 20.w),
                  ),
                  ButtonText(onTap: () {}),
                ],
              ),
            ),
            verticalSpace(16.h),
            if (controller.recentItem.isEmpty)
              Text(
                'No recent recipes yet',
                style: TextStyles.regular,
              )
            else
              SizedBox(
                height: 190.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.recentItem.length >= 5
                      ? 5
                      : controller.recentItem.length,
                  itemBuilder: (context, index) {
                    return Obx(() {
                      return CardRecent(
                        imageUrl: controller.recentItem[index].thumb!,
                        label: controller.recentItem[index].key!,
                        onTap: () {
                          Get.toNamed(
                            Routes.DETAIL_RECIPE,
                            arguments: controller.recentItem[index].key,
                          );
                        },
                      );
                    });
                  },
                ),
              )
          ],
        ),
      );
    });
  }
}
