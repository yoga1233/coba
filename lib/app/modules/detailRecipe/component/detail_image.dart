import 'package:coba/app/modules/detailRecipe/controllers/detail_recipe_controller.dart';
import 'package:coba/app/styles/colors.dart';
import 'package:coba/app/styles/styles.dart';
import 'package:coba/app/utils/app_asset.dart';
import 'package:coba/app/widgets/others/load_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DetailImage extends GetView<DetailRecipeController> {
  const DetailImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        width: 375.w,
        height: 320.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 13.h),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: LoadImage(
                height: 200.w,
                width: 343.w,
                imageUrl: controller.recipe.value.results!.thumb,
              ),
            ),
            verticalSpace(16.h),
            Row(
              children: [
                Image.asset(
                  AppAsset.icon('Star.png'),
                  width: 16.w,
                  height: 16.w,
                ),
                horizontalSpace(3.h),
                Text(
                  '4,5',
                  style: TextStyles.title.copyWith(
                    fontSize: 14.w,
                    height: 1.4,
                    color: AppColors.blackColor,
                  ),
                ),
                horizontalSpace(8.h),
                Text(
                  '(300 Reviews)',
                  style: TextStyles.regular
                      .copyWith(color: const Color(0xff919191)),
                ),
              ],
            ),
            verticalSpace(16.h),
            Row(
              children: [
                CircleAvatar(
                  radius: 20.r,
                  backgroundImage: const NetworkImage(
                    'https://i.ibb.co/PGv8ZzG/me.jpg',
                  ),
                ),
                horizontalSpace(8.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.recipe.value.results!.author!.user!,
                      style: TextStyles.title.copyWith(fontSize: 16),
                    ),
                    Row(
                      children: [
                        Image.asset(
                          AppAsset.icon('Location.png'),
                          width: 16.w,
                          height: 16.w,
                        ),
                        horizontalSpace(3.w),
                        Text(
                          controller
                              .recipe.value.results!.author!.datePublished!,
                          style: TextStyles.regular
                              .copyWith(color: const Color(0xff919191)),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      );
    });
  }
}
