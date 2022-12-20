import 'dart:math';

import 'package:coba/app/data/model/popular_model.dart';
import 'package:coba/app/modules/home/controllers/home_controller.dart';
import 'package:coba/app/modules/home/widgets/card_food.dart';
import 'package:coba/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrendingNowItem extends GetView<HomeController> {
  const TrendingNowItem({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.isSelect,
    required this.data,
  });

  final String title;
  final String imageUrl;
  final bool isSelect;
  final ResultPopular data;

  @override
  Widget build(BuildContext context) {
    return CardFoods(
      tittle: title,
      rating: (Random().nextDouble() * (5 - 3) + 3).toStringAsFixed(1),
      imageUrl: imageUrl,
      favIcon: isSelect ? 'BookmarkActive.png' : 'BookmarkInactive.png',
      onTapFavIcon: () {
        controller.addToFav(data: data);
      },
      onTapImage: () {
        FocusScope.of(context).unfocus();
        Get.toNamed(Routes.DETAIL_RECIPE, arguments: title);
        controller.addToRecent(data: data);
      },
    );
  }
}
