import 'package:coba/app/modules/detailRecipe/controllers/detail_recipe_controller.dart';
import 'package:coba/app/modules/detailRecipe/widgets/widget_ingredient.dart';
import 'package:coba/app/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DetailIngredient extends GetView<DetailRecipeController> {
  const DetailIngredient({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Need Items',
                  style: TextStyles.heading,
                ),
                Text(
                  '${controller.recipe.value.results!.needItem!.length} Items',
                  style: TextStyles.regular
                      .copyWith(color: const Color(0xff919191)),
                ),
              ],
            ),
            verticalSpace(13.h),
            Column(
              children: [
                ...controller.recipe.value.results!.needItem!.map(
                  (e) => WidgetIngredient(
                    imageUrl: e.thumbItem!,
                    label: e.itemName!,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
