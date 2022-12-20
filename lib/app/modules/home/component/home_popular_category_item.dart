import 'package:coba/app/data/model/popular_model.dart';
import 'package:coba/app/modules/home/controllers/home_controller.dart';
import 'package:coba/app/modules/home/widgets/card_popular.dart';
import 'package:coba/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PopularCategoriItem extends GetView<HomeController> {
  const PopularCategoriItem({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.isSelect,
    required this.data,
    required this.time,
  });

  final String title;
  final String imageUrl;
  final String time;
  final bool isSelect;

  final ResultPopular data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.w),
      child: CardPopular(
        imageUrl: imageUrl,
        tittle: title,
        time: time,
        iconFav: isSelect ? 'BookmarkActive.png' : 'BookmarkInactive.png',
        onTapIcon: () {
          controller.addToFav(data: data);
        },
        onTapImage: () {
          FocusScope.of(context).unfocus();
          Get.toNamed(Routes.DETAIL_RECIPE, arguments: title);
          controller.addToRecent(data: data);
        },
      ),
    );
  }
}
