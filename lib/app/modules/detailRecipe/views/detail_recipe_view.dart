import 'package:coba/app/modules/detailRecipe/component/detail_header.dart';
import 'package:coba/app/modules/detailRecipe/component/detail_image.dart';
import 'package:coba/app/modules/detailRecipe/component/detail_image_shimmer.dart';
import 'package:coba/app/modules/detailRecipe/component/detail_ingredient.dart';
import 'package:coba/app/modules/detailRecipe/component/detail_ingredient_shimmer.dart';
import 'package:coba/app/modules/detailRecipe/controllers/detail_recipe_controller.dart';
import 'package:coba/app/styles/colors.dart';
import 'package:coba/app/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DetailRecipeView extends GetView<DetailRecipeController> {
  const DetailRecipeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(12.h),
              const DetailHeader(),
              Expanded(
                child: ListView(
                  children: [
                    if (controller.isLoadRecipe.value)
                      const DetailImageShimmer()
                    else
                      const DetailImage(),
                    if (controller.isLoadRecipe.value)
                      const DetailIngredienteShimmer()
                    else
                      const DetailIngredient(),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
