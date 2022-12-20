import 'package:coba/app/modules/home/component/home_header.dart';
import 'package:coba/app/modules/home/component/home_popular_category.dart';
import 'package:coba/app/modules/home/component/home_recent_recipes.dart';
import 'package:coba/app/modules/home/component/home_trending_now.dart';
import 'package:coba/app/modules/home/controllers/home_controller.dart';
import 'package:coba/app/styles/styles.dart';
import 'package:coba/app/widgets/inputs/input_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TabHome extends GetView<HomeController> {
  const TabHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(20.h),
          const HomeHeader(),
          verticalSpace(20.h),
          const InputSearch(),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () {
                return controller.pullToRefresh();
              },
              child: ListView(
                children: [
                  verticalSpace(20.h),
                  const TrendingNow(),
                  verticalSpace(12.h),
                  const PopularCategory(),
                  verticalSpace(12.h),
                  const RecentRecipes()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
