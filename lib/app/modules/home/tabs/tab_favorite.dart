import 'package:coba/app/modules/home/controllers/home_controller.dart';
import 'package:coba/app/utils/app_utils.dart';
import 'package:coba/app/widgets/cards/card_food.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabFavorite extends GetView<HomeController> {
  const TabFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: controller.favItem.length,
        itemBuilder: (context, index) {
          return CardFoods(
            tittle: controller.favItem[index]['title'],
            favIcon: 'BookmarkInactive.png',
            rating: '4.5',
            imageUrl: controller.favItem[index]['image_url'],
            onTap: () {
              controller.addToFav(
                title: controller.favItem[index]['title'],
                imageUrl: controller.favItem[index]['image_url'],
              );
            },
          );
        },
      );
    });
  }
}
