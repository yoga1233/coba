import 'package:coba/app/modules/home/component/home_trending_now_item.dart';
import 'package:coba/app/modules/home/component/home_trending_now_item_shimmer.dart';
import 'package:coba/app/modules/home/controllers/home_controller.dart';
import 'package:coba/app/styles/styles.dart';
import 'package:coba/app/widgets/buttons/button_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TrendingNow extends GetView<HomeController> {
  const TrendingNow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 16.w,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Trending now 🔥',
                  style: TextStyles.title.copyWith(fontSize: 20.w),
                ),
                ButtonText(onTap: () {}),
              ],
            ),
          ),
          verticalSpace(16.h),
          SizedBox(
            height: 222.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Obx(() {
                  return Padding(
                    padding: EdgeInsets.only(right: 16.w),
                    child: controller.isLoadTrending.value
                        ? const TrendingNowItemShimmer()
                        : Obx(() {
                            return TrendingNowItem(
                              data:
                                  controller.trendingNow.value.results![index],
                              imageUrl: controller
                                  .trendingNow.value.results![index].thumb!,
                              title: controller
                                  .trendingNow.value.results![index].key!,
                              isSelect: controller.favItem.any(
                                (element) =>
                                    element ==
                                    controller
                                        .trendingNow.value.results![index],
                              ),
                            );
                          }),
                  );
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
