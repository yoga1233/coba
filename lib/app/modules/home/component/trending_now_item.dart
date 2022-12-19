import 'dart:math';

import 'package:coba/app/data/model/popular_model.dart';
import 'package:coba/app/modules/home/component/trending_now_item_shimmer.dart';
import 'package:coba/app/modules/home/controllers/home_controller.dart';
import 'package:coba/app/widgets/cards/card_food.dart';
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
      onTap: () {
        controller.addToFav(data: data);
      },
    );
  }
}
