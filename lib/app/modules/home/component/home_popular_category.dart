import 'package:coba/app/modules/home/component/home_popular_category_item.dart';
import 'package:coba/app/modules/home/component/home_popular_category_item_shimmer.dart';
import 'package:coba/app/modules/home/controllers/home_controller.dart';
import 'package:coba/app/styles/colors.dart';
import 'package:coba/app/styles/styles.dart';
import 'package:coba/app/widgets/buttons/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PopularCategory extends GetView<HomeController> {
  const PopularCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        height: 355.h,
        padding: EdgeInsets.only(left: 16.w, top: 12.h, bottom: 12.h),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Text(
              'Popular category',
              style: TextStyles.title.copyWith(fontSize: 20.w),
            ),
            verticalSpace(19.h),
            SizedBox(
              height: 34.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.recipesCategory.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ButtonPrimary(
                    height: 34.h,
                    width: 90.w,
                    label: controller.recipesCategory[index]['category'],
                    color: controller.indexCategori.value == index
                        ? AppColors.primaryColor
                        : AppColors.whiteColor,
                    textStyle: TextStyles.title.copyWith(
                      fontSize: 12.w,
                      color: controller.indexCategori.value == index
                          ? AppColors.whiteColor
                          : AppColors.pinkColor,
                    ),
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      controller
                        ..setIndexCategory(index)
                        ..getPopular(
                          controller.recipesCategory[index]['key'],
                        );
                    },
                  ),
                ),
              ),
            ),
            verticalSpace(19.h),
            if (controller.isLoadPopular.value)
              SizedBox(
                height: 231.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 16.w),
                      child: const PopularCategoryItemShimmer(),
                    );
                  },
                ),
              )
            else
              SizedBox(
                height: 231.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.popular.value.results!.length,
                  itemBuilder: (context, index) {
                    return Obx(() {
                      return PopularCategoriItem(
                        title: controller.popular.value.results![index].key!,
                        imageUrl:
                            controller.popular.value.results![index].thumb!,
                        isSelect: controller.favItem.any(
                          (element) =>
                              element ==
                              controller.popular.value.results![index],
                        ),
                        data: controller.popular.value.results![index],
                        time: controller.popular.value.results![index].times!,
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
