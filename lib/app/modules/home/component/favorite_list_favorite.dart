import 'package:coba/app/modules/home/controllers/home_controller.dart';
import 'package:coba/app/modules/home/widgets/card_food.dart';
import 'package:coba/app/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ListFavorite extends GetView<HomeController> {
  const ListFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Expanded(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: controller.favItem.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: Key(index.toString()),
                direction: DismissDirection.endToStart,
                background: Container(
                  color: AppColors.whiteColor,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.delete_forever,
                      size: 100.w,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                confirmDismiss: (direction) async {
                  return controller.addToFav(data: controller.favItem[index]);
                },
                child: CardFoods(
                  width: 343.w,
                  height: 180.h,
                  marginBottom: 24.h,
                  tittle: controller.favItem[index].key ?? '',
                  favIcon: 'BookmarkActive.png',
                  rating: '4.5',
                  imageUrl: controller.favItem[index].thumb ?? '',
                  onTapFavIcon: () {
                    controller.addToFav(data: controller.favItem[index]);
                  },
                ),
              );
            },
          ),
        ),
      );
    });
  }
}
