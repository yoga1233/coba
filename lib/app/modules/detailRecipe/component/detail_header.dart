import 'package:coba/app/modules/detailRecipe/component/detail_header_shimmer.dart';
import 'package:coba/app/modules/detailRecipe/controllers/detail_recipe_controller.dart';
import 'package:coba/app/styles/styles.dart';
import 'package:coba/app/utils/app_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DetailHeader extends GetView<DetailRecipeController> {
  const DetailHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 19.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => Get.back(),
                  child: Image.asset(
                    AppAsset.icon('Arrow-Left.png'),
                    width: 24.w,
                    height: 24.w,
                    fit: BoxFit.fill,
                  ),
                ),
                Image.asset(
                  AppAsset.icon('More.png'),
                  width: 24.w,
                  height: 24.w,
                  fit: BoxFit.fill,
                ),
              ],
            ),
            verticalSpace(16.h),
            if (controller.isLoadRecipe.value)
              const DetailHeaderShimmer()
            else
              Text(
                controller.recipe.value.results!.title!,
                style: TextStyles.heading,
              ),
          ],
        ),
      );
    });
  }
}
