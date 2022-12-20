import 'package:coba/app/modules/home/component/favorite_header.dart';
import 'package:coba/app/modules/home/component/favorite_list_favorite.dart';
import 'package:coba/app/modules/home/controllers/home_controller.dart';
import 'package:coba/app/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TabFavorite extends GetView<HomeController> {
  const TabFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const FavoriteHeader(),
        verticalSpace(12.h),
        const ListFavorite(),
        verticalSpace(12.h),
      ],
    );
  }
}
